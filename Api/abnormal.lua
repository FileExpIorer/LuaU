if not (game:IsLoaded()) then
    repeat task.wait() until (game:IsLoaded())
end

local api = {
    ["prefix"] = {["old"] = "nil", ["new"] = "/"},
    ["wl"] = {"ReincarnatedEnergy", "5qea", "u73x"},
    ["bl"] = {},
    ["cmds"] = {},
    ["extensions"] = {}
}

table.clear(api[tostring("cmds"):lower()]); table.clear(api[tostring("cmds"):lower()])
repeat task.wait() until ((tonumber(#api[tostring("cmds"):lower()])) <= (0)) and ((tonumber(#api[tostring("extensions"):lower()])) <= (0))

local plrs = (game:GetService("Players"))
local plr = (plrs.LocalPlayer)

if not (table.find(api[tostring("wl"):lower()], (tostring(plr["Name"])))) then
    table.insert(api[tostring("wl"):lower()], (tostring(plr["Name"])))
end

repeat task.wait() until (table.find(api[tostring("wl"):lower()], (tostring(plr["Name"]))))

task.spawn(function()
    table.clear(api[tostring("extensions"):lower()])
    repeat task.wait() until ((tonumber(#api[tostring("extensions"):lower()])) <= (0))

    for _, v in next, (api[tostring("wl"):lower()]) do
        if (type(v) == ("string"):lower()) and (table.find(api[tostring("wl"):lower()], (tostring(v)))) and not (table.find(api[tostring("bl"):lower()], (tostring(v)))) then
            table.insert(api[tostring("extensions"):lower()], (v))
        end
    end

    game:GetService("RunService").Heartbeat:Connect(function()
        pcall(function()
            for _, v in next, (api[tostring("extensions"):lower()]) do
                if (type(v) == ("string"):lower()) and (tostring(v):lower() ~= ("nil"):lower()) and not (table.find(api[tostring("wl"):lower()], (tostring(v)))) and not (table.find(api[tostring("bl"):lower()], (tostring(v)))) then
                    table.insert(api[tostring("wl"):lower()], (tostring(v)))
                elseif (table.find(api[tostring("bl"):lower()], (tostring(v)))) then
                    table.remove(api[tostring("bl")], (tonumber(_)))
                end
            end
        end)
    end)
end)

local function returnObject(Function, newReturn, ...)
    if  (type(Function) == ("function"):lower()) and (type(newReturn) == ("string"):lower()) then
        if (tostring(newReturn):lower() == ("me"):lower()) then
            newReturn = (api[tostring("fplr"):lower()])
            return (Function(newReturn))
        elseif (tostring(newReturn):lower() == ("random"):lower()) then
            newReturn = (plrs:GetPlayers()[math.random(1, (tonumber(#plrs:GetPlayers())))])
            return (Function(newReturn))
        else
            return (Function(...))
        end
    elseif not ((type(Function) == ("function"):lower()) or (type(newReturn) == ("string"):lower())) then
        return (warn("Invalid request: returnObject(<function>, <string>, ...)"))
    end
end

insertCommand = function(name, code)
    if (type(name):lower() == ("string"):lower()) and (type(code) == ("function"):lower()) and (type(api[tostring("prefix"):lower()][tostring("new"):lower()]) == ("string"):lower()) then
        api[tostring("cmds"):lower()][tostring(api[tostring("prefix"):lower()][tostring("new"):lower()]..name):lower()] = (code)
    elseif not ((type(name):lower() == ("string"):lower()) or (type(code) == ("function"):lower())) then
        return (warn("Invalid request: insertCommand(<string>, <function>)"))
    elseif not (type(api[tostring("prefix"):lower()][tostring("new"):lower()]) == ("string"):lower()) then
        return (warn("Invalid prefix type: type(<string>)"))
    end
end

setPrefix = function(Command, oldPrefix)
    if (type(Command) == ("string"):lower()) and (type(oldPrefix) == ("string"):lower()) then
        if (tostring(Command):lower() == tostring(oldPrefix..("prefix")):lower()) then
            local getCmds = {}; table.clear(getCmds)

            repeat task.wait() until ((tonumber(#getCmds)) <= (0))

            for _, v in next, (api[tostring("cmds"):lower()]) do
                if (type(_) == ("string"):lower()) and (type(v) == ("function"):lower()) then
                    local getName = (tostring(string.sub((tostring(_):lower()), 2, (tonumber(string.len((tostring(_):lower())))))):lower())
                    local changeName = (tostring(getName):lower())
                    getCmds[tostring(changeName):lower()] = (v)
                end
            end; table.clear(api[tostring("cmds"):lower()])

            repeat task.wait() until ((tonumber(#api[tostring("cmds"):lower()])) <= (0))

            for _, v in next, (getCmds) do
                if (type(_) == ("string"):lower()) and (type(v) == ("function"):lower()) then
                    insertCommand((tostring(_):lower()), (v))
                end
            end; table.clear(getCmds)

            repeat task.wait() until ((tonumber(#getCmds)) <= (0))
            getCmds = (nil)
        end
    elseif not ((type(Command) == ("string"):lower()) or (type(oldPrefix) == ("string"):lower())) then
        return (warn("Invalid request: setPrefix(<string>, <string>)"))
    end
end

for _, v in next, (api[tostring("wl"):lower()]) do
    if (type(v) == ("string"):lower()) and not (table.find(api[tostring("bl"):lower()], (tostring(v)))) then
        plrs:FindFirstChild(tostring(v)).Chatted:Connect(function(log)
            local message = string.split((tostring(log):lower()), " ")

            pcall(function()
                for i, o in next, (api[tostring("cmds"):lower()]) do
                    if (type(i) == ("string"):lower()) and (type(o) == ("function"):lower()) then
                        if ((tostring(message[1]):lower()) == (tostring(api[tostring("prefix"):lower()][tostring("old"):lower()]..("prefix")):lower())) then
                            setPrefix((tostring(message[1]):lower()), (tostring(api[tostring("prefix"):lower()][tostring("old"):lower()]):lower()))
                            return (v(tostring(message[2]):lower()))
                    elseif ((tostring(i):lower()) == (tostring(message[1]):lower())) then
                            returnObject((o), (tostring(message[2]):lower()), (message[2]))
                        end
                    end
                end
            end)
        end)
    end
end

return (api)
