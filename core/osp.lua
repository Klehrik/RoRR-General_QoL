-- One-Shot Protection

local packet = Packet.new()


local setting = false

local dropdown = options:add_checkbox("osp")
dropdown:add_getter(function()
    return setting
end)
dropdown:add_setter(function(value)
    setting = value
    if Net.host then packet:send_to_all(setting) end
end)


local host_setting = false

packet:set_serializers(
    function(buffer, setting)
        buffer:write_ushort((setting and 1) or 0)
    end,

    function(buffer, player)
        host_setting = Util.bool(buffer:read_ushort())
    end
)

Hook.add_post(gm.constants.run_create, function(self, other, result, args)
    if Net.host then packet:send_to_all(setting) end
end)


local osp_window    = 30
local iframes       = 45

DamageCalculate.add(Callback.Priority.AFTER, function(api)
    if Net.client then
        if not host_setting then return end
    elseif not setting then return end

    local actor = api.hit

    -- Check if player
    if actor:get_object_index() ~= gm.constants.oP then return end

    -- Check if shield is still active
    if actor.shield > 0 then return end

    local actor_data = Instance.get_data(actor)
    actor_data.threshold_for_osp_trigger = actor_data.threshold_for_osp_trigger or 0
    actor_data.frame_hit_below_threshold = actor_data.frame_hit_below_threshold or 0

    -- Check if below threshold
    local hp = actor.hp + actor.barrier
    local ninety = (actor.maxhp * 0.9) + actor.barrier
    local current_frame = Global._current_frame
    if  (hp < ninety)
    and ((current_frame - actor_data.frame_hit_below_threshold) > osp_window) then return end

    -- Save current frame and calculate OSP threshold
    -- if player will be knocked under 90% this attack
    if  (hp >= ninety)
    and (hp - api.damage) < ninety then
        actor_data.threshold_for_osp_trigger = hp - ninety
        actor_data.frame_hit_below_threshold = current_frame
    end

    -- Check if OSP threshold has been reached
    if (hp - api.damage) <= actor_data.threshold_for_osp_trigger then
        -- Clamp maximum damage to `ninety`
        api.damage_mult((hp - actor_data.threshold_for_osp_trigger) / api.damage)

        -- Give immunity frames
        if not actor.invincible then actor.invincible = 0 end
        actor.invincible = math.max(actor.invincible, iframes)
    end
end)