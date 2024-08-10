local api = (loadstring(game:HttpGet("https://raw.githubusercontent.com/FileExpIorer/LuaU/main/Api/api.lua"))())

local plrs = (game:GetService("Players"))
local plr = (plrs.LocalPlayer)

local rs
local loop = (false)
local loops = {}; table.clear(loops)
local utilities = {}; table.clear(utilities)

repeat task.wait() until (loop ~= true) and ((tonumber(#loops)) <= (0)) and ((tonumber(#utilities)) <= (0))

function property()
    local chr = plr.Character

    for i, v in next, chr:GetChildren() do
        if v:IsA("BasePart") then
            v.RotVelocity = Vector3.new(0, 0, 0)
            v.Velocity = Vector3.new(0, 0, 0)
        end
    end
end

insertCommand("prefix", function(prefix)
    api[tostring("prefix"):lower()][tostring("old"):lower()] = (tostring(api[tostring("prefix"):lower()][tostring("new"):lower()]):lower())
    api[tostring("prefix"):lower()][tostring("new"):lower()] = (tostring(prefix):lower())
end)

insertCommand("wl", function(getPlayer)
    for _, v in next, (plrs:GetPlayers()) do
        if v:IsA("Player") then
            if ((tostring(v["Name"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower()) or (tostring(v["DisplayName"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower())) then
                if not (table.find(api["wl"], (tostring(v["Name"])))) and not (table.find(api["wl"], (tostring(v["DisplayName"])))) and not (table.find(api["bl"], (tostring(v["DisplayName"])))) and not (table.find(api["bl"], (tostring(v["DisplayName"])))) then
                    getPlayer = (v)
                elseif ((table.find(api["bl"], (tostring(v["Name"])))) or (table.find(api["bl"], (tostring(v["DisplayName"]))))) then
                    for i, z in next, (api["bl"]) do
                        if (((tostring(z):lower()) == (tostring(v["Name"]):lower())) or ((tostring(z):lower()) == (tostring(v["DisplayName"]):lower()))) then
                            table.remove(api["bl"], (tonumber(i)))

                            repeat task.wait() until not (table.find(api["bl"], (tostring(v["Name"])))) and not (table.find(api["bl"], (tostring(v["DisplayName"]))))

                            getPlayer = (v["Name"])
                            break
                        end
                    end
                end
            end
        end
    end

    if (tostring(getPlayer):lower() ~= ("nil")) then
        table.insert(api["wl"], (tostring((getPlayer)["Name"])))
    end
end)

insertCommand("bl", function(getPlayer)
    for _, v in next, (plrs:GetPlayers()) do
        if v:IsA("Player") then
            if ((tostring(v["Name"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower()) or (tostring(v["DisplayName"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower())) then
                getPlayer = (v)
            end
        end
    end

    for _, v in next, (api["wl"]) do
        if (type(v) == ("string")) and ((table.find(api["wl"], (tostring((getPlayer)["Name"])))) or (table.find(api["wl"], (tostring((getPlayer)["DisplayName"]))))) then
            table.remove(api["wl"], (tonumber(_)))
            break
        end
    end

    if not (table.find(api["wl"], (tostring((getPlayer)["Name"])))) and not (table.find(api["wl"], (tostring((getPlayer)["DisplayName"])))) and not (table.find(api["bl"], (tostring((getPlayer)["Name"])))) and not (table.find(api["bl"], (tostring((getPlayer)["DisplayName"])))) then
        if not (tostring(getPlayer):lower() ~= ("nil")) then
            table.insert(api["bl"], (tostring((getPlayer)["Name"])))
        end
    end
end)

insertCommand("rj", function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(tonumber(game["PlaceId"]), (tostring(game["JobId"]):lower()), (plr))
end)

insertCommand("to", function(getPlayer)
    for _, v in next, (plrs:GetPlayers()) do
        if v:IsA("Player") then
            if ((tostring(v["Name"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower()) or (tostring(v["DisplayName"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower())) then
                getPlayer = (v)
            end
        end
    end

    pcall(function()
        if (loop) then
            loop = (false)
        end; rs:Disconnect()
    end)

    for i = 1, 15 do
        if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) and (plr.Character:FindFirstChild("HumanoidRootPart")) and ((getPlayer).Character) and ((tonumber((getPlayer).Character:FindFirstChild("Humanoid").Health)) > (0)) and ((getPlayer).Character:FindFirstChild("HumanoidRootPart")) then
            spawn(function()
                if (plr.Character:FindFirstChild("Humanoid").Sit) and ((tonumber((plr.Character:FindFirstChild("Humanoid").MoveDirection).Magnitude)) <= (0)) then
                    repeat task.wait()
                        plr.Character:FindFirstChild("Humanoid"):ChangeState(3)
                        plr.Character:FindFirstChild("Humanoid").Sit = (false)
                    until not (plr.Character:FindFirstChild("Humanoid").Sit)
                elseif (plr.Character:FindFirstChild("HumanoidRootPart").Anchored) then
                    plr.Character:FindFirstChild("Humanoid").Anchored = (false)
                end
            end)

            if (plr.Character:FindFirstChild("Humanoid").Sit or plr.Character:FindFirstChild("HumanoidRootPart").Anchored) then
                repeat task.wait() until not ((plr.Character:FindFirstChild("Humanoid").Sit) or (plr.Character:FindFirstChild("HumanoidRootPart").Anchored))
            end

            plr.Character:FindFirstChild("HumanoidRootPart").CFrame = (((getPlayer).Character:FindFirstChild("Head").CFrame) * CFrame.new(5, 0, 0))
            property()
        end; task.wait()
    end
end)

insertCommand("ride", function(getPlayer)
    for _, v in next, (plrs:GetPlayers()) do
        if v:IsA("Player") then
            if ((tostring(v["Name"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower()) or (tostring(v["DisplayName"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower())) then
                getPlayer = (v)
            end
        end
    end

    pcall(function()
        if (loop) then
            loop = (false)
        end; rs:Disconnect()
    end); loop = (true)

    pcall(function()
        while (loop) and task.wait() do
            if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) and (plr.Character:FindFirstChild("HumanoidRootPart")) and ((getPlayer).Character) and ((tonumber((getPlayer).Character:FindFirstChild("Humanoid").Health)) > (0)) and ((getPlayer).Character:FindFirstChild("HumanoidRootPart")) then
                if (plr.Character:FindFirstChild("Humanoid").Sit ~= (false)) and (plr.Character:FindFirstChild("HumanoidRootPart").Anchored ~= (true)) then
                    property()
                    plr.Character:FindFirstChild("HumanoidRootPart").CFrame = (((getPlayer).Character:FindFirstChild("Head").CFrame) * CFrame.new(0, 0, 1.25))
                else
                    plr.Character:FindFirstChild("Humanoid").Sit = (true)
                    plr.Character:FindFirstChild("HumanoidRootPart").Anchored = (false)
                end
            end
        end
    end)
end)

insertCommand("stop", function()
    if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) then
        if (plr.Character:FindFirstChildWhichIsA("Tool")) then
            repeat task.wait()
                plr.Character:FindFirstChild("Humanoid"):UnequipTools()
            until not (plr.Character:FindFirstChildWhichIsA("Tool"))
        end
    end

    pcall(function()
        for _, v in next, (loops) do
            if (v) then
                v = (false)
            end
        end; table.clear(loops)

        if (loop) then
            loop = (false)
        end; rs:Disconnect()
    end)
end)

insertCommand("reset", function(choice)
    if (choice == ("2")) then
        if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) and (plr.Character:FindFirstChild("HumanoidRootPart")) then
            local oldCF = plr.Character:FindFirstChild("HumanoidRootPart").CFrame; wait(1/2)

            plr.Character:FindFirstChild("Humanoid").Health = (0)
            plr.CharacterAdded:Wait(1):WaitForChild("HumanoidRootPart"); property()
            plr.Character:FindFirstChild("HumanoidRootPart").CFrame = (oldCF)
        end
    elseif (choice == ("host")) then
        pcall(function()
            if (loop) then
                loop = (false)
            end; rs:Disconnect()
        end)

        if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) and (plr.Character:FindFirstChild("HumanoidRootPart")) then
            plr.Character:FindFirstChild("Humanoid").Health = (0)
            plr.CharacterAdded:Wait(1):WaitForChild("HumanoidRootPart"); property()
            plr.Character:FindFirstChild("HumanoidRootPart").CFrame = (((api["fplr"]).Character:FindFirstChild("Head").CFrame) * CFrame.new(5, 0, 0))
        end
    else
        if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) then
            plr.Character:FindFirstChild("Humanoid").Health = (0)
        end
    end
end)

insertCommand("chat", function(msg)
    local getMsg = tostring(msg)

    if (type(getMsg) == ("string")) then
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(tostring(getMsg), "All")
    end
end)

insertCommand("exit", function()
    pcall(function()
        if (loop) then
            loop = (false)
        end; rs:Disconnect()
    end)

    plr:Kick("Kicked by: "..tostring(api["fplr"]["Name"]))
end)

insertCommand("sit", function()
    if not (plr.Character:FindFirstChild("Humanoid").Sit) then
        plr.Character:FindFirstChild("Humanoid").Sit = (true)
    end
end)

insertCommand("jump", function()
    plr.Character:FindFirstChild("Humanoid"):ChangeState(3)

    if (plr.Character:FindFirstChild("Humanoid").Sit) then
        plr.Character:FindFirstChild("Humanoid").Sit = (false)
    end
end)

insertCommand("follow", function(getPlayer)
    for _, v in next, (plrs:GetPlayers()) do
        if v:IsA("Player") then
            if ((tostring(v["Name"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower()) or (tostring(v["DisplayName"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower())) then
                getPlayer = (v)
            end
        end
    end

    pcall(function()
        if (loop) then
            loop = (false)
        end; rs:Disconnect()
    end); loop = (true)

    pcall(function()
        while (loop) and task.wait() do
            if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) and (plr.Character:FindFirstChild("HumanoidRootPart")) and ((getPlayer).Character) and ((tonumber((getPlayer).Character:FindFirstChild("Humanoid").Health)) > (0)) and ((getPlayer).Character:FindFirstChild("HumanoidRootPart")) then
                spawn(function()
                    if (plr.Character:FindFirstChild("Humanoid").Sit) and ((tonumber((plr.Character:FindFirstChild("Humanoid").MoveDirection).Magnitude)) <= (0)) then
                        repeat task.wait()
                            plr.Character:FindFirstChild("Humanoid"):ChangeState(3)
                            plr.Character:FindFirstChild("Humanoid").Sit = (false)
                        until not (plr.Character:FindFirstChild("Humanoid").Sit)
                    elseif (plr.Character:FindFirstChild("HumanoidRootPart").Anchored) then
                        plr.Character:FindFirstChild("Humanoid").Anchored = (false)
                    end
                end)

                if ((plr.Character:FindFirstChild("Humanoid").Sit) or (plr.Character:FindFirstChild("HumanoidRootPart").Anchored)) then
                    repeat task.wait() until not ((plr.Character:FindFirstChild("Humanoid").Sit) or (plr.Character:FindFirstChild("HumanoidRootPart").Anchored))
                end

                plr.Character:FindFirstChild("Humanoid"):MoveTo((getPlayer).Character:FindFirstChild("HumanoidRootPart").Position)

                if ((tonumber((plr.Character:FindFirstChild("HumanoidRootPart").Position - (getPlayer).Character:FindFirstChild("HumanoidRootPart").Position).Magnitude)) > (10)) then
                    property()
                    plr.Character:FindFirstChild("HumanoidRootPart").CFrame = ((getPlayer).Character:FindFirstChild("HumanoidRootPart").CFrame)
                end
            end
        end
    end)
end)

insertCommand("lay", function()
    pcall(function()
        if (loop) then
            loop = (false)
        end; rs:Disconnect()
    end)

    property()

    plr.Character:FindFirstChild("Humanoid").Sit = (true); wait(1/4)
    plr.Character:FindFirstChild("HumanoidRootPart").CFrame = ((plr.Character:FindFirstChild("HumanoidRootPart").CFrame) * CFrame.Angles(90, 0, 0))

    for _, v in next, (plr.Character:FindFirstChild("Humanoid"):GetPlayingAnimationTracks()) do
        v:Stop()
    end
end)

insertCommand("skill", function(getPlayer)
    if ((tonumber(game["PlaceId"])) == (1662219031)) then
        for _, v in next, (plrs:GetPlayers()) do
            if v:IsA("Player") then
                if ((tostring(v["Name"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower()) or (tostring(v["DisplayName"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower())) then
                    getPlayer = (v)
                end
            end
        end

        if not ((plr.Character) or (tonumber(plr.Character:FindFirstChild("Humanoid").Health) > 0)) and not (((getPlayer).Character) or ((tonumber((getPlayer).Character:FindFirstChild("Humanoid").Health)) > (0))) then
            repeat task.wait() until (plr.Character) and (tonumber(plr.Character:FindFirstChild("Humanoid").Health) > 0) and ((getPlayer).Character) and ((tonumber((getPlayer).Character:FindFirstChild("Humanoid").Health)) > (0))
        end

        if (plr.Character) and (tonumber(plr.Character:FindFirstChild("Humanoid").Health) > 0) and ((getPlayer).Character) and ((tonumber((getPlayer).Character:FindFirstChild("Humanoid").Health)) > (0)) then
            if (plr.Character:FindFirstChild("Humanoid").Sit) and ((tonumber((plr.Character:FindFirstChild("Humanoid").MoveDirection).Magnitude)) <= (0)) then
                repeat task.wait()
                    plr.Character:FindFirstChild("Humanoid"):ChangeState(3)
                    plr.Character:FindFirstChild("Humanoid").Sit = (false)
                until not (plr.Character:FindFirstChild("Humanoid").Sit)
            end

            if (((getPlayer).Character:FindFirstChild("Stroller")) or ((getPlayer).Character:FindFirstChild("Sitting"))) then
                repeat task.wait() until not ((getPlayer).Character:FindFirstChild("Stroller") or (getPlayer).Character:FindFirstChild("Sitting"))
            end

            task.spawn(function()
                local stroller = ((plr.Backpack:FindFirstChild("Stroller")) or (plr.Character:FindFirstChild("Stroller")))
                wait(1/2); plr.Character:FindFirstChild("Humanoid"):EquipTool(stroller); wait(3/20)

                rs = game:GetService("RunService").Heartbeat:Connect(function()
                    if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) and ((getPlayer).Character) and ((tonumber((getPlayer).Character:FindFirstChild("Humanoid").Health)) > (0)) then
                        if not (((getPlayer).Character:FindFirstChild("Stroller")) or ((getPlayer).Character:FindFirstChild("Sitting"))) then
                            (getPlayer).Character:FindFirstChild("HumanoidRootPart").CFrame = (((stroller):FindFirstChild("Handle").CFrame) * CFrame.new(0, -0.2, 3))

                            for _, v in next, ((stroller):GetDescendants()) do
                                if (v:IsA("BasePart") or v:IsA("Part")) and (v:IsDescendantOf(stroller)) then
                                    firetouchinterest(((getPlayer).Character["PrimaryPart"]), (v), (0))
                                end
                            end
                        end
                    else
                        rs:Disconnect()
                    end
                end)
            end)

            local newRs
            newRs = game:GetService("RunService").Heartbeat:Connect(function()
                plr.Character:SetPrimaryPartCFrame(CFrame.new(-640, 53, 143.5) * CFrame.Angles(-1.5, 0, 0)); property()

                if ((getPlayer).Character:FindFirstChild("Sitting")) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) <= (0)) then
                    pcall(function()
                        rs:Disconnect(); newRs:Disconnect()
                    end)
                end
            end)

            if not ((tonumber((getPlayer).Character:FindFirstChild("Humanoid").Health)) <= (0)) then
                repeat task.wait() until ((tonumber((getPlayer).Character:FindFirstChild("Humanoid").Health)) <= (0))
            end; wait(5/2)

            plr.Character:FindFirstChild("Humanoid"):ChangeState(15)
        end
    else
        return
    end
end)

insertCommand("svoid", function(getPlayer)
    if ((tonumber(game["PlaceId"])) == (1662219031)) then
        for _, v in next, (plrs:GetPlayers()) do
            if v:IsA("Player") then
                if ((tostring(v["Name"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower()) or (tostring(v["DisplayName"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower())) then
                    getPlayer = (v)
                end
            end
        end

        if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) then
            workspace.FallenPartsDestroyHeight = 0/0

            local saveCF = plr.Character:GetModelCFrame(); wait(1/4)

            plr.Character:SetPrimaryPartCFrame(CFrame.new(0, 10000, 0)); wait(1/2)
            workspace.Events.Morph.Player:FireServer("Sheep")

            local tool = ((plr.Backpack:FindFirstChild("Stroller")) or (plr.Character:FindFirstChild("Stroller")))
            plr.Character:FindFirstChild("Humanoid"):EquipTool(tool)

            function eliminate()
                if ((tool):IsDescendantOf(plr.Backpack)) then
                    plr.Character:FindFirstChild("Humanoid"):EquipTool(tool)
                end

                if ((getPlayer).Character) and ((tonumber((getPlayer).Character:FindFirstChild("Humanoid").Health)) > (0)) and ((getPlayer).Character:FindFirstChild("HumanoidRootPart")) then
                    if not ((getPlayer).Character:FindFirstChild("Stroller")) then
                        (getPlayer).Character:FindFirstChild("HumanoidRootPart").CFrame = (((tool):FindFirstChild("Handle").CFrame) * CFrame.new(0, -0.2, 3))

                        for _, v in next, ((tool):GetDescendants()) do
                            if v:IsA("Part") and (v:IsDescendantOf(tool)) then
                                firetouchinterest(((getPlayer).Character["PrimaryPart"]), (v), (0))
                            end
                        end

                        if ((getPlayer).Character:FindFirstChild("Sitting")) then
                            property(); plr.Character:SetPrimaryPartCFrame(CFrame.new(0, 9999999990, 0)); wait(1/2)

                            plr.Character:FindFirstChild("Humanoid"):UnequipTools(); wait(1/4)
                            plr.Character:SetPrimaryPartCFrame(saveCF)
                            rs:Disconnect()
                        end
                    end
                end
            end

            rs = game:GetService("RunService").Heartbeat:Connect(eliminate)
        end
    else
        return
    end
end)

insertCommand("sbring", function(getPlayer)
    if ((tonumber(game["PlaceId"])) == (1662219031)) then
        for _, v in next, (plrs:GetPlayers()) do
            if v:IsA("Player") then
                if ((tostring(v["Name"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower()) or (tostring(v["DisplayName"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower())) then
                    getPlayer = (v)
                end
            end
        end

        if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) then
            local tool = ((plr.Backpack:FindFirstChild("Stroller")) or (plr.Character:FindFirstChild("Stroller")))
            plr.Character:FindFirstChild("Humanoid"):EquipTool(tool); wait(3/20)

            function eliminate()
                if ((tool):IsDescendantOf(plr.Backpack)) then
                    plr.Character:FindFirstChild("Humanoid"):EquipTool(tool)
                end

                if ((getPlayer).Character) and ((tonumber((getPlayer).Character:FindFirstChild("Humanoid").Health)) > (0)) and ((getPlayer).Character:FindFirstChild("HumanoidRootPart")) then
                    if not ((getPlayer).Character:FindFirstChild("Stroller")) then
                        (getPlayer).Character:FindFirstChild("HumanoidRootPart").CFrame = (((tool):FindFirstChild("Handle").CFrame) * CFrame.new(0, -0.2, 3))

                        for _, v in next, ((tool):GetDescendants()) do
                            if (v:IsA("Part") or v:IsA("BasePart")) and (v:IsDescendantOf(tool)) then
                                firetouchinterest((getPlayer.Character["PrimaryPart"]), (v), (0))
                            end
                        end

                        if ((getPlayer).Character:FindFirstChild("Sitting")) then
                            task.spawn(function()
                                for i = 1, 25 do
                                    if (plr.Character:FindFirstChildWhichIsA("Tool")) then
                                        plr.Character:FindFirstChild("Humanoid"):UnequipTools()
                                    end; task.wait()
                                end
                            end); rs:Disconnect()
                        end
                    end
                end
            end

            rs = game:GetService("RunService").Heartbeat:Connect(eliminate)
        end
    else
        return
    end
end)

insertCommand("ignore", function(getPlayer)
    if not ((tostring(getPlayer):lower() == ("all")) or (tostring(getPlayer):lower() == ("others"))) then
        for _, v in next, (plrs:GetPlayers()) do
            if v:IsA("Player") then
                if ((tostring(v["Name"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower()) or (tostring(v["DisplayName"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower())) then
                    getPlayer = (v)
                end
            end
        end

        rs = game:GetService("RunService").Heartbeat:Connect(function()
            if (getPlayer) and ((getPlayer).Character) then
                (getPlayer).Character:Remove()
            end
        end)
    elseif ((tostring(getPlayer):lower() == ("all")) or (tostring(getPlayer):lower() == ("others"))) then
        rs = game:GetService("RunService").Heartbeat:Connect(function()
            for _, v in next, (plrs:GetPlayers()) do
                if (v:IsA("Player")) and (v:IsDescendantOf(plrs)) and (v.Character) then
                    if not (table.find(api["wl"], (tostring(v["Name"])))) and not (table.find(api["wl"], (tostring(v["DisplayName"])))) then
                        v.Character:Remove()
                    end
                end
            end
        end)
    end
end)

insertCommand("cbl", function()
    if (api["bl"]) then
        table.clear(api["bl"])
    end
end)

insertCommand("cwl", function()
    if (api["wl"]) then
        table.clear(api["wl"])
    end
end)

insertCommand("get", function(choice)
    if (tostring(choice):lower() == ("cmds")) then
        for _, v in next, (api["cmds"]) do
            print(_)
        end
    elseif (tostring(choice):lower() == ("wl")) then
        for _, v in next, (api["wl"]) do
            print(v)
        end
    elseif (tostring(choice):lower() == ("bl")) then
        for _, v in next, (api["bl"]) do
            warn(v)
        end
    end
end)

insertCommand("sdupe", function(amount)
    if ((tonumber(game["PlaceId"])) == (1662219031)) then
        if (type(tonumber(amount)) == ("number")) then
            if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) then
                local saveCF = (plr.Character:GetModelCFrame()); wait(1/4)

                for i = 1, (tonumber(amount)) do
                    if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) then
                        local stroller = ((plr.Character:FindFirstChild("Stroller")) or (plr.Backpack:FindFirstChild("Stroller")))

                        if (stroller) then
                            plr.Character:SetPrimaryPartCFrame(saveCF);
                            (stroller)["Parent"] = plr.Character; wait(1/4)

                            if (((api["fplr"]).Character:FindFirstChild("Stroller")) or ((api["fplr"]).Character:FindFirstChild("Sitting"))) then
                                repeat task.wait() until not (((api["fplr"]).Character:FindFirstChild("Stroller")) or ((api["plr"]).Character:FindFirstChild("Sitting")))
                            end

                            spawn(function()
                                rs = game:GetService("RunService").Heartbeat:Connect(function()
                                    if ((api["fplr"]).Character) and (tonumber(((api["fplr"]).Character:FindFirstChild("Humanoid").Health)) > (0)) and ((api["fplr"]).Character:FindFirstChild("HumanoidRootPart")) then
                                        if not ((api["fplr"]).Character:FindFirstChild("Stroller")) then
                                            for _, v in next, ((stroller):GetDescendants()) do
                                                if (v:IsA("Part") or v:IsA("BasePart")) and (v:IsDescendantOf(stroller)) then
                                                    firetouchinterest(((api["fplr"]).Character["PrimaryPart"]), (v), (0))
                                                end
                                            end

                                            if ((api["fplr"]).Character:FindFirstChild("Sitting")) then
                                                (stroller)["Parent"] = game:GetService("Workspace"); wait(1)
                                                plr.Character:FindFirstChild("Humanoid"):ChangeState(15)
                                                rs:Disconnect()
                                            end
                                        end
                                    end
                                end)
                            end)

                            plr.CharacterAdded:Wait(3/20):WaitForChild("Humanoid")

                            plr.Character:SetPrimaryPartCFrame(api["fplr"].Character:GetModelCFrame())

                            if ((tonumber(i)) == (tonumber(amount))) then
                                plr.Character:SetPrimaryPartCFrame(saveCF)
                            end
                        end
                    end; wait()
                end
            end
        end
    end
end)

insertCommand("cle", function(choice)
    if (tostring(choice):lower() == ("close")) then
        game:GetService("StarterGui"):SetCore("DevConsoleVisible", (false))
    else
        game:GetService("StarterGui"):SetCore("DevConsoleVisible", (true))
    end
end)

insertCommand("unequip", function()
    plr.Character:FindFirstChild("Humanoid"):UnequipTools()
end)

insertCommand("fling", function(getPlayer)
    if not ((tostring(getPlayer):lower() == ("all")) or (tostring(getPlayer):lower() == ("others"))) then
        for _, v in next, (plrs:GetPlayers()) do
            if v:IsA("Player") then
                if ((tostring(v["Name"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower()) or (tostring(v["DisplayName"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower())) then
                    getPlayer = (v)
                end
            end
        end

        pcall(function()
            if (loop) then
                loop = (false)
            end; rs:Disconnect()
        end)

        if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) and ((getPlayer).Character) and ((tonumber((getPlayer).Character:FindFirstChild("Humanoid").Health)) > (0)) then
            game:GetService("Workspace").FallenPartsDestroyHeight = (0/0)

            local saveCF = (plr.Character:GetModelCFrame()); wait(1/4)

            if ((plr.Character:FindFirstChild("Humanoid").Sit) and ((tonumber((plr.Character:FindFirstChild("Humanoid").MoveDirection).Magnitude)) <= (0))) then
                plr.Character:FindFirstChild("Humanoid"):ChangeState(3)
                plr.Character:FindFirstChild("Humanoid").Sit = (false)
            end; wait(1/4)

            if ((plr.Character:FindFirstChild("Humanoid").Sit) and ((tonumber((plr.Character:FindFirstChild("Humanoid").MoveDirection).Magnitude)) <= (0))) then
                repeat task.wait() until not (plr.Character:FindFirstChild("Humanoid").Sit)
            end

            pcall(function()
                rs = game:GetService("RunService").Heartbeat:Connect(function()
                    if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) and ((getPlayer).Character) and ((tonumber((getPlayer).Character:FindFirstChild("Humanoid").Health)) > (0)) then
                        if ((plr.Character:FindFirstChild("Humanoid").Sit) and ((tonumber((plr.Character:FindFirstChild("Humanoid").MoveDirection).Magnitude)) <= (0))) then
                            repeat task.wait()
                                plr.Character:FindFirstChild("Humanoid"):ChangeState(3)
                                plr.Character:FindFirstChild("Humanoid").Sit = (false)
                            until not (plr.Character:FindFirstChild("Humanoid").Sit)
                        end

                        local hrp = plr.Character:FindFirstChild("HumanoidRootPart")

                        if (hrp) then
                            hrp["Velocity"] = Vector3.new(8e8, 8e8, 8e8)
                            hrp["RotVelocity"] = Vector3.new(8e8, 8e8, 8e8)

                            plr.Character:SetPrimaryPartCFrame(getPlayer.Character:GetModelCFrame())
                        elseif not (hrp) then
                            rs:Disconnect()
                        end
                    elseif not (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) <= (0)) then
                        rs:Disconnect()
                    end
                end)
            end); wait(5/2); rs:Disconnect(); property()

            repeat task.wait()
                plr.Character:SetPrimaryPartCFrame(saveCF); property()
            until ((tonumber((plr.Character:FindFirstChild("HumanoidRootPart").Velocity).Magnitude)) <= (0)) and ((tonumber((plr.Character:FindFirstChild("HumanoidRootPart").RotVelocity).Magnitude)) <= (0))
        end
    elseif ((tostring(getPlayer):lower() == ("all")) or (tostring(getPlayer):lower() == ("others"))) then
        pcall(function()
            if (loop) then
                loop = (false)
            end; rs:Disconnect()
        end)

        if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) then
            game:GetService("Workspace").FallenPartsDestroyHeight = (0/0)

            local saveCF = (plr.Character:GetModelCFrame()); wait(1/4)

            if ((plr.Character:FindFirstChild("Humanoid").Sit) and ((tonumber((plr.Character:FindFirstChild("Humanoid").MoveDirection).Magnitude)) <= (0))) then
                plr.Character:FindFirstChild("Humanoid"):ChangeState(3)
                plr.Character:FindFirstChild("Humanoid").Sit = (false)
            end; wait(1/4)

            if ((plr.Character:FindFirstChild("Humanoid").Sit) and ((tonumber((plr.Character:FindFirstChild("Humanoid").MoveDirection).Magnitude)) <= (0))) then
                repeat task.wait() until not (plr.Character:FindFirstChild("Humanoid").Sit)
            end

            pcall(function()
                for _, v in next, (plrs:GetPlayers()) do
                    if v:IsA("Player") and not (table.find(api["wl"], (tostring(v["Name"])))) and not (table.find(api["wl"], (tostring(v["DisplayName"])))) and (v.Character) and ((tonumber(v.Character:FindFirstChild("Humanoid").Health)) > (0)) then
                        if ((plr.Character:FindFirstChild("Humanoid").Sit) and ((tonumber((plr.Character:FindFirstChild("Humanoid").MoveDirection).Magnitude)) <= (0))) then
                            plr.Character:FindFirstChild("Humanoid"):ChangeState(3)
                            plr.Character:FindFirstChild("Humanoid").Sit = (false)
                        end

                        if ((plr.Character:FindFirstChild("Humanoid").Sit) and ((tonumber((plr.Character:FindFirstChild("Humanoid").MoveDirection).Magnitude)) <= (0))) then
                            repeat task.wait() until not (plr.Character:FindFirstChild("Humanoid").Sit)
                        end

                        local counter = (0)

                        task.spawn(function()
                            rs = game:GetService("RunService").Heartbeat:Connect(function()
                                if ((tonumber(counter)) < (15)) and (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) then
                                    if ((plr.Character:FindFirstChild("Humanoid").Sit) and ((tonumber((plr.Character:FindFirstChild("Humanoid").MoveDirection).Magnitude) <= (0)))) then
                                        repeat task.wait()
                                            plr.Character:FindFirstChild("Humanoid"):ChangeState(3)
                                            plr.Character:FindFirstChild("Humanoid").Sit = (false)
                                        until not (plr.Character:FindFirstChild("Humanoid").Sit)
                                    end

                                    plr.Character:FindFirstChild("HumanoidRootPart").Velocity = Vector3.new(8e8, 8e8, 8e8)
                                    plr.Character:FindFirstChild("HumanoidRootPart").RotVelocity = Vector3.new(8e8, 8e8, 8e8)

                                    plr.Character:SetPrimaryPartCFrame(v.Character:GetModelCFrame())

                                    if ((tonumber(counter)) >= (15)) then
                                        rs:Disconnect()
                                    else
                                        game:GetService("RunService").Heartbeat:Wait()
                                        counter += (1)
                                    end
                                end
                            end)
                        end)

                        if not ((tonumber(counter)) >= (15)) then
                            repeat task.wait() until ((tonumber(counter)) >= (15))
                        else
                            rs:Disconnect()
                        end
                    end
                end
            end); rs:Disconnect(); property()

            repeat task.wait()
                plr.Character:SetPrimaryPartCFrame(saveCF); property()
            until ((tonumber((plr.Character:FindFirstChild("HumanoidRootPart").Velocity).Magnitude)) <= 0) and ((tonumber((plr.Character:FindFirstChild("HumanoidRootPart").RotVelocity).Magnitude)) <= (0))
        end
    end
end)

insertCommand("antis", function()
    if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) then
        pcall(function()
            rs = game:GetService("RunService").Heartbeat:Connect(function()
                if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) then
                    if ((plr.Character:FindFirstChild("Humanoid").Sit) and ((tonumber((plr.Character:FindFirstChild("Humanoid").MoveDirection).Magnitude)) <= (0))) then
                        plr.Character:FindFirstChild("Humanoid").Sit = (false)
                        plr.Character:FindFirstChild("Humanoid"):ChangeState(3)
                    end
                end
            end)
        end)
    end
end)

insertCommand("anchor", function(choice)
    if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) and (plr.Character:FindFirstChild("HumanoidRootPart")) then
        if (tostring(choice):lower() == ("false")) then
            if (plr.Character:FindFirstChild("HumanoidRootPart").Anchored) then
                plr.Character:FindFirstChild("HumanoidRootPart").Anchored = (false)
            end
        else
            plr.Character:FindFirstChild("HumanoidRootPart").Anchored = (true)
        end
    end
end)

insertCommand("lfling", function(getPlayer)
    if not ((tostring(getPlayer):lower() == ("all")) or (tostring(getPlayer):lower() == ("others"))) then
        for _, v in next, (plrs:GetPlayers()) do
            if v:IsA("Player") then
                if ((tostring(v["Name"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower()) or (tostring(v["DisplayName"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower())) then
                    getPlayer = (v)
                end
            end
        end

        pcall(function()
            if (loop) then
                loop = (false)
            end; rs:Disconnect()
        end)

        if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > 0) and ((getPlayer).Character) and ((tonumber((getPlayer).Character:FindFirstChild("Humanoid").Health)) > (0)) then
            local saveCF = (plr.Character:GetModelCFrame());

            game:GetService("Workspace").FallenPartsDestroyHeight = (0/0)

            if ((plr.Character:FindFirstChild("Humanoid").Sit) and ((tonumber((plr.Character:FindFirstChild("Humanoid").MoveDirection).Magnitude)) <= (0))) then
                plr.Character:FindFirstChild("Humanoid"):ChangeState(3)
                plr.Character:FindFirstChild("Humanoid").Sit = (false)
            end; wait(1/4)

            if ((plr.Character:FindFirstChild("Humanoid").Sit) and ((tonumber((plr.Character:FindFirstChild("Humanoid").MoveDirection).Magnitude)) <= (0))) then
                repeat task.wait() until not (plr.Character:FindFirstChild("Humanoid").Sit)
            end

            pcall(function()
                rs = game:GetService("RunService").Heartbeat:Connect(function()
                    if ((plr.Character:FindFirstChild("Humanoid").Sit) and (tonumber((plr.Character:FindFirstChild("Humanoid").MoveDirection).Magnitude) <= (0))) then
                        repeat task.wait()
                            plr.Character:FindFirstChild("Humanoid"):ChangeState(3)
                            plr.Character:FindFirstChild("Humanoid").Sit = (false)
                        until not (plr.Character:FindFirstChild("Humanoid").Sit)
                    end

                    if not (plrs:FindFirstChild(tostring((getPlayer)["Name"]))) then
                        rs:Disconnect()

                        if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) and (plr.Character:FindFirstChild("HumanoidRootPart")) then
                            repeat task.wait()
                                plr.Character:SetPrimaryPartCFrame(saveCF); property()
                            until ((tonumber(plr.Character:FindFirstChild("HumanoidRootPart").Velocity).Magnitude) <= (0)) and ((tonumber(plr.Character:FindFirstChild("HumanoidRootPart").RotVelocity).Magnitude) <= (0))
                        end
                    elseif not ((getPlayer).Character) and ((tonumber((getPlayer).Character:FindFirstChild("Humanoid").Health)) > (0)) then
                        repeat task.wait() until ((getPlayer).Character) and ((tonumber((getPlayer).Character:FindFirstChild("Humanoid").Health)) > (0))
                    end

                    if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) then
                        plr.Character:FindFirstChild("HumanoidRootPart").Velocity = Vector3.new(8e8, 8e8, 8e8)
                        plr.Character:FindFirstChild("HumanoidRootPart").RotVelocity = Vector3.new(8e8, 8e8, 8e8)

                        plr.Character:SetPrimaryPartCFrame((getPlayer).Character:GetModelCFrame())
                    else
                        rs:Disconnect()
                    end
                end)
            end)
        end
    elseif ((tostring(getPlayer):lower() == ("all")) or (tostring(getPlayer):lower() == ("others"))) then
        game:GetService("Workspace")["FallenPartsDestroyHeight"] = (0/0)

        pcall(function()
            if (loop) then
                loop = (false)
            end; rs:Disonnect()
        end); loop = (true)

        pcall(function()
            while (loop) and task.wait() do
                if not (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) <= (0)) then
                    repeat task.wait() until (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0))
                end

                if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) then
                    task.spawn(function()
                        if ((plr.Character:FindFirstChild("Humanoid").Sit) or (plr.Character:FindFirstChild("HumanoidRootPart").Anchored)) and ((tonumber((plr.Character:FindFirstChild("Humanoid").MoveDirection).Magnitude)) <= (0)) then
                            repeat task.wait()
                                plr.Character:FindFirstChild("Humanoid"):ChangeState(3)
                                plr.Character:FindFirstChild("Humanoid").Sit = (false)
                                plr.Character:FindFirstChild("HumanoidRootPart").Anchored = (false)
                            until not (plr.Character:FindFirstChild("Humanoid").Sit) and not (plr.Character:FindFirstChild("HumanoidRootPart").Anchored)
                        end
                    end)

                    if (plr.Character:FindFirstChild("Humanoid").Sit or plr.Character:FindFirstChild("HumanoidRootPart").Anchored) then
                        repeat task.wait() until not ((plr.Character:FindFirstChild("Humanoid").Sit) or (plr.Character:FindFirstChild("HumanoidRootPart").Anchored))
                    end

                    for _, v in next, (plrs:GetPlayers()) do
                        if v:IsA("Player") and not (table.find(api["wl"], (tostring(v["Name"])))) and not (table.find(api["wl"], (tostring(v["DisplayName"])))) then
                            local counter = (0)

                            task.spawn(function()
                                rs = game:GetService("RunService").Heartbeat:Connect(function()
                                    if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) and (v.Character) and ((tonumber(v.Character:FindFirstChild("Humanoid").Health)) > (0)) then
                                        if ((tonumber(counter)) < (10)) then
                                            task.spawn(function()
                                                if ((plr.Character:FindFirstChild("Humanoid").Sit) or (plr.Character:FindFirstChild("HumanoidRootPart").Anchored)) and ((tonumber((plr.Character:FindFirstChild("Humanoid").MoveDirection).Magnitude)) <= (0)) then
                                                    plr.Character:FindFirstChild("Humanoid"):ChangeState(3)
                                                    plr.Character:FindFirstChild("Humanoid").Sit = (false)
                                                    plr.Character:FindFirstChild("HumanoidRootPart").Anchored = (false)
                                                end

                                                if (plr.Character:FindFirstChild("HumanoidRootPart")) then
                                                    plr.Character:FindFirstChild("HumanoidRootPart").Velocity = Vector3.new(8e8, 8e8, 8e8)
                                                    plr.Character:FindFirstChild("HumanoidRootPart").RotVelocity = Vector3.new(8e8, 8e8, 8e8)
                                                end
                                            end)

                                            plr.Character:SetPrimaryPartCFrame(v.Character:GetModelCFrame())

                                            if ((tonumber(counter)) >= (10)) then
                                                rs:Disconnect()
                                            else
                                                game:GetService("RunService").Heartbeat:Wait(3/20)
                                                counter += (1)
                                            end
                                        end
                                    else
                                        rs:Disconnect()
                                        counter += (10)
                                    end
                                end)
                            end)

                            if not ((tonumber(counter)) >= (10)) then
                                repeat task.wait() until ((tonumber(counter)) >= (10))
                            end

                            pcall(function()
                                rs:Disconnect()
                            end)
                        end
                    end
                end
            end
        end)
    end
end)

insertCommand("rwl", function(getPlayer)
    for _, v in next, (plrs:GetPlayers()) do
        if v:IsA("Player") then
            if ((tostring(v["Name"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower()) or (tostring(v["DisplayName"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower())) then
                if (table.find(api["wl"], (tostring(v["Name"])))) and (table.find(api["wl"], (tostring(v["DisplayName"])))) then
                    getPlayer = (v)
                end
            end
        end
    end

    for _, v in next, (api["wl"]) do
        if (table.find(api["wl"], (tostring((getPlayer)["Name"])))) and (table.find(api["wl"], (tostring((getPlayer)["DisplayName"])))) then
            table.remove(api["wl"], (tonumber(_)))
        end
    end
end)

insertCommand("rbl", function(getPlayer)
    for _, v in next, (plrs:GetPlayers()) do
        if v:IsA("Player") then
            if ((tostring(v["Name"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower()) or (tostring(v["DisplayName"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower())) then
                if (table.find(api["bl"], (tostring(v["Name"])))) and (table.find(api["bl"], (tostring(v["DisplayName"])))) then
                    getPlayer = (v)
                end
            end
        end
    end

    for _, v in next, (api["bl"]) do
        if (table.find(api["bl"], (tostring((getPlayer)["Name"])))) and (table.find(api["bl"], (tostring((getPlayer)["DisplayName"])))) then
            table.remove(api["bl"], (tonumber(_)))
        end
    end
end)

insertCommand("dtools", function(choice)
    if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) then
        if not (tostring(choice):lower() == ("all")) then
            if (plr.Character:FindFirstChildWhichIsA("Tool").CanBeDropped) then
                plr.Character:FindFirstChildWhichIsA("Tool").Parent = (game:GetService("Workspace"))
            end
        elseif (tostring(choice):lower() == ("all")) then
            plr.Character:FindFirstChild("Humanoid"):UnequipTools(); wait(1/4)

            for _, v in next, (plr.Backpack:GetChildren()) do
                if v:IsA("Tool") and (v:IsDescendantOf(plr.Backpack)) and ((v["CanBeDropped"]) ~= (false)) then
                    v["Parent"] = (plr.Character); task.wait()
                    v["Parent"] = (game:GetService("Workspace"))
                end
            end
        end
    end
end)

insertCommand("antifling", function()
    pcall(function()
        rs = game:GetService("RunService").Heartbeat:Connect(function()
            if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) then
                for _, v in next, (plrs:GetPlayers()) do
                    if v:IsA("Player") and (v ~= (plr)) and (v.Character) and ((tonumber(v.Character:FindFirstChild("Humanoid").Health)) > (0)) then
                        for i, x in next, ((v).Character:GetChildren()) do
                            if (x:IsA("BasePart") or x:IsA("Part")) and (x:IsDescendantOf((v).Character)) and not (x:FindFirstChildWhichIsA("NoCollisionConstraint")) then
                                for __, z in next, (plr.Character:GetChildren()) do
                                    if (z:IsA("BasePart") or z:IsA("Part")) and (z:IsDescendantOf(plr.Character)) then
                                        local ncc = Instance.new("NoCollisionConstraint", (x))
                                        ncc["Enabled"] = (true)
                                        ncc["Part0"] = (z)
                                        ncc["Part1"] = (x)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)
    end)
end)

insertCommand("view", function(choice)
    if not ((tostring(choice)) == ("false")) then
        for _, v in next, (plrs:GetPlayers()) do
            if v:IsA("Player") then
                if ((tostring(v["Name"]):lower():sub(1, tonumber(string.len(tostring(choice)))) == tostring(choice):lower()) or (tostring(v["DisplayName"]):lower():sub(1, tonumber(string.len(tostring(choice)))) == tostring(choice):lower())) then
                    choice = (v)
                end
            end
        end

        if ((choice).Character) and ((choice).Character:FindFirstChild("Humanoid")) then
            game:GetService("Workspace").CurrentCamera.CameraSubject = ((choice).Character:FindFirstChild("Humanoid"))
        end
    elseif ((tostring(choice)) == ("false")) then
        if (plr.Character) and (plr.Character:FindFirstChild("Humanoid")) then
            game:GetService("Workspace").CurrentCamera["CameraSubject"] = (plr.Character:FindFirstChild("Humanoid"))
        end
    end
end)

insertCommand("lkill", function(getPlayer)
    if ((tonumber(game["PlaceId"])) == (1662219031)) then
        for _, v in next, (plrs:GetPlayers()) do
            if v:IsA("Player") then
                if ((tostring(v["Name"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower()) or (tostring(v["DisplayName"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower())) then
                    getPlayer = (v)
                end
            end
        end

        pcall(function()
            if (loop) then
                loop = (false)
            end; rs:Disconnect()
        end); loop = (true)

        while (loop) and task.wait() do
            if not ((plr.Character) or ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0))) and not (((getPlayer).Character) or ((tonumber((getPlayer).Character:FindFirstChild("Humanoid").Health)) > (0))) then
                repeat task.wait() until (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) and (getPlayer.Character) and ((tonumber((getPlayer).Character:FindFirstChild("Humanoid").Health)) > (0))
            end

            if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) and ((getPlayer).Character) and ((tonumber((getPlayer).Character:FindFirstChild("Humanoid").Health)) > (0)) then
                if (plr.Character:FindFirstChild("Humanoid").Sit) and ((tonumber((plr.Character:FindFirstChild("Humanoid").MoveDirection).Magnitude)) <= (0)) then
                    repeat task.wait()
                        plr.Character:FindFirstChild("Humanoid"):ChangeState(3)
                        plr.Character:FindFirstChild("Humanoid").Sit = (false)
                    until not (plr.Character:FindFirstChild("Humanoid").Sit)
                end

                if (((getPlayer).Character:FindFirstChild("Stroller")) or ((getPlayer).Character:FindFirstChild("Sitting"))) then
                    repeat task.wait() until not (((getPlayer).Character:FindFirstChild("Stroller")) or ((getPlayer).Character:FindFirstChild("Sitting")))
                end

                task.spawn(function()
                    local stroller = ((plr.Backpack:FindFirstChild("Stroller")) or (plr.Character:FindFirstChild("Stroller")))
                    wait(1/2); plr.Character:FindFirstChild("Humanoid"):EquipTool(stroller); wait(3/20)

                    rs = game:GetService("RunService").Heartbeat:Connect(function()
                        if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) and ((getPlayer).Character) and ((tonumber((getPlayer).Character:FindFirstChild("Humanoid").Health)) > (0)) then
                            if not ((getPlayer).Character:FindFirstChild("Stroller") or (getPlayer).Character:FindFirstChild("Sitting")) then
                                (getPlayer).Character:FindFirstChild("HumanoidRootPart").CFrame = (((stroller):FindFirstChild("Handle").CFrame) * CFrame.new(0, -0.2, 3))

                                for _, v in next, ((stroller):GetDescendants()) do
                                    if (v:IsA("BasePart") or v:IsA("Part")) and (v:IsDescendantOf(stroller)) then
                                        firetouchinterest(((getPlayer).Character["PrimaryPart"]), (v), (0))
                                    end
                                end
                            end
                        else
                            rs:Disconnect()
                        end
                    end)
                end)

                local newRs
                newRs = game:GetService("RunService").Heartbeat:Connect(function()
                    plr.Character:SetPrimaryPartCFrame(CFrame.new(-640, 53, 143.5) * CFrame.Angles(-1.5, 0, 0)); property()

                    if ((getPlayer).Character:FindFirstChild("Sitting")) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) <= (0)) then
                        pcall(function()
                            rs:Disconnect(); newRs:Disconnect()
                        end)
                    end
                end)

                if not ((getPlayer).Character:FindFirstChild("Humanoid").Health <= (0)) then
                    repeat task.wait() until ((getPlayer).Character:FindFirstChild("Humanoid").Health <= (0))
                end; wait(5/2)

                plr.Character:FindFirstChild("Humanoid"):ChangeState(15)
                plr.CharacterAdded:Wait(3/20):WaitForChild("Humanoid")
            end
        end
    end
end)

insertCommand("amute", function(getPlayer)
    if not ((tostring(getPlayer):lower() == ("all")) or (tostring(getPlayer):lower() == ("others"))) then
        for _, v in next, (plrs:GetPlayers()) do
            if v:IsA("Player") then
                if ((tostring(v["Name"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower()) or (tostring(v["DisplayName"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower())) then
                    getPlayer = (v)
                end
            end
        end

        pcall(function()
            if ((getPlayer).Character) and ((tonumber(getPlayer.Character:FindFirstChild("Humanoid").Health)) > (0)) then
                for _, v in next, ((getPlayer).Character:GetDescendants()) do
                    if v:IsA("Sound") and (v:IsDescendantOf((getPlayer).Character)) and (v["Playing"]) then
                        v:Stop()
                    end
                end
            end
        end)
    elseif ((tostring(getPlayer):lower() == ("all")) or (tostring(getPlayer):lower() == ("others"))) then
        pcall(function()
            for _, v in next, (plrs:GetPlayers()) do
                if v:IsA("Player") and (v.Character) and ((tonumber(v.Character:FindFirstChild("Humanoid").Health)) > (0)) then
                    if not (table.find(api["wl"], (tostring(v["Name"])))) and not (table.find(api["wl"], (tostring(v["DisplayName"])))) then
                        for i, x in next, ((v).Character:GetDescendants()) do
                            if x:IsA("Sound") and (x:IsDescendantOf((v).Character)) and (x["Playing"]) then
                                x:Stop()
                            end
                        end
                    end
                end
            end
        end)
    end
end)

insertCommand("lamute", function(getPlayer)
    if not ((tostring(getPlayer):lower() == ("all")) or (tostring(getPlayer):lower() == ("others"))) then
        for _, v in next, (plrs:GetPlayers()) do
            if v:IsA("Player") then
                if ((tostring(v["Name"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower()) or (tostring(v["DisplayName"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower())) then
                    getPlayer = (v)
                end
            end
        end

        pcall(function()
            rs = game:GetService("RunService").Heartbeat:Connect(function()
                if ((getPlayer).Character) and ((tonumber((getPlayer).Character:FindFirstChild("Humanoid").Health)) > (0)) then
                    for _, v in next, ((getPlayer).Character:GetDescendants()) do
                        if v:IsA("Sound") and (v:IsDescendantOf((getPlayer).Character)) and (v["Playing"]) then
                            local mute = coroutine.wrap(function()
                                v["TimePosition"] = (0)
                                v:Stop()
                            end); mute()
                        end
                    end
                end
            end)
        end)
    elseif ((tostring(getPlayer):lower() == ("all")) or (tostring(getPlayer):lower() == ("others"))) then
        pcall(function()
            rs = game:GetService("RunService").Heartbeat:Connect(function()
                for _, v in next, (plrs:GetPlayers()) do
                    if v:IsA("Player") and (v.Character) and ((tonumber(v.Character:FindFirstChild("Humanoid").Health)) > (0)) then
                        if not (table.find(api["wl"], (tostring(v["Name"])))) and not (table.find(api["wl"], (tostring(v["DisplayName"])))) then
                            for i, x in next, ((v).Character:GetDescendants()) do
                                if x:IsA("Sound") and (x:IsDescendantOf((v).Character)) and (x["Playing"]) then
                                    local mute = coroutine.wrap(function()
                                        x["TimePosition"] = (0)
                                        x:Stop()
                                    end); mute()
                                end
                            end
                        end
                    end
                end
            end)
        end)
    end
end)

insertCommand("gtools", function()
    pcall(function()
        for _, v in next, (game:GetService("Workspace"):GetChildren()) do
            if v:IsA("Tool") and (v:IsDescendantOf(game:GetService("Workspace"))) then
                if not ((plr.Character) or ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0))) then
                    break
                end

                for i = 1, 5 do
                    wait()

                    if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) then
                        v:FindFirstChild("Handle").CanCollide = (false)
                        v:FindFirstChild("Handle").CFrame = (plr.Character["PrimaryPart"].CFrame)
                        firetouchinterest((v:FindFirstChild("Handle")), (plr.Character["PrimaryPart"]), (0))
                    else
                        break
                    end; task.wait()
                end

                if not (v:IsDescendantOf(plr.Backpack) or v:IsDescendantOf(plr.Character)) then
                    repeat task.wait() until (v:IsDescendantOf(plr.Backpack) or v:IsDescendantOf(plr.Character))
                end; wait()
            end
        end
    end)
end)

insertCommand("lgtools", function()
    pcall(function()
        loops["loop"] = (true)

        while (loops.loop) do
            for _, v in next, (game:GetService("Workspace"):GetChildren()) do
                if v:IsA("Tool") and (v:IsDescendantOf(game:GetService("Workspace"))) then
                    task.spawn(function()
                        if not ((plr.Character) or ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0))) then
                            repeat task.wait() until (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0))
                        end

                        if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) then
                            v:FindFirstChild("Handle").CanCollide = (false)
                            v:FindFirstChild("Handle").CFrame = (plr.Character["PrimaryPart"].CFrame)
                            firetouchinterest((v:FindFirstChild("Handle")), (plr.Character["PrimaryPart"]), (1), wait(), firetouchinterest((v:FindFirstChild("Handle")), (plr.Character["PrimaryPart"]), (0)))
                        end
                    end)

                    if not (v:IsDescendantOf(plr.Backpack) or v:IsDescendantOf(plr.Character)) then
                        repeat task.wait() until (v:IsDescendantOf(plr.Backpack) or v:IsDescendantOf(plr.Character))
                    end

                    repeat task.wait()
                        plr.Character:FindFirstChild("Humanoid"):UnequipTools()
                    until not (plr.Character:FindFirstChildWhichIsA("Tool"))
                end
            end; wait()
        end
    end)
end)

insertCommand("tools", function(getPlayer)
    for _, v in next, (plrs:GetPlayers()) do
        if v:IsA("Player") then
            if ((tostring(v["Name"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower()) or (tostring(v["DisplayName"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower())) then
                getPlayer = (v)
            end

            if not (getPlayer) then
                getPlayer = (plr)
            end
        end
    end

    if ((getPlayer).Character) and ((tonumber(getPlayer.Character:FindFirstChild("Humanoid").Health)) > (0)) then
        local int = (tonumber(#(getPlayer).Backpack:GetChildren()))

        for _, v in next, ((getPlayer).Character:GetChildren()) do
            if v:IsA("Tool") and (v:IsDescendantOf((getPlayer).Character)) then
                int+=(1)
            end
        end

        print(tostring(getPlayer["Name"]).." #Tools: "..tostring(tonumber(int)))

        pcall(function()
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("#Tools: "..(tostring(tonumber(int))), "All")
        end)
    end
end)

insertCommand("sync", function(getPlayer)
    if not ((tostring(getPlayer):lower() == ("all")) or (tostring(getPlayer):lower() == ("others"))) then
        for _, v in next, (plrs:GetPlayers()) do
            if v:IsA("Player") then
                if ((tostring(v["Name"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower()) or (tostring(v["DisplayName"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower())) then
                    getPlayer = (v)
                end

                if not (getPlayer) then
                    getPlayer = (plr)
                end
            end
        end

        if ((getPlayer).Character) and ((tonumber((getPlayer).Character:FindFirstChild("Humanoid").Health)) > (0)) then
            local sounds = {}; table.clear(sounds)

            repeat task.wait() until ((tonumber(#sounds)) <= (0))

            for _, v in next, ((getPlayer).Character:GetChildren()) do
                if v:IsA("Tool") and (v:IsDescendantOf((getPlayer).Character)) then
                    task.spawn(function()
                        for i, x in next, (v:GetDescendants()) do
                            if x:IsA("Sound") and (x["Playing"]) then
                                table.insert(sounds, (x))
                            end
                        end
                    end)
                end
            end

            if ((tonumber(#sounds)) > (0)) and ((tonumber(#sounds)) >= (1)) then
                local setup = coroutine.create(function()
                    for i = 1, (tonumber(#sounds)) do
                        sounds[tonumber(i)]["Playing"] = (false)
                        sounds[tonumber(i)]["TimePosition"] = (0)
                        repeat task.wait() until (sounds[tonumber(i)]["Playing"] == (false)) and (sounds[tonumber(i)]["TimePosition"] == (0))
                    end
                end); coroutine.resume(setup)

                repeat task.wait() until (tostring(coroutine.status(setup)):lower() == ("dead"))

                task.spawn(function()
                    local count = (0)
                    repeat task.wait()
                        for _, v in next, (sounds) do
                            if (v["Playing"] ~= (true)) then
                                local reset = coroutine.wrap(function()
                                    for i = 1, (tonumber(#sounds)) do
                                        sounds[tonumber(i)]["TimePosition"] = (0)
                                    end
                                end); reset()
                            elseif (v["Playing"] ~= (false)) then
                                count+=(1)
                            end
                        end
                    until ((tonumber(count)) >= (tonumber(#sounds)))
                end)

                local play = coroutine.wrap(function()
                    for i = 1, (tonumber(#sounds)) do
                        sounds[tonumber(i)].Playing = (true)
                    end
                end); play()
            end
        end
    elseif ((tostring(getPlayer):lower() == ("all")) or (tostring(getPlayer):lower() == ("others"))) then
        local sounds = {}; table.clear(sounds);

        repeat task.wait() until ((tonumber(#sounds)) <= (0))

        for _, v in next, (plrs:GetPlayers()) do
            if v:IsA("Player") and (v:IsDescendantOf(plrs)) then
                if not (table.find(api["wl"], (tostring(v["Name"])))) and not (table.find(api["wl"], (tostring(v["DisplayName"])))) then
                    for o, z in next, ((v).Character:GetChildren()) do
                        if z:IsA("Tool") and (z:IsDescendantOf((v).Character)) then
                            task.spawn(function()
                                for i, x in next, (z:GetDescendants()) do
                                    if x:IsA("Sound") and (x["Playing"]) then
                                        table.insert(sounds, (x))
                                    end
                                end
                            end)
                        end
                    end
                end
            end
        end

        if (tonumber(#sounds) > (0)) and (tonumber(#sounds) >= (1)) then
            local setup = coroutine.create(function()
                for i = 1, tonumber(#sounds) do
                    sounds[tonumber(i)].Playing = (false)
                    sounds[tonumber(i)].TimePosition = (0)
                    repeat task.wait() until (sounds[tonumber(i)].Playing == (false)) and (sounds[tonumber(i)].TimePosition == (0))
                end
            end); coroutine.resume(setup)

            repeat task.wait() until (tostring(coroutine.status(setup)):lower() == ("dead"))

            task.spawn(function()
                local count = (0)
                repeat task.wait()
                    for _, v in next, (sounds) do
                        if (v["Playing"] ~= (true)) then
                            local reset = coroutine.wrap(function()
                                for i = 1, (tonumber(#sounds)) do
                                    sounds[tonumber(i)]["TimePosition"] = (0)
                                end
                            end); reset()
                        elseif (v["Playing"] ~= (false)) then
                            count+=(1)
                        end
                    end
                until ((tonumber(count)) >= (tonumber(#sounds)))
            end)

            local play = coroutine.wrap(function()
                for i = 1, (tonumber(#sounds)) do
                    sounds[tonumber(i)].Playing = (true)
                end
            end); play()
        end
    end
end)

insertCommand("v", function(name)
    if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) then
        function setup(preset)
            if (type(preset) == ("function")) then
                if (plr.Character:FindFirstChildWhichIsA("Tool")) then
                    repeat task.wait()
                        plr.Character:FindFirstChild("Humanoid"):UnequipTools()
                    until not (plr.Character:FindFirstChildWhichIsA("Tool"))
                end

                if (tonumber(#plr.Backpack:GetChildren()) > (0)) and (tonumber(#plr.Backpack:GetChildren()) >= (1)) then
                    function method()
                        if (utilities[tostring("tools"):lower()]) and (utilities[tostring("bodymovers"):lower()]) then
                            table.clear(utilities[tostring("tools"):lower()])

                            for _, v in next, (utilities[tostring("bodymovers"):lower()]) do
                                if (v:IsA("BodyPosition") or v:IsA("BodyGyro")) then
                                    v:Remove()
                                end
                            end; table.clear(utilities[tostring("bodymovers"):lower()])
                        elseif not (utilities[tostring("tools"):lower()]) and not (utilities[tostring("bodymovers"):lower()]) then
                            utilities[tostring("tools"):lower()] = {}
                            utilities[tostring("bodymovers"):lower()] = {}
                        end

                        for _, v in next, (plr.Backpack:GetChildren()) do
                            if v:IsA("Tool") and (v:IsDescendantOf(plr.Backpack)) then
                                plr.Character:FindFirstChild("Humanoid"):EquipTool(v)
                            end
                        end

                        repeat task.wait()
                            plr.Character:FindFirstChild("Humanoid"):UnequipTools()
                        until not (plr.Character:FindFirstChildWhichIsA("Tool"))

                        for _, v in next, (plr.Backpack:GetChildren()) do
                            if v:IsA("Tool") and (v:IsDescendantOf(plr.Backpack)) then
                                v["Parent"] = (plr.Character)
                                v["Parent"] = (plr.Backpack)
                                v["Parent"] = (plr.Character:FindFirstChild("Humanoid"))
                                v["Parent"] = (plr.Character)
                                utilities[tostring("tools"):lower()][(tonumber(#utilities[tostring("tools"):lower()])) + (1)] = (v)
                            end
                        end

                        repeat task.wait() until not (plr.Backpack:FindFirstChildWhichIsA("Tool"))

                        for _, v in next, (utilities[tostring("tools"):lower()]) do
                            if v:IsA("Tool") and (v:IsDescendantOf(plr.Character)) and (v:FindFirstChild("Handle")) then
                                local bp = Instance.new("BodyPosition", (v:FindFirstChild("Handle")))
                                bp["MaxForce"] = Vector3.new(math.huge, math.huge, math.huge)
                                bp["D"] = (250)
                                utilities[tostring("bodymovers"):lower()][(tonumber(#utilities[tostring("bodymovers"):lower()])) + (1)] = (bp)

                                local bg = Instance.new("BodyGyro", (v:FindFirstChild("Handle")))
                                bg["D"] = (250)
                                bg["MaxTorque"] = Vector3.new(math.huge, math.huge, math.huge)
                                utilities[tostring("bodymovers"):lower()][(tonumber(#utilities[tostring("bodymovers"):lower()])) + (1)] = (bg)
                            end
                        end
                    end

                    if (plr.Character:FindFirstChildWhichIsA("Tool")) then
                        repeat task.wait()
                            plr.Character:FindFirstChild("Humanoid"):UnequipTools()
                        until not (plr.Character:FindFirstChildWhichIsA("Tool"))
                    end

                    game:GetService("Workspace")["FallenPartsDestroyHeight"] = (0/0)

                    if (plr.Character["PrimaryPart"]) then
                        utilities[tostring("savecf"):lower()] = (plr.Character:GetModelCFrame());
                        plr.Character:SetPrimaryPartCFrame((utilities[tostring("savecf"):lower()]) * CFrame.new(0, -25, 0)); wait(1/2)
                        plr.Character["PrimaryPart"]["Anchored"] = (true)
                        repeat task.wait() until (plr.Character["PrimaryPart"]["Anchored"])
                    end; method(); wait(9/5)

                    if (plr.Character:FindFirstChildWhichIsA("Tool")) then
                        repeat task.wait()
                            plr.Character:FindFirstChild("Humanoid"):UnequipTools()
                        until not (plr.Character:FindFirstChildWhichIsA("Tool"))
                    end

                    spawn(function()
                        method(); preset()
                    end); wait(5/2)

                    if (plr.Character["PrimaryPart"]["Anchored"]) then
                        plr.Character["PrimaryPart"]["Anchored"] = (false)
                        repeat task.wait() until ((plr.Character["PrimaryPart"]["Anchored"]) ~= (true))

                        pcall(function()
                            local tween = game:GetService("TweenService"):Create((plr.Character:FindFirstChild("HumanoidRootPart")), (TweenInfo.new(1/2)), {["CFrame"] = (utilities[tostring("savecf"):lower()])})
                            tween:Play()
                            repeat task.wait() until (tween["PlaybackState"] == (Enum.PlaybackState["Completed"]))
                            property()
                        end)

                        plr.Character:SetPrimaryPartCFrame(utilities[tostring("savecf"):lower()]); property()
                    end
                end
            end
        end

        if (tostring(name):lower() == ("circle")) then
            utilities[tostring("host"):lower()] = (plr)

            setup(function()
                if not (loops[tostring("vloop"):lower()]) then
                    loops[tostring("vloop"):lower()] = (true)
                end

                while (loops[tostring("vloop"):lower()]) do
                    local host = (utilities[tostring("host"):lower()])
                    if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) and ((host).Character) and ((tonumber((host).Character:FindFirstChild("Humanoid").Health)) > (0)) then
                        for _, v in next, (utilities[tostring("tools"):lower()]) do
                            if v:IsA("Tool") and (v:IsDescendantOf(plr.Character)) then
                                local pbl = tonumber((utilities[tostring("tools"):lower()][1]):FindFirstChild("Handle"):FindFirstChildWhichIsA("Sound").PlaybackLoudness)

                                if ((tonumber(pbl)) <= (0)) then
                                    pbl = (1)
                                elseif ((tonumber(pbl)) > (0)) then
                                    pbl = (((tonumber(pbl)) * (0.003)) + (1/2))
                                end

                                local base = math.rad((((tick()) * (17)) * (5/2)) + ((tonumber(_)) * ((360)/(tonumber(#utilities[tostring("tools"):lower()])))))

                                v:FindFirstChild("Handle"):FindFirstChildWhichIsA("BodyPosition").Position = (((host).Character:FindFirstChild("HumanoidRootPart").Position) + Vector3.new((math.cos(base)) * ((5) * (tonumber(pbl))), 0, (math.sin(base)) * ((5) * (tonumber(pbl)))))
                                v:FindFirstChild("Handle"):FindFirstChildWhichIsA("BodyGyro").CFrame = (CFrame.new((v:FindFirstChild("Handle").Position), ((host).Character:FindFirstChild("HumanoidRootPart").Position)) * CFrame.Angles(((1/4) * (tonumber(pbl))), 0, 0))
                                v:FindFirstChild("Handle").Velocity = Vector3.new(28, 0, 20)
                            elseif (v:IsDescendantOf(plr.Backpack)) and not (v:IsDescendantOf(plr.Character)) and (loops[tostring("vloop"):lower()]) then
                                loops[tostring("vloop"):lower()] = (false)

                                for _, v in next, (utilities[tostring("bodymovers"):lower()]) do
                                    if (v:IsA("BodyPosition") or v:IsA("BodyGyro")) then
                                        v:Remove()
                                    end
                                end
                            end
                        end
                    elseif (loops[tostring("vloop"):lower()]) then
                        loops[tostring("vloop"):lower()] = (false)

                        repeat task.wait()
                            plr.Character:FindFirstChild("Humanoid"):UnequipTools()
                        until not (plr.Character:FindFirstChildWhichIsA("Tool"))

                        for _, v in next, (utilities[tostring("bodymovers"):lower()]) do
                            if (v:IsA("BodyPosition") or v:IsA("BodyGyro")) then
                                v:Remove()
                            end
                        end
                    end; task.wait()
                end
            end)
        end
        if (tostring(name):lower() == ("spiral")) then
            utilities[tostring("host"):lower()] = (plr)

            setup(function()
                if not (loops[tostring("vloop"):lower()]) then
                    loops[tostring("vloop"):lower()] = (true)
                end

                while (loops[tostring("vloop"):lower()]) do
                    local host = (utilities[tostring("host"):lower()])
                    if (plr.Character) and (tonumber(plr.Character:FindFirstChild("Humanoid").Health) > (0)) and ((host).Character) and (tonumber((host).Character:FindFirstChild("Humanoid").Health) > (0)) then
                        for _, v in next, (utilities[tostring("tools"):lower()]) do
                            if v:IsA("Tool") and (v:IsDescendantOf(plr.Character)) then
                                local pbl = (tonumber((utilities[tostring("tools"):lower()][1]):FindFirstChild("Handle"):FindFirstChildWhichIsA("Sound").PlaybackLoudness))

                                if ((tonumber(pbl)) <= (0)) then
                                    pbl = (1)
                                elseif ((tonumber(pbl)) > (0)) then
                                    pbl = (((tonumber(pbl)) * (0.003)) + (1/2))
                                end

                                local base = math.rad((((tick()) * (17)) * (5/2)) + ((tonumber(_)) * (((360)/(tonumber(#utilities[tostring("tools"):lower()]))) * (2))))

                                v:FindFirstChild("Handle"):FindFirstChildWhichIsA("BodyPosition").Position = ((host).Character:FindFirstChild("HumanoidRootPart").Position + Vector3.new((math.cos(base)) * ((5) * (tonumber(pbl))), (-(5/2) + ((tonumber(_))/(2) + ((tonumber(_)) * (1/2)))), (math.sin(base)) * ((5) * (tonumber(pbl)))))
                                v:FindFirstChild("Handle"):FindFirstChildWhichIsA("BodyGyro").CFrame = (CFrame.new(v:FindFirstChild("Handle").Position, (host).Character:FindFirstChild("HumanoidRootPart").Position) * CFrame.Angles(((1/4) * tonumber(pbl)), 0, 0))
                                v:FindFirstChild("Handle").Velocity = Vector3.new(28, 0, 20)
                            elseif (v:IsDescendantOf(plr.Backpack)) and not (v:IsDescendantOf(plr.Character)) and (loops[tostring("vloop"):lower()]) then
                                loops[tostring("vloop"):lower()] = (false)

                                for _, v in next, (utilities[tostring("bodymovers"):lower()]) do
                                    if (v:IsA("BodyPosition") or v:IsA("BodyGyro")) then
                                        v:Remove()
                                    end
                                end
                            end
                        end
                    elseif (loops[tostring("vloop"):lower()]) then
                        loops[tostring("vloop"):lower()] = (false)

                        repeat task.wait()
                            plr.Character:FindFirstChild("Humanoid"):UnequipTools()
                        until not (plr.Character:FindFirstChildWhichIsA("Tool"))

                        for _, v in next, (utilities[tostring("bodymovers"):lower()]) do
                            if (v:IsA("BodyPosition") or v:IsA("BodyGyro")) then
                                v:Remove()
                            end
                        end
                    end; task.wait()
                end
            end)
        end
    end
end)

insertCommand("give", function(getPlayer)
    for _, v in next, (plrs:GetPlayers()) do
        if v:IsA("Player") then
            if ((tostring(v["Name"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower()) or (tostring(v["DisplayName"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower())) then
                getPlayer = (v)
            end
        end
    end

    if (utilities[tostring("host"):lower()]) then
        utilities[tostring("host"):lower()] = (getPlayer)
    end
end)

insertCommand("caudio", function(getPlayer)
    for _, v in next, (plrs:GetPlayers()) do
        if v:IsA("Player") then
            if ((tostring(v["Name"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower()) or (tostring(v["DisplayName"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower())) then
                getPlayer = (v)
            end
        end
    end

    if ((getPlayer).Character) and (tonumber((getPlayer).Character:FindFirstChild("Humanoid").Health) > (0)) then
        local pTool = (((getPlayer).Character:FindFirstChildWhichIsA("Tool")) or ((getPlayer).Backpack:FindFirstChildWhichIsA("Tool")))

        if ((pTool):IsA("Tool")) and ((pTool):IsDescendantOf((getPlayer).Character)) then
            for _, v in next, (pTool:GetDescendants()) do
                if v:IsA("Sound") and (v:IsDescendantOf(pTool)) then
                    utilities[tostring("sound"):lower()] = (v)
                    break
                end
            end

            if (utilities[tostring("sound"):lower()]) and ((utilities[tostring("sound"):lower()])["Playing"]) then
                if ((tonumber(#plr.Backpack:GetChildren())) > (0)) and ((tonumber(#plr.Backpack:GetChildren())) >= (1)) then
                    for _, v in next, (plr.Backpack:GetChildren()) do
                        if (v:IsA("Tool")) and (v:IsDescendantOf(plr.Backpack)) then
                            v["Parent"] = (plr.Character)
                        end
                    end

                    repeat task.wait() until not (plr.Backpack:FindFirstChildWhichIsA("Tool")) and (tonumber(#plr.Backpack:GetChildren()) <= (0))

                    local getId
                    local split = {
                        "=",
                        "://"
                    }

                    for o, z in next, (split) do
                        if (type(z) == ("string")) then
                            getId = string.split((tostring((utilities[tostring("sound"):lower()])["SoundId"])), (tostring(z)))

                            if not (tostring(getId[2]):lower() == ("nil")) then
                                getId = (getId[2])
                                warn("Copied audio from "..(tostring(getPlayer["Name"])).." : "..(tostring(getId)))
                                break
                            end
                        end
                    end

                    local play = coroutine.wrap(function()
                        for _, v in next, (plr.Character:GetChildren()) do
                            if ((v):FindFirstChildWhichIsA("RemoteEvent")) then
                                (v):FindFirstChildWhichIsA("RemoteEvent"):FireServer("PlaySong", (tonumber(getId)))
                            else
                                game:GetService("ReplicatedStorage"):FindFirstChild("JukeBoxEndpoint"):InvokeServer("SetSound", (tostring(getId)))
                            end
                        end
                    end); play()
                end
            end
        end
    end
end)

insertCommand("equip", function(amount)
    if (tostring(amount):lower() == ("all")) then
        if (plr.Character) and (tonumber(plr.Character:FindFirstChild("Humanoid").Health) > (0)) then
            plr.Character:FindFirstChild("Humanoid"):UnequipTools()

            if (plr.Character:FindFirstChildWhichIsA("Tool")) then
                repeat task.wait() until not (plr.Character:FindFirstChildWhichIsA("Tool"))
            end

            if ((tonumber(#plr.Backpack:GetChildren()) > (0)) or (tonumber(#plr.Backpack:GetChildren()) >= (1))) then
                for _, v in next, (plr.Backpack:GetChildren()) do
                    if v:IsA("Tool") and (v:IsDescendantOf(plr.Backpack)) then
                        v["Parent"] = (plr.Character)
                    end
                end
            end
        end
    elseif (type(tonumber(amount)) == ("number")) then
        if (plr.Character) and (tonumber(plr.Character:FindFirstChild("Humanoid").Health) > (0)) then
            plr.Character:FindFirstChild("Humanoid"):UnequipTools()

            if (plr.Character:FindFirstChildWhichIsA("Tool")) then
                repeat task.wait() until not (plr.Character:FindFirstChildWhichIsA("Tool"))
            end

            if ((tonumber(#plr.Backpack:GetChildren()) > (0)) or (tonumber(#plr.Backpack:GetChildren()) >= (1))) and (tonumber(#plr.Backpack:GetChildren()) >= (tonumber(amount))) then
                pcall(function()
                    for _, v in next, (plr.Backpack:GetChildren()) do
                        if v:IsA("Tool") and (v:IsDescendantOf(plr.Backpack)) and ((tonumber(_)) <= (tonumber(amount))) then
                            v["Parent"] = (plr.Character)

                            if not (v:IsDescendantOf(plr.Character)) then
                                repeat task.wait() until (v:IsDescendantOf(plr.Character))
                            end
                        end
                    end
                end)
            elseif (tonumber(#plr.Backpack:GetChildren()) < (tonumber(amount))) then
                pcall(function()
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("I don't have enough!", "All")
                end)
            end
        end
    end
end)

insertCommand("hh", function(amount)
    if not (tostring(amount):lower() == ("reset")) then
        if (plr.Character) and (tonumber(plr.Character:FindFirstChild("Humanoid").Health) > (0)) then
            if (type(tonumber(amount)) == ("number")) then
                if not (utilities[tostring("hipheight")]) then
                    utilities[tostring("hipheight"):lower()] = (tonumber(plr.Character:FindFirstChild("Humanoid").HipHeight))
                end

                plr.Character:FindFirstChild("Humanoid").HipHeight = (tonumber(amount))
            end
        end
    elseif (tostring(amount):lower() == ("reset")) then
        if (utilities[tostring("hipheight")]) then
            plr.Character:FindFirstChild("Humanoid").HipHeight = (tonumber(utilities[tostring("hipheight"):lower()]))
            utilities[tostring("hipheight"):lower()] = (nil)
        end
    end
end)

insertCommand("rta", function()
    if (plr.Character) and (tonumber(plr.Character:FindFirstChild("Humanoid").Health) > (0)) then
        if (plr.Character:FindFirstChildWhichIsA("Tool")) then
            repeat task.wait()
                plr.Character:FindFirstChild("Humanoid"):UnequipTools()
            until not (plr.Character:FindFirstChildWhichIsA("Tool"))
        end; wait(1/2)

        pcall(function()
            plr.Character:FindFirstChild("Animate"):FindFirstChild("toolnone"):FindFirstChild("ToolNoneAnim")["AnimationId"] = ("nil")
        end)
    end
end)

insertCommand("dance", function()
    if (plr.Character) and (tonumber(plr.Character:FindFirstChild("Humanoid").Health) > (0)) then
        if ((api["fplr"]).Character) and (tonumber((api["fplr"]).Character:FindFirstChild("Humanoid").Health) > (0)) then
            if ((api["fplr"]).Character:FindFirstChildWhichIsA("Tool")) then
                if (loops[tostring("dloop"):lower()]) then
                    loops[tostring("dloop"):lower()] = (false)
                end

                local totalTools = (0)

                for _, v in next, ((api["fplr"]).Character:GetChildren()) do
                    if v:IsA("Tool") and (v:IsDescendantOf((api["fplr"]).Character)) then
                        totalTools += (1)
                    end
                end

                totalTools += (tonumber(#(api["fplr"]).Backpack:GetChildren()))

                if ((tonumber(totalTools) > (0)) or (tonumber(totalTools) >= (1))) then
                    repeat task.wait()
                        if (plr.Character) and (tonumber(plr.Character:FindFirstChild("Humanoid").Health) > (0)) then
                            plr.Character:FindFirstChild("Humanoid"):UnequipTools()
                        end
                    until not (plr.Character:FindFirstChildWhichIsA("Tool"))

                    if (plr.Character:FindFirstChild("Humanoid").Sit) then
                        repeat task.wait()
                            plr.Character:FindFirstChild("Humanoid").Sit = (false)
                            plr.Character:FindFirstChild("Humanoid"):ChangeState(3)
                        until not (plr.Character:FindFirstChild("Humanoid").Sit)
                    end

                    plr.Character:SetPrimaryPartCFrame((api["fplr"]).Character:GetModelCFrame() * CFrame.new(5, 0, 0))

                    repeat task.wait() until ((api["fplr"]).Character:FindFirstChildWhichIsA("Tool"))

                    if ((api["fplr"]).Character:FindFirstChildWhichIsA("Tool")) then
                        repeat task.wait() until ((api["fplr"]).Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Handle"):FindFirstChildWhichIsA("Sound").Playing)

                        if (((api["fplr"]).Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Handle"):FindFirstChildWhichIsA("Sound").Playing) ~= (false)) then
                            local dances = {
                                "/e dance",
                                "/e dance1",
                                "/e dance2",
                                "/e dance3"
                            }

                            loops[tostring("dloop"):lower()] = (true)

                            while (loops[tostring("dloop"):lower()]) do
                                if (plr.Character) and (tonumber(plr.Character:FindFirstChild("Humanoid").Health) > (0)) then
                                    if ((api["fplr"]).Character) and (tonumber((api["fplr"]).Character:FindFirstChild("Humanoid").Health) > (0)) then
                                        repeat task.wait() until ((api["fplr"]).Character:FindFirstChildWhichIsA("Tool"))

                                        pcall(function()
                                            if ((api["fplr"]).Character:FindFirstChildWhichIsA("Tool")) and (((api["fplr"]).Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Handle"):FindFirstChildWhichIsA("Sound").Playing) ~= (false)) then
                                                local getMove = (dances[math.random(1, tonumber(#dances))])

                                                if (type(getMove) == ("string")) then
                                                    plrs:Chat(tostring(dances[math.random(1, tonumber(#dances))]):lower())
                                                    game:GetService("RunService").Heartbeat:Wait(8)
                                                end
                                            end
                                        end)
                                    else
                                        loops[tostring("dloop"):lower()] = (false)
                                    end
                                else
                                    loops[tostring("dloop"):lower()] = (false)
                                end; wait(5)
                            end
                        end
                    end
                end
            end
        end
    end
end)

insertCommand("mass", function(getPlayer)
    if (plr.Character) and (tonumber(plr.Character:FindFirstChild("Humanoid").Health) > (0)) then
        for _, v in next, (plrs:GetPlayers()) do
            if v:IsA("Player") then
                if ((tostring(v["Name"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower()) or (tostring(v["DisplayName"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower())) then
                    getPlayer = (v)
                end
            end
        end

        if ((getPlayer).Character) and (tonumber((getPlayer).Character:FindFirstChild("Humanoid").Health) > (0)) then
            utilities[tostring("mass"):lower()] = (0)

            for _, v in next, ((getPlayer).Character:GetChildren()) do
                if (v:IsA("BasePart") or v:IsA("Part")) and (v:IsDescendantOf(getPlayer.Character)) then
                    utilities[tostring("mass"):lower()] += (tonumber(v:GetMass()))
                end
            end

            warn(tostring(tostring((getPlayer)["Name"]).."'s mass: "..tostring(tonumber(utilities[tostring("mass"):lower()]))))

            pcall(function()
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(tostring("#Mass: "..tostring(tonumber(math.floor(utilities[tostring("mass"):lower()])))), "All")
            end)
        end
    end
end)

insertCommand("tfling", function(getPlayer)
    if not (((tostring(getPlayer):lower()) == ("all")) or ((tostring(getPlayer):lower()) == ("others"))) then
        if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > 0) then
            for _, v in next, (plrs:GetPlayers()) do
                if v:IsA("Player") then
                    if ((tostring(v["Name"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower()) or (tostring(v["DisplayName"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower())) then
                        getPlayer = (v)
                    end
                end
            end

            if (getPlayer):IsA("Player") and ((getPlayer).Character) and ((tonumber((getPlayer).Character:FindFirstChild("Humanoid").Health)) > (0)) then
                if (plr.Character:FindFirstChildWhichIsA("Tool")) then
                    repeat task.wait()
                        plr.Character:FindFirstChild("Humanoid"):UnequipTools()
                    until not (plr.Character:FindFirstChildWhichIsA("Tool"))
                end

                repeat task.wait() until not (plr.Character:FindFirstChildWhichIsA("Tool"))

                if ((tonumber(#plr.Backpack:GetChildren())) > (0)) and ((tonumber(#plr.Backpack:GetChildren())) >= (1)) then
                    local seats = {}; table.clear(seats)

                    repeat task.wait() until ((tonumber(#seats)) <= (0))

                    for _, v in next, (game:GetService("Workspace"):GetDescendants()) do
                        if v:IsA("Seat") and (v:IsDescendantOf(game:GetService("Workspace"))) then
                            table.insert(seats, v)
                        end
                    end

                    if ((tonumber(#seats)) > (0)) and ((tonumber(#seats)) >= (1)) then
                        plr.Character:FindFirstChild("Humanoid").Sit = (true)
                        repeat task.wait() until (plr.Character:FindFirstChild("Humanoid").Sit)

                        game:GetService("Workspace")["FallenPartsDestroyHeight"] = (0/0)

                        local tool = (plr.Character:FindFirstChildWhichIsA("Tool") or plr.Backpack:FindFirstChildWhichIsA("Tool"))

                        if (plr.Character) and (plr.Character["PrimaryPart"]) and not (plr.Character["PrimaryPart"].Anchored) then
                            plr.Character:SetPrimaryPartCFrame(plr.Character:GetModelCFrame() * CFrame.new(0, -25, 0)); wait(1/2)

                            plr.Character["PrimaryPart"].Anchored = (true)
                            repeat task.wait() until (plr.Character["PrimaryPart"].Anchored)

                            function method()
                                if (plr.Character:FindFirstChildWhichIsA("Tool")) then
                                    repeat task.wait()
                                        plr.Character:FindFirstChild("Humanoid"):UnequipTools()
                                    until not (plr.Character:FindFirstChildWhichIsA("Tool"))
                                end

                                repeat task.wait() until not (plr.Character:FindFirstChildWhichIsA("Tool"))

                                plr.Character:FindFirstChild("Humanoid"):EquipTool(tool)
                                repeat task.wait() until (tool:IsDescendantOf(plr.Character)) and (plr.Character:FindFirstChildWhichIsA("Tool"))

                                if (tool) and ((tool):IsDescendantOf(plr.Character)) and (plr.Character:FindFirstChildWhichIsA("Tool")) then
                                    repeat task.wait()
                                        plr.Character:FindFirstChild("Humanoid"):UnequipTools()
                                    until not (tool:IsDescendantOf(plr.Character)) and not (plr.Character:FindFirstChildWhichIsA("Tool"))
                                end

                                repeat task.wait() until not (tool:IsDescendantOf(plr.Character)) and not (plr.Character:FindFirstChildWhichIsA("Tool"))

                                tool["Parent"] = (plr.Character)
                                tool["Parent"] = (plr.Backpack)
                                tool["Parent"] = (plr.Character:FindFirstChild("Humanoid"))
                                tool["Parent"] = (plr.Character)
                            end

                            for i = 1, 2 do
                                method(); wait(1/2)

                                spawn(function()
                                    if (tonumber(i) == (2)) then
                                        method()
                                    end
                                end); task.wait()
                            end; wait(2)
                        end

                        if (tool) and ((tool):IsDescendantOf(plr.Character)) and (plr.Character:FindFirstChildWhichIsA("Tool")) then
                            repeat task.wait()
                                plr.Character:FindFirstChild("Humanoid"):UnequipTools()
                            until not (tool:IsDescendantOf(plr.Character)) and not (plr.Character:FindFirstChildWhichIsA("Tool"))
                        end

                        repeat task.wait() until not ((tool):IsDescendantOf(plr.Character)) and not (plr.Character:FindFirstChildWhichIsA("Tool"))

                        if not (plr.Character:FindFirstChildWhichIsA("Tool")) then
                            rs = game:GetService("RunService").Heartbeat:Connect(function()
                                if ((getPlayer).Character) and ((tonumber((getPlayer).Character:FindFirstChild("Humanoid").Health)) > 0) and ((getPlayer).Character["PrimaryPart"]) and (tool) and (tool:FindFirstChild("Handle")) then
                                    tool:FindFirstChild("Handle").Velocity = Vector3.new(28, 0, 20)
                                    tool:FindFirstChild("Handle").CFrame = ((getPlayer).Character["PrimaryPart"].CFrame)
                                    tool:FindFirstChild("Handle").RotVelocity = Vector3.new(9e9, 9e9, 9e9)
                                else
                                    rs:Disconnect()
                                end
                            end)

                            tool["Parent"] = (plr.Character)
                            tool["Parent"] = (plr.Backpack)

                            repeat task.wait() until ((tool):IsDescendantOf(plr.Backpack)) and not ((tool):IsDescendantOf(plr.Character)) and not (plr.Character:FindFirstChildWhichIsA("Tool"))

                            local seat = (seats[tonumber(math.random(1, tonumber(#seats)))])

                            plr.Character:SetPrimaryPartCFrame(seat["CFrame"] * CFrame.new(0, 0, 7)); wait(1/2)

                            tool["Parent"] = (plr.Character)
                            tool["Parent"] = (plr.Backpack)
                            repeat task.wait() until ((tool):IsDescendantOf(plr.Backpack)) and not ((tool):IsDescendantOf(plr.Character)) and not (plr.Character:FindFirstChildWhichIsA("Tool"))

                            repeat task.wait()
                                seat:Sit(plr.Character:FindFirstChild("Humanoid"))
                            until (plr.Character:FindFirstChild("Humanoid").Sit)

                            repeat task.wait() until (plr.Character:FindFirstChild("Humanoid").Sit)

                            plr.Character:FindFirstChild("Humanoid").Health = (0)
                            repeat task.wait() until ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) <= (0))

                            tool["Parent"] = (plr.Character)

                            tool:FindFirstChild("Handle").CanCollide = (false)
                            repeat task.wait() until (((tool):FindFirstChild("Handle").CanCollide) == (false))

                            for _, v in next, (game:GetService("Workspace"):GetDescendants()) do
                                if (v:IsA("BasePart") or v:IsA("Part")) and (v:IsDescendantOf(game:GetService("Workspace"))) then
                                    if (tool) and ((tool):FindFirstChild("Handle")) then
                                        local ncc = Instance.new("NoCollisionConstraint", v)
                                        ncc["Enabled"] = (true)
                                        ncc["Part0"] = ((tool):FindFirstChild("Handle"))
                                        ncc["Part1"] = (v)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    elseif (((tostring(getPlayer):lower()) == ("all")) or ((tostring(getPlayer):lower()) == ("others"))) then
        if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) then
            if (plr.Character:FindFirstChildWhichIsA("Tool")) then
                repeat task.wait()
                    plr.Character:FindFirstChild("Humanoid"):UnequipTools()
                until not (plr.Character:FindFirstChildWhichIsA("Tool"))
            end

            repeat task.wait() until not (plr.Character:FindFirstChildWhichIsA("Tool"))

            if ((tonumber(#plr.Backpack:GetChildren())) > (0)) and ((tonumber(#plr.Backpack:GetChildren())) >= (1)) then
                local seats = {}; table.clear(seats)

                repeat task.wait() until ((tonumber(#seats)) <= (0))

                for _, v in next, (game:GetService("Workspace"):GetDescendants()) do
                    if v:IsA("Seat") and (v:IsDescendantOf(game:GetService("Workspace"))) then
                        table.insert(seats, v)
                    end
                end

                if ((tonumber(#seats)) > (0)) and ((tonumber(#seats)) >= (1)) then
                    plr.Character:FindFirstChild("Humanoid").Sit = (true)
                    repeat task.wait() until (plr.Character:FindFirstChild("Humanoid").Sit)

                    game:GetService("Workspace")["FallenPartsDestroyHeight"] = (0/0)

                    local tool = (plr.Character:FindFirstChildWhichIsA("Tool") or plr.Backpack:FindFirstChildWhichIsA("Tool"))

                    if (plr.Character) and (plr.Character["PrimaryPart"]) and not (plr.Character["PrimaryPart"].Anchored) then
                        plr.Character:SetPrimaryPartCFrame(plr.Character:GetModelCFrame() * CFrame.new(0, -25, 0)); wait(1/2)

                        plr.Character["PrimaryPart"].Anchored = (true)
                        repeat task.wait() until (plr.Character["PrimaryPart"].Anchored)

                        function method()
                            if (plr.Character:FindFirstChildWhichIsA("Tool")) then
                                repeat task.wait()
                                    plr.Character:FindFirstChild("Humanoid"):UnequipTools()
                                until not (plr.Character:FindFirstChildWhichIsA("Tool"))
                            end

                            repeat task.wait() until not (plr.Character:FindFirstChildWhichIsA("Tool"))

                            plr.Character:FindFirstChild("Humanoid"):EquipTool(tool)
                            repeat task.wait() until (tool:IsDescendantOf(plr.Character)) and (plr.Character:FindFirstChildWhichIsA("Tool"))

                            if (tool) and (tool:IsDescendantOf(plr.Character)) and (plr.Character:FindFirstChildWhichIsA("Tool")) then
                                repeat task.wait()
                                    plr.Character:FindFirstChild("Humanoid"):UnequipTools()
                                until not (tool:IsDescendantOf(plr.Character)) and not (plr.Character:FindFirstChildWhichIsA("Tool"))
                            end

                            repeat task.wait() until not (tool:IsDescendantOf(plr.Character)) and not (plr.Character:FindFirstChildWhichIsA("Tool"))

                            tool["Parent"] = (plr.Character)
                            tool["Parent"] = (plr.Backpack)
                            tool["Parent"] = (plr.Character:FindFirstChild("Humanoid"))
                            tool["Parent"] = (plr.Character)
                        end

                        for i = 1, 2 do
                            method(); wait(1/2)

                            spawn(function()
                                if (tonumber(i) == (2)) then
                                    method()
                                end
                            end); task.wait()
                        end; wait(2)
                    end

                    if (tool) and ((tool):IsDescendantOf(plr.Character)) and (plr.Character:FindFirstChildWhichIsA("Tool")) then
                        repeat task.wait()
                            plr.Character:FindFirstChild("Humanoid"):UnequipTools()
                        until not (tool:IsDescendantOf(plr.Character)) and not (plr.Character:FindFirstChildWhichIsA("Tool"))
                    end

                    repeat task.wait() until not ((tool):IsDescendantOf(plr.Character)) and not (plr.Character:FindFirstChildWhichIsA("Tool"))

                    if not (plr.Character:FindFirstChildWhichIsA("Tool")) then
                        tool["Parent"] = (plr.Character)
                        tool["Parent"] = (plr.Backpack)

                        repeat task.wait() until ((tool):IsDescendantOf(plr.Backpack)) and not ((tool):IsDescendantOf(plr.Character)) and not (plr.Character:FindFirstChildWhichIsA("Tool"))

                        local seat = (seats[tonumber(math.random(1, tonumber(#seats)))])

                        plr.Character:SetPrimaryPartCFrame(seat["CFrame"] * CFrame.new(0, 0, 7)); wait(1/2)

                        tool["Parent"] = (plr.Character)
                        tool["Parent"] = (plr.Backpack)
                        repeat task.wait() until ((tool):IsDescendantOf(plr.Backpack)) and not ((tool):IsDescendantOf(plr.Character)) and not (plr.Character:FindFirstChildWhichIsA("Tool"))

                        repeat task.wait()
                            seat:Sit(plr.Character:FindFirstChild("Humanoid"))
                        until (plr.Character:FindFirstChild("Humanoid").Sit)

                        repeat task.wait() until (plr.Character:FindFirstChild("Humanoid").Sit)

                        plr.Character:FindFirstChild("Humanoid").Health = (0)
                        repeat task.wait() until ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) <= (0))

                        tool["Parent"] = (plr.Character)

                        tool:FindFirstChild("Handle").CanCollide = (false)
                        repeat task.wait() until (((tool):FindFirstChild("Handle").CanCollide) == (false))

                        for _, v in next, (game:GetService("Workspace"):GetDescendants()) do
                            if (v:IsA("BasePart") or v:IsA("Part")) and (v:IsDescendantOf(game:GetService("Workspace"))) then
                                if (tool) and (tool:FindFirstChild("Handle")) then
                                    local ncc = Instance.new("NoCollisionConstraint", v)
                                    ncc["Enabled"] = (true)
                                    ncc["Part0"] = (tool:FindFirstChild("Handle"))
                                    ncc["Part1"] = (v)
                                end
                            end
                        end

                        local oldPlayers = {}; table.clear(oldPlayers)

                        repeat task.wait() until ((tonumber(#oldPlayers)) <= (0))

                        loops[tostring("newLoop"):lower()] = (true)

                        while (loops[tostring("newLoop"):lower()]) do
                            if (tool) and ((tool):FindFirstChild("Handle")) then
                                for _, v in next, (plrs:GetPlayers()) do
                                    if v:IsA("Player") and (v:IsDescendantOf(plrs)) and (v.Character) and ((tonumber(v.Character:FindFirstChild("Humanoid").Health)) > (0)) and (v.Character["PrimaryPart"]) then
                                        if not (table.find(oldPlayers, v)) and not (table.find(api["wl"], tostring(v["Name"]))) and not (table.find(api["wl"], tostring(v["DisplayName"]))) and not (v.Character:FindFirstChild("Humanoid").Sit) then
                                            local counter = (0)

                                            repeat task.wait()
                                                tool:FindFirstChild("Handle").Velocity = Vector3.new(28, 0, 20)
                                                tool:FindFirstChild("Handle").CFrame = (v.Character["PrimaryPart"].CFrame)
                                                tool:FindFirstChild("Handle").RotVelocity = Vector3.new(9e9, 9e9, 9e9)
                                                counter+=(1)
                                            until (tonumber(counter) >= (5))
                                        end
                                    end
                                end
                            else
                                table.clear(oldPlayers)
                                loops[tostring("newLoop"):lower()] = (false)
                            end; task.wait()
                        end
                    end
                end
            end
        end
    end
end)

insertCommand("fseat", function()
    if (plr.Character) and (tonumber(plr.Character:FindFirstChild("Humanoid").Health) > (0)) then
        local seats = {}; table.clear(seats)

        for _, v in next, (game:GetService("Workspace"):GetDescendants()) do
            if v:IsA("Seat") and (v:IsDescendantOf(game:GetService("Workspace"))) then
                table.insert(seats, v)
            end
        end

        if (tonumber(#seats) <= (0)) then
            return (warn("#Seats:", tonumber(#seats)))
        elseif ((tonumber(#seats) > (0)) or (tonumber(#seats) >= (1))) then
            warn(tostring("#Seats: "..tonumber(#seats)))
            seats[tonumber(math.random(1, tonumber(#seats)))]:Sit(plr.Character:FindFirstChild("Humanoid"))
        end
    end
end)

insertCommand("alog", function(getPlayer)
    if not ((tostring(getPlayer):lower() == ("all")) or (tostring(getPlayer):lower() == ("others"))) then
        for _, v in next, (plrs:GetPlayers()) do
            if v:IsA("Player") then
                if ((tostring(v["Name"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower()) or (tostring(v["DisplayName"]):lower():sub(1, tonumber(string.len(tostring(getPlayer)))) == tostring(getPlayer):lower())) then
                    getPlayer = (v)
                end
            end
        end

        if ((getPlayer).Character) and (tonumber((getPlayer).Character:FindFirstChild("Humanoid").Health) > (0)) then
            local getId
            local split = {
                "=",
                "://"
            }

            for _, v in next, ((getPlayer).Character:GetDescendants()) do
                if v:IsA("Sound") and (v:IsDescendantOf((getPlayer).Character)) and (v:FindFirstAncestorOfClass("Tool")) then
                    warn(tostring(getPlayer["Name"]), "| Full-ID:", v["SoundId"])

                    for o, z in next, (split) do
                        if (type(z) == "string") then
                            getId = string.split(tostring(v["SoundId"]), tostring(z))

                            if not (tostring(getId[2]):lower() == ("nil")) then
                                getId = (getId[2])
                                warn("Copied audio from "..tostring(getPlayer["Name"]).." : "..tostring(getId))
                                break
                            end
                        end
                    end
                end
            end
        end
    elseif ((tostring(getPlayer):lower() == ("all")) or (tostring(getPlayer):lower() == ("others"))) then
        for i, z in next, (plrs:GetPlayers()) do
            if z:IsA("Player") and (z.Character) and (tonumber(z.Character:FindFirstChild("Humanoid").Health) > (0)) then
                local getId
                local split = {
                    "=",
                    "://"
                }

                for _, v in next, ((z).Character:GetDescendants()) do
                    if v:IsA("Sound") and (v:IsDescendantOf((getPlayer).Character)) and (v:FindFirstAncestorOfClass("Tool")) then
                        warn(tostring(z["Name"]), "| Full-ID:", v["SoundId"])

                        for o, z in next, (split) do
                            if (type(z) == ("string")) then
                                getId = string.split(tostring(v["SoundId"]), tostring(z))

                                if not (tostring(getId[2]):lower() == ("nil")) then
                                    getId = (getId[2])
                                    warn("Copied audio from "..tostring(z["Name"]).." : "..tostring(getId))
                                    break
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

insertCommand("csync", function(getPlayer)
    if (plr.Character) and (tonumber(plr.Character:FindFirstChild("Humanoid").Health) > 0) then
        if ((getPlayer).Character) and (tonumber((getPlayer).Character:FindFirstChild("Humanoid").Health) > (0)) then
            local sounds = {}; table.clear(sounds)

            repeat task.wait() until (tonumber(#sounds) <= (0))

            for _, v in next, (game:GetService("Workspace"):GetDescendants()) do
                if (v:IsA("Sound")) and (v:IsDescendantOf(plr.Character) or v:IsDescendantOf((getPlayer).Character)) and (v["Playing"]) then
                    table.insert(sounds, v)
                end
            end

            if (tonumber(#sounds) > (0)) and (tonumber(#sounds) >= (1)) then
                local setup = coroutine.create(function()
                    for i = 1, tonumber(#sounds) do
                        sounds[tonumber(i)].Playing = (false)
                        sounds[tonumber(i)].TimePosition = (0)
                        repeat task.wait() until (sounds[tonumber(i)].Playing == (false)) and (sounds[tonumber(i)].TimePosition == (0))
                    end
                end); coroutine.resume(setup)

                repeat task.wait() until (tostring(coroutine.status(setup)):lower() == ("dead"))

                task.spawn(function()
                    local count = (0)
                    repeat task.wait()
                        for _, v in next, (sounds) do
                            if (v.Playing ~= (true)) then
                                local reset = coroutine.wrap(function()
                                    for i = 1, tonumber(#sounds) do
                                        sounds[tonumber(i)].TimePosition = (0)
                                    end
                                end); reset()
                            elseif (v.Playing ~= (false)) then
                                count+=1
                            end
                        end
                    until (tonumber(count) >= tonumber(#sounds))
                end)

                local play = coroutine.wrap(function()
                    for i = 1, tonumber(#sounds) do
                        sounds[tonumber(i)].Playing = (true)
                    end
                end); play()
            end
        end
    end
end)

insertCommand("ws", function(number)
    if ((type(tonumber(number))) == ("number")) then
        if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) then
            plr.Character:FindFirstChild("Humanoid").WalkSpeed = (tonumber(number))
        end
    end
end)

insertCommand("jp", function(number)
    if ((type(tonumber(number))) == ("number")) then
        if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) then
            plr.Character:FindFirstChild("Humanoid").JumpPower = (tonumber(number))
        end
    end
end)

insertCommand("#cmds", function()
    local Counter = (0)

    table.foreach((api[tostring("cmds"):lower()]), function()
        Counter+=(1)
    end)

    warn(tostring("#Cmds: "..tonumber(Counter)))

    pcall(function()
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(tostring("#Cmds: "..tonumber(Counter)), "All")
    end)
end)

insertCommand("fvoid", function()
    if (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) then
        game:GetService("Workspace")["FallenPartsDestroyHeight"] = (0/0)

        local saveCF = (plr.Character:GetModelCFrame());

        plr.Character:SetPrimaryPartCFrame(plr.Character:GetModelCFrame() * CFrame.new(0, -498, 0)); wait(1)
        plr.Character:SetPrimaryPartCFrame(saveCF); property()
    end
end)

insertCommand("sh", function()
    local Url = ("https://games.roblox.com/v1/games/"..(tostring(game["PlaceId"]):lower()).."/servers/serverType=0&sortOrder=2")
    local HttpService = (game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(tostring(Url))))

    local Servers = {}; table.clear(Servers)

    repeat task.wait() until (tonumber(#Servers) <= (0))

    table.foreach(HttpService, function(i, v)
        if (type(v) == ("table"):lower()) then
            for n, t in next, (v) do
                if (type(t) == ("table"):lower()) then
                    local JobId = (tostring(t[tostring("id"):lower()]))
                    local Clients = (tonumber(t[tostring("playing"):lower()]))
                    local Max = (tonumber(t[tostring("maxPlayers")]))
                    local Ping = (tonumber(t[tostring("ping"):lower()]))

                    if ((JobId) ~= (tostring(game["JobId"]):lower())) and ((Clients) < (Max)) and ((Ping) <= (100)) then
                        table.insert(Servers, (tostring(t[tostring("id"):lower()])))
                    end
                end
            end
        end
    end)

    local Random = (tostring(Servers[tonumber(math.random(1, tonumber(#Servers)))]):lower())

    pcall(function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(tonumber(game["PlaceId"]), (Random), (game:GetService("Players")["LocalPlayer"]))
    end)
end)

insertCommand("aca", function()
    if ((game:GetService("StarterPlayer")["AllowCustomAnimation"]) ~= (true)) then
        game:GetService("StarterPlayer")["AllowCustomAnimation"] = (true)
        repeat task.wait() until ((game:GetService("StarterPlayer")["AllowCustomAnimation"]) ~= false)

        if (plr) and (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) then
            local SaveCF = (plr.Character:GetModelCFrame()); wait(1/4)

            plr.Character:FindFirstChild("Humanoid").Health = (0)
            plr["CharacterAdded"]:Wait():WaitForChild("Humanoid")

            task.spawn(function()
                for i = 1, 10 do
                    if (plr) and (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) then
                        plr.Character:SetPrimaryPartCFrame(SaveCF); property()
                    end; task.wait()
                end
            end)
        end
    end
end)

insertCommand("kill", function(arg)
    if arg == "all" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FileExpIorer/LuaU/main/Codes/killall.lua"))()
    end
end)

insertCommand("rtype", function(RigType)
    if (plr) and (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) then
        if ((tostring(RigType):lower()) == (("R15"):lower())) then
            if (plr) and (plr.Character) and ((plr.Character:FindFirstChild("Humanoid").RigType) ~= (Enum.HumanoidRigType["R15"])) then
                game:GetService("AvatarEditorService"):PromptSaveAvatar((plrs:GetHumanoidDescriptionFromUserId(tonumber(plr["UserId"]))), (Enum.HumanoidRigType["R15"]))
                repeat task.wait() until ((game:GetService("AvatarEditorService")["PromptSaveAvatarCompleted"]:Wait()) == (Enum.AvatarPromptResult["Success"]))

                if ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) then
                    local SaveCF = (plr.Character:GetModelCFrame()); wait(1/4)

                    plr.Character:FindFirstChild("Humanoid").Health = (0)
                    plr["CharacterAdded"]:Wait():WaitForChild("Humanoid")

                    task.spawn(function()
                        for i = 1, 10 do
                            if (plr) and (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) then
                                plr.Character:SetPrimaryPartCFrame(SaveCF); property()
                            end; task.wait()
                        end
                    end)
                end
            end
        elseif ((tostring(RigType):lower()) == (("R6"):lower())) then
            if (plr) and (plr.Character) and ((plr.Character:FindFirstChild("Humanoid").RigType) ~= (Enum.HumanoidRigType["R6"])) then
                game:GetService("AvatarEditorService"):PromptSaveAvatar((plrs:GetHumanoidDescriptionFromUserId(tonumber(plr["UserId"]))), (Enum.HumanoidRigType["R6"]))
                repeat task.wait() until ((game:GetService("AvatarEditorService")["PromptSaveAvatarCompleted"]:Wait()) == (Enum.AvatarPromptResult["Success"]))

                if ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) then
                    local SaveCF = (plr.Character:GetModelCFrame()); wait(1/4)

                    plr.Character:FindFirstChild("Humanoid").Health = (0)
                    plr["CharacterAdded"]:Wait():WaitForChild("Humanoid")

                    task.spawn(function()
                        for i = 1, 10 do
                            if (plr) and (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) then
                                plr.Character:SetPrimaryPartCFrame(SaveCF); property()
                            end; task.wait()
                        end
                    end)
                end
            end
        end
    end
end)

insertCommand("rtool", function(Type)
    if (plr) and (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) then
        if ((tostring(Type):lower()) == (("all"):lower())) then
            if (plr.Character:FindFirstChildWhichIsA("Tool")) then
                plr.Character:FindFirstChild("Humanoid"):UnequipTools()
            end

            repeat task.wait() until not (plr.Character:FindFirstChildWhichIsA("Tool"))

            task.spawn(function()
                table.foreach(plr.Backpack:GetChildren(), function(i, v)
                    if v:IsA("Tool") and (v:IsDescendantOf(plr.Backpack)) then
                        v:Remove()
                    end
                end)
            end)
        else
            if (plr.Character:FindFirstChildWhichIsA("Tool")) then
                local tool = {}; table.clear(tool)

                repeat task.wait() until ((tonumber(#tool)) <= (0))

                task.spawn(function()
                    for _, v in next, (plr.Character:GetChildren()) do
                        if v:IsA("Tool") and (v:IsDescendantOf(plr.Character)) then
                            table.insert(tool, v)
                            break
                        end
                    end
                end)

                repeat task.wait() until ((tonumber(#tool)) >= (1))

                table.foreach(tool, function(i, v)
                    if v:IsA("Tool") and (v:IsDescendantOf(plr.Character)) then
                        v["Parent"] = plr.Backpack; v:Remove()
                    end
                end); table.clear(tool)
                tool = (nil)
            end
        end
    end
end)

insertCommand("idle", function(args)
    if (plr) and (plr.Character) and ((tonumber(plr.Character:FindFirstChild("Humanoid").Health)) > (0)) then
        if ((plr.Character:FindFirstChild("Humanoid").RigType) ~= (Enum.HumanoidRigType["R6"])) then
            local Animate = (plr.Character:FindFirstChild("Animate"))

            if (Animate) then
                local Idle = ((Animate):FindFirstChild(tostring("idle"):lower()))

                if not (utilities[tostring("default"):lower()]) then
                    utilities[tostring("default"):lower()] = {}; table.clear(utilities[tostring("default"):lower()])
                    repeat task.wait() until ((tonumber(#utilities[tostring("default"):lower()])) <= (0))

                    for _, v in next, ((Idle):GetChildren()) do
                        if v:IsA("Animation") and (v:IsDescendantOf(Idle)) then
                            table.insert((utilities[tostring("default"):lower()]), (tostring(v["AnimationId"]):lower()))
                        end
                    end
                end

                if ((tostring(args):lower()) == (("default"):lower())) then
                    table.foreach((Idle):GetChildren(), function(i, v)
                        if v:IsA("Animation") and (v:IsDescendantOf(Idle)) then
                            v["AnimationId"] = (tostring(utilities[tostring("default"):lower()][tonumber(i)]):lower())
                        end
                    end)
                else
                    local Animation = {"http://www.roblox.com/asset/?id=4211217646"}

                    table.foreach((Idle):GetChildren(), function(i, v)
                        if v:IsA("Animation") and (v:IsDescendantOf(Idle)) then
                            v["AnimationId"] = (tostring(Animation[1]):lower())
                        end
                    end)
                end
            end
        end
    end
end)

insertCommand("st", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FileExpIorer/LuaU/main/Codes/stroller.lua"))()

    for i = 1, 5 do
        property()
        task.wait()
    end
end)

insertCommand("cbp", function()
    plr.Backpack:ClearAllChildren()
end)

insertCommand("sd2", function(arg)
    pcall(function()
        arg = tonumber(arg)
    end)

    if type(arg) == "number" then
        for i = 1, arg do
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FileExpIorer/LuaU/main/Codes/stroller.lua"))()

            spawn(function()
                for i = 1, 5 do
                    property()
                    task.wait()
                end
            end)

            wait(1/2)
        end
    end
end)

insertCommand("morph", function()
    workspace.Events.Morph.Player:FireServer("Sheep")
end)

insertCommand("void", function(arg)
    if arg == "all" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FileExpIorer/LuaU/main/Codes/voidall.lua"))()

        for i = 1, 5 do
            property()
            task.wait()
        end
    end
end)
