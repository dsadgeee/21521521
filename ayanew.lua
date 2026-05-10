getgenv().Config = {
    ["Performance"] = {
        ["Optimization"] = true,                  
        ["FPS Cap"] = 5,                           
    },
    ["Auto Roll"] = {
        ["Enabled"] = true,                          -- master switch for auto-rolling
        ["Hide Roll"] = true,                        -- hide roll animation
        ["Equip Best"] = true,                       -- auto-equip best slimes
    },
    ["Auto Use Dice"] = {                            -- dice to auto-use when available
        "jackpotSpin",
        "bigDice",
        "hugeDice",
        "shinyDice",
        "invertedDice",
    },
    ["Auto Use Boost"] = {                           -- boosts to auto-activate
        "luck",
        "ultraLuck",
        "currency",
        "rollSpeed",
    },
    ["Auto Use Food"] = {                            -- food to auto-feed slimes
        "apple", "carrot", "cherries", "grapes",
        "banana", "watermelon", "pizza", "chicken", "drumstick",
    },
    ["Auto Upgrade"] = {
        ["Enabled"] = true,                          -- auto-buy upgrades in priority order
    },
    ["Rebirth"] = {
        ["Enabled"] = true,
        ["Max Rebirths"] = 100,
        ["Switch Account"] = true,
        ["Switch At Rebirth"] = 10,
    },
    ["Webhook"] = {
        ["Url"] = "",                                -- your Discord webhook URL
        ["Discord ID"] = "",                         -- your Discord user ID (for pings, right-click → Copy User ID)
        ["Min Rarity"] = 10000000,                    -- only notify for slimes rarer than 1/X
    },
}

loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/d0ab46b287e5c0ebc658e9f5dc7a8dcb.lua"))()
