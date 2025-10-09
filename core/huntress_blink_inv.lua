-- Huntress Blink Invulnerability

local packet = Packet.new("blinkInv")


settings.blinkInv = false

local checkbox = options:add_checkbox("blinkInv")
checkbox:add_getter(function()
    return settings.blinkInv
end)
checkbox:add_setter(function(value)
    settings.blinkInv = value
    file:write(settings)
    if Net.host then packet:send_to_all(settings.blinkInv) end
end)


local host_settings = false

packet:set_serializers(
    function(buffer, settings)
        buffer:write_ushort((settings and 1) or 0)
    end,

    function(buffer, player)
        host_settings = Util.bool(buffer:read_ushort())
    end
)

Hook.add_post(gm.constants.run_create, function(self, other, result, args)
    if Net.host then packet:send_to_all(settings.blinkInv) end
end)


local iframes = 15

Callback.add(Skill.find("huntressC").on_activate, function(actor, skill, slot)
    if Net.client then
        if not host_settings then return end
    elseif not settings.blinkInv then return end

    -- Give immunity frames
    if not actor.invincible then actor.invincible = 0 end
    actor.invincible = math.max(actor.invincible, iframes)
end)