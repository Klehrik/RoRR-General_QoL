-- One-Shot Protection

local setting = false

local dropdown = options:add_checkbox("osp")
dropdown:add_getter(function()
    return setting
end)
dropdown:add_setter(function(value)
    setting = value
end)