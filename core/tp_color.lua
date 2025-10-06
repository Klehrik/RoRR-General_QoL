-- Teleporter Color

local setting = 0

local dropdown = options:add_dropdown("tpColor")
dropdown:add_getter(function()
    return setting
end)
dropdown:add_setter(function(value)
    setting = value
end)
dropdown:add_choice(
    "ui.options.gqol.tpColor.choice.red",
    "ui.options.gqol.tpColor.choice.yellow",
    "ui.options.gqol.tpColor.choice.blue",
    "ui.options.gqol.tpColor.choice.cyan",
    "ui.options.gqol.tpColor.choice.white"
)


-- TODO