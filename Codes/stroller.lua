function anchor(tool, boolean)
    for i, v in next, tool:GetDescendants() do
        if v:IsA("BasePart") then
            if boolean == true and v.Anchored == false then
                v.Anchored = true
            elseif boolean == false and v.Anchored == true then
                v.Anchored = false
            end
        end
    end
end

workspace.FallenPartsDestroyHeight = 0/0

local plrs = game.Players
local plr = plrs.LocalPlayer
local bp = plr.Backpack

local chr = plr.Character
local hum, pp, cf = chr.Humanoid, chr.PrimaryPart, chr:GetModelCFrame()

chr:SetPrimaryPartCFrame(cf * CFrame.new(0, 100000, 0)); wait(1/2)

for i, v in next, bp:GetChildren() do
    if v.Name == "Stroller" then
        anchor(v, false)
        v.Parent = chr
    end
end

wait(1/4); hum:UnequipTools(); repeat task.wait() until not chr:FindFirstChildWhichIsA("Tool")

hum.Health = 0
wait(3)

task.spawn(function()
    for i, v in next, bp:GetChildren() do
        if v.Name == "Stroller" then
            v.Parent = chr
            v.Parent = workspace
            repeat task.wait() until v:IsDescendantOf(workspace)
            anchor(v, true)
        end
    end
end)

plr.CharacterAdded:Wait():WaitForChild("Humanoid")

chr = plr.Character
hum, pp = chr.Humanoid, chr.PrimaryPart

task.spawn(function()
    for i, v in next, workspace:GetChildren() do
        if v.Name == "Stroller" then
            anchor(v, false)
            repeat task.wait() until v.Handle.Anchored == false

            repeat task.wait()
                v.Handle.CFrame = pp.CFrame
                firetouchinterest(v.Handle, pp, 1, task.wait(), firetouchinterest(v.Handle, pp, 0))
            until v:IsDescendantOf(chr)

            hum:UnequipTools()
            repeat task.wait() until not chr:FindFirstChildWhichIsA("Tool")
        end
    end
end)

chr:SetPrimaryPartCFrame(cf)
