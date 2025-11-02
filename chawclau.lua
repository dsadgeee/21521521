_G.Config = {
    UserID = "0d28ea66-a410-47c0-a707-06d7cb199774",
    discord_id = "698853568291143821",
    Note = "Pc"
}

local success

for i = 1, 5 do
    success = pcall(function()
        loadstring(game:HttpGet("https://cdn.yummydata.click/scripts/pet99"))()
    end)

    if success then
        break
    end

    wait(5)
end
