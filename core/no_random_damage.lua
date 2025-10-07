-- No Random Damage

settings["noRndDmg"] = false

local dropdown = options:add_checkbox("noRndDmg")
dropdown:add_getter(function()
    return settings["noRndDmg"]
end)
dropdown:add_setter(function(value)
    settings["noRndDmg"] = value
    file:write(settings)
end)


local ptr = gm.get_script_function_address(gm.constants.damager_calculate_damage)

memory.dynamic_hook_mid("GQoL.DamageCalculate.damager_calculate_damage", {"r14", "rbp+180h"}, {"RValue**", "RValue*"}, 0, ptr:add(0x30E0), function(args)
    if not settings["noRndDmg"] then return end
    
    local damage = memory.resolve_pointer_to_type(args[1]:add(24):deref():get_address(), "RValue*")
    args[3].value = damage  -- damage_fake
end)