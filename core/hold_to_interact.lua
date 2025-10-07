-- Hold to Interact

local setting = false

local dropdown = options:add_checkbox("holdInteract")
dropdown:add_getter(function()
    return setting
end)
dropdown:add_setter(function(value)
    setting = value
end)


local cooldown_time = 20    -- In frames; prevent interacting every frame on the same interactable

gm.pre_code_execute("gml_Object_pInteractable_Collision_oP", function(self, other)
    if not setting then return end
    if (not other) or (not other.is_local) then return end
    current_interactable = self.id
end)

Hook.add_pre(gm.constants.control, function(self, other, result, args)
    if not setting then return end

    local current_frame = Global._current_frame
    local inst_data = Instance.get_data(current_interactable)
    inst_data.last_interact_frame = inst_data.last_interact_frame or 0

    if  (args[1].value == "interact")
    and (current_frame - inst_data.last_interact_frame > cooldown_time) then
        args[2].value = 0
        inst_data.last_interact_frame = current_frame
    end
end)