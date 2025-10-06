-- Teleporter Color

local setting = 0


local colors = {
    Color(0xFF4934),    -- Standard red
    Color.YELLOW,
    Color.BLUE,
    Color(0x00FFFF),    -- Cyan
    Color.WHITE,
}

local function set_color()
    for _, part in ipairs{Particle.find("TeleporterDust"), Particle.find("TeleporterDust2")} do
        part:set_color1(colors[setting + 1])
    end
end


local dropdown = options:add_dropdown("tpColor")
dropdown:add_getter(function()
    return setting
end)
dropdown:add_setter(function(value)
    setting = value
    set_color(setting)
end)
dropdown:add_choice(
    "ui.options.gqol.tpColor.choice.red",
    "ui.options.gqol.tpColor.choice.yellow",
    "ui.options.gqol.tpColor.choice.blue",
    "ui.options.gqol.tpColor.choice.cyan",
    "ui.options.gqol.tpColor.choice.white"
)


Hook.add_post(gm.constants.run_create, function(self, other, result, args)
    set_color(setting)
end)