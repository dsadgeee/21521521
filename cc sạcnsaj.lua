script_key="LMZSkxjeZUZYLSXqGArNCxHxHMfbEurf";
getgenv().Config = {
    ["Webhook"] = {
        ["URL"] = "https://discord.com/api/webhooks/1265500893449551934/9Y12HBUZsSvGqVYveY-9_jwKPC75xTJOV8urcnrecLadbpzstwzHiJtV54qb2UBW5Uvu",
        ["Discord Id to ping"] = {""},
        ["Send Normal Huges"] = true,
    },
    ["CPU Saver"] = true,
    ["Upgrades"] = {
        ["TapHeroesPetDamage"] = 99,
        ["TapHeroesClickDamage"] = 99,
        ["TapHeroesCoinBonus"] = 99,
        ["TapHeroesEggUpgrade"] = 99,
        ["TapHeroesPermPetDamage"] = 99,
        ["TapHeroesPermLuck"] = 99,
        ["TapHeroesFrenzyDamage"] = 99,
    },
    ["Auto Enchant"] = {"Chest Breaker","Chest Breaker","Criticals","Tap Power","Tap Power","Tap Power"},

    ["Max Rebirths"] = 5,
    ["Max Area"] = 180,
    ["Max Transced"] = 5,
    ["MaxUpgradeCost"] = 1000,
    ["MaxPetSlots"] = 25,
    ["FarmChests"] = {60,120,160,180},
    ["Rank Before"] = true,
["Mail Settings"] = {
["User"] = "TunTrapBoy",
        ["Min_Gems"] = 10000000,
         ["Mailing"] = {
            ["Obsidian Gift"] = {
                Class = "Lootbox",
                MinAmount = 100
            },
            ["Marble Gift"] = {
                Class = "Lootbox",
                MinAmount = 100
            },
            ["Chest Breaker"] = {
                Class = "Enchant",
                MinAmount = 1
            },
        },
        ["Send Old Huges"] = true,
    },

    ["AutoOpenGifts"] = false,
    ["AutoUseBoosts"] = true,
}
loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/1cd3ec56748e11904f301e7820e4817d.lua"))()
