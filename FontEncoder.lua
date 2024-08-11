for Index, Value in next, get_actors() do 
    run_on_actor(Value, [[
        local Stats = cloneref(game:GetService("Stats"))
        local Memory = Stats:GetTotalMemoryUsageMb()
        local GetTotalMemoryUsageMb = Stats.GetTotalMemoryUsageMb;
        local MT = getrawmetatable(game:GetService("Stats"))

        setreadonly(MT, false)
        local Namecall = MT.__namecall;
        MT.__namecall = function(self, ...)
            local Method = getnamecallmethod()

            if Method == "GetTotalMemoryUsageMb" then
                local Fake = Memory + math.random(1, 3) + math.random() / 10
                return Fake
            
            end

            return Namecall(self, ...)
        end
        setreadonly(MT, true)   
    ]])
end;
