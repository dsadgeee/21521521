-- ===== PHẦN 1: Check ID và teleport trước =====
if game.Players.LocalPlayer.UserId == 16498369169 then
    pcall(function()
        game:GetService('ReplicatedStorage').Network.World1Teleport:InvokeServer()
    end)
end

-- ===== PHẦN 2: Cấu hình và load script chính =====
_G.Config = {
    UserID = "0d28ea66-a410-47c0-a707-06d7cb199774",
    discord_id = "698853568291143821",
    Note = "Pc"
}

for i = 1, 5 do
    if pcall(function()
        loadstring(game:HttpGet("https://cdn.yummydata.click/scripts/pet99"))()
    end) then break end
    wait(5)
end
