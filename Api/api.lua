if not (game:IsLoaded()) then
    repeat task.wait() until (game:IsLoaded())
end

if (game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")) then
    return (loadstring(game:HttpGet("https://raw.githubusercontent.com/FileExpIorer/LuaU/main/Api/normal.lua"))())
else
    return (loadstring(game:HttpGet("https://raw.githubusercontent.com/FileExpIorer/LuaU/main/Api/abnormal.lua"))())
end
