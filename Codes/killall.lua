local wl, players, parts = {"u73x", "5qea", "ReincarnatedEnergy"}, {}, {}

local plrs = game.Players
local plr = plrs.LocalPlayer
local bp = plr.Backpack

local chr = plr.Character
local hrp, hum, rs = chr.HumanoidRootPart, chr.Humanoid

for i, v in next, bp:GetChildren() do
    if v.Name == "Stroller" then
        v.Parent = chr
    end
end

repeat task.wait() until not bp:FindFirstChild("Stroller")

wait(1/4); hum:UnequipTools(); repeat task.wait() until not chr:FindFirstChildWhichIsA("Tool")

for i, v in next, plrs:GetPlayers() do
    if v ~= plr and not table.find(wl, v.Name) and v.Character and v.Character.Humanoid.Health > 0 then
        if not v.Character.Humanoid.Sit and not v.Character:FindFirstChild("Sitting") and not v.Character:FindFirstChild("Stroller") then
            table.insert(players, v.Character.HumanoidRootPart)
        end
    end
end

for index, value in next, bp:GetChildren() do
    if value.Name == "Stroller" then
        for i, v in next, value:GetChildren() do
            if v.Name == "Part" and v:FindFirstChild("Script") then
                table.insert(parts, v)
            end
        end
    end
end

if #parts <= 0 or (#players + #wl) + 1 <= 1 + #wl then
    return error'fail'
end

local block

for i, v in next, workspace["Police Station"]:GetChildren() do
    if v:IsA("BasePart") and v:FindFirstChild("Script") and v:FindFirstChild("TouchInterest") then
        block = v
        break
    end
end

rs = game:GetService("RunService").Heartbeat:Connect(function()
    pcall(function()
        chr:SetPrimaryPartCFrame(CFrame.new(-640, 53, 143.5) * CFrame.Angles(-1.5, 0, 0))
    end)
end)

for i, v in next, players do
    pcall(function()
        parts[i].Parent.Parent = chr
        firetouchinterest(v, parts[i], 1, task.wait(), firetouchinterest(v, parts[i], 0))
    end)
end

wait(3)
rs:Disconnect()
