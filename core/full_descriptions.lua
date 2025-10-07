-- Full Item Descriptions

settings["fullDesc"] = 0

local dropdown = options:add_dropdown("fullDesc")
dropdown:add_getter(function()
    return settings["fullDesc"]
end)
dropdown:add_setter(function(value)
    settings["fullDesc"] = value
    file:write(settings)
end)
dropdown:add_choice(
    "ui.options.gqol.fullDesc.choice.pickup",
    "ui.options.gqol.fullDesc.choice.desc",
    "ui.options.gqol.fullDesc.choice.both"
)


Hook.add_post(gm.constants.translate, function(self, other, result, args)
    if settings["fullDesc"] == 0
    or (not args[1].value:find("item"))
    or (not args[1].value:find("pickup")) then return end

    -- Full descriptions
    if settings["fullDesc"] == 1 then
        result.value = gm.translate(args[1].value:gsub("pickup", "description"))

    -- Pickup text + Full descriptions
    elseif settings["fullDesc"] == 2 then
        result.value = "<ul>"..result.value.."</c>\n\n"..gm.translate(args[1].value:gsub("pickup", "description"))

    end
end)