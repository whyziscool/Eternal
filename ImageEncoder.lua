local LogService = game:GetService("LogService")
local LogServiceMT = getrawmetatable(LogService)

setreadonly(LogServiceMT, false) 

local Namecall = LogServiceMT.__namecall; 

LogServiceMT.__namecall = function(self, ...)
    local Method = getnamecallmethod()
    if Method == "GetLogHistory" then 
        local History = Namecall(self, ...)

        for Index, Value in next, History do 
            if type(Value) == "table" and rawget(Value, "messageType") and rawget(Value, "message") then 
                if Value.messageType == Enum.MessageType.MessageError and tostring(Value.message):find("Expected <eof>") then 
                    History[Index] = nil;
                end;
            end;
        end;

        return History
    end;
    return Namecall(self, ...)
end;

setreadonly(LogServiceMT, true)
