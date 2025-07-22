
-- https://raw.githubusercontent.com/gwnrdt/Test/refs/heads/main/Generated%20by%20.ftgs.lua

local Icons = {
    ["lucide"] = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/gwnrdt/Test/refs/heads/main/Generated%20by%20.ftgs.lua"))(),
    ["craft"] = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/gwnrdt/Test/refs/heads/main/Generated%20by%20.ftgs.lua"))(),
    
    
    -- More soon 
    -- 
}


local IconModule = {
    IconsType = "lucide" --
}

function IconModule.SetIconsType(iconType)
    IconModule.IconsType = iconType
end

function IconModule.Icon(Icon, Type) -- Type: optional
    local iconType = Icons[Type or IconModule.IconsType]
    
    if iconType.Icons[Icon] then
        return { iconType.Spritesheets[tostring(iconType.Icons[Icon].Image)], iconType.Icons[Icon] }
    end
    return nil
end

return IconModule
