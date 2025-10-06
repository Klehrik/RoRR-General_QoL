-- Huntress Blink Invulnerability

local packet = Packet.new()


local setting = false

local dropdown = options:add_checkbox("blinkInv")
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


local iframes = 15

Callback.add(Skill.find("huntressC").on_activate, function(actor, skill, slot)
    if Net.client then
        if not host_setting then return end
    elseif not setting then return end

    -- Give immunity frames
    if not actor.invincible then actor.invincible = 0 end
    actor.invincible = math.max(actor.invincible, iframes)
end)