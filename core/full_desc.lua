-- Full Item Descriptions

local setting = 0

local dropdown = options:add_dropdown("fullDesc")
dropdown:add_getter(function()
    return setting
end)
dropdown:add_setter(function(value)
    setting = value
end)
dropdown:add_choice(
    "ui.options.gqol.fullDesc.choice.pickup",
    "ui.options.gqol.fullDesc.choice.desc",
    "ui.options.gqol.fullDesc.choice.both"
)


Hook.add_post(gm.constants.translate, function(self, other, result, args)
    if setting == 0
    or (not args[1].value:find("item"))
    or (not args[1].value:find("pickup")) then return end

    -- Full descriptions
    if setting == 1 then
        result.value = gm.translate(args[1].value:gsub("pickup", "description"))

    -- Pickup text + Full descriptions
    elseif setting == 2 then
        result.value = "<ul>"..result.value.."</c>\n\n"..gm.translate(args[1].value:gsub("pickup", "description"))

    end
end)