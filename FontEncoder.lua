for Index, FallenGuardActor in next, getactors() do 
    run_on_actor(FallenGuardActor, [[
        local Stats = game:GetService("Stats");

        local Namecall; Namecall = hookmetamethod(Stats, "__namecall", function(self, ...)
            local Method = getnamecallmethod();

            if Method == "GetTotalMemoryUsageMb" then
                return 0/0;
            end;

            return Namecall(self, ...)
        end);
    ]])
end;
