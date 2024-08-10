local plrs = game.Players
local plr = plrs.LocalPlayer

local chr = plr.Character

repeat task.wait()
    for i, v in next, workspace.Materials:GetDescendants() do
        if v.Name == "Hitbox" and v:IsA("BasePart") then
            for i = 1, 10 do
                task.wait()

                chr:SetPrimaryPartCFrame(v.CFrame)

                pcall(function()
                    firetouchinterest(v, chr.PrimaryPart, 0)
                end)
            end
        end
    end
until not chr
