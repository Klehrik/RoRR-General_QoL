-- Sniper Autofire

local function set_snipe_autofire(setting)
    for _, skill in ipairs{65, 70} do   -- sniperZ and sniperZReload
        Skill.wrap(skill).require_key_press = ((setting == 0) and true) or false
    end
end


local setting = 0

local dropdown = options:add_dropdown("snipeAuto")
dropdown:add_getter(function()
    set_snipe_autofire(setting)
    return setting
end)
dropdown:add_setter(function(value)
    setting = value
    set_snipe_autofire(setting)
end)
dropdown:add_choice(
    "ui.options.gqol.snipeAuto.choice.manual",
    "ui.options.gqol.snipeAuto.choice.perfect",
    "ui.options.gqol.snipeAuto.choice.fast"
)


Hook.add_post(gm.constants.run_create, function(self, other, result, args)
    set_snipe_autofire(setting)
end)

Hook.add_pre(gm.constants.skill_activate, function(self, other, result, args)
    if setting ~= 1 then return end
    if args[1].value ~= Skill.Slot.PRIMARY then return end
    if not self.is_local then return end
    if self.class ~= 7 then return end

    -- Get reload bar belonging to this game client
    local bar
    local bars = Instance.find_all(gm.constants.oSniperBar)
    for _, b in ipairs(bars) do
        if self == b.parent then
            bar = b
            break
        end
    end
    if not bar then return end

    -- Prevent reloading before the white zone (while the bar is moving right)
    if bar.position < 17 and bar.pos_direction > 0 then return false end
end)