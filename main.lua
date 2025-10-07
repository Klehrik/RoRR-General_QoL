-- General QoL

mods["ReturnsAPI-ReturnsAPI"].auto{
    namespace   = "gqol",
    mp          = true
}

PATH = _ENV["!plugins_mod_folder_path"].."/"

local fn = function()
    hotloaded = true

    options = ModOptions.new()
    
    -- Require all files in core
    local names = path.get_files(PATH.."core")
    for _, name in ipairs(names) do require(name) end
end
Initialize.add(fn)
if hotloaded then fn() end