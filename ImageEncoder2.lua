for Index, Value in next, get_actors() do 
      run_on_actor(Value, [[
            local LogService = game:GetService("LogService")
            local LogServiceMT = getrawmetatable(LogService)
            
            setreadonly(LogServiceMT, false)
            
            local Namecall = LogServiceMT.__namecall;
            
            LogServiceMT.__namecall = function(self, ...)
                local Method = getnamecallmethod()
                if Method == "GetLogHistory" then 
                    local History = Namecall(self, ...)
                    local ModifiedHistory = {}
                    
                    for Index, Value in next, History do 
                        if type(Value) == "table" and rawget(Value, "messageType") and rawget(Value, "message") then 
                            if not (Value.messageType == Enum.MessageType.MessageError and tostring(Value.message):find("Expected <eof>")) then 
                                table.insert(ModifiedHistory, Value)
                            end
                        end
                    end
                    return ModifiedHistory
                end
                return Namecall(self, ...)
            end;
            
            setreadonly(LogServiceMT, true)
    ]])
end;
