        for Index, FallenGuardActor in next, getactors() do 
            run_on_actor(FallenGuardActor, [[
                local Stats = game:GetService("Stats");

                local Memory = Stats:GetTotalMemoryUsageMb() 

                local Namecall; Namecall = hookmetamethod(Stats, "__namecall", function(self, ...)
                    local Method = getnamecallmethod();

                    if Method == "GetTotalMemoryUsageMb" then
                        return Memory + math.random(-3, 3);
                    end;

                    return Namecall(self, ...)
                end);
            ]])
        end;
