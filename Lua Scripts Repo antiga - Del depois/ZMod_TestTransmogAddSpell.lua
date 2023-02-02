local DatabaseCache = {}
 
local function LoadDatabase()
    local ExampleQuery = CharDBQuery("SELECT FakeEntry,Owner FROM custom_transmogrification;");
    if(ExampleQuery)then
        repeat
            DatabaseCache[ExampleQuery:GetUInt32(0)] = {
                FakeEntry = ExampleQuery:GetUInt32(1),
                Owner = ExampleQuery:GetUInt32(2)
            };
        until not ExampleQuery:NextRow()
    end
end