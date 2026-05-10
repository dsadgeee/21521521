script_key = "CjCYYPWbEBbtHUDxxoMcfBEIKpGjslTI";
getgenv().GGFX_MODE = 1
getgenv().GZONE_TO = 1 -- to enter event from W1 put 1, from W2 put 100, from W3 200, from W4 240
getgenv().GDO_RNG_INSTANCE = true
getgenv().GUSE_BOOSTS = true
getgenv().GRNG_SELL_PETS = true
getgenv().GRNG_CRAFT_DICE = true
getgenv().GRNG_USE_MEGA1 = false
getgenv().GEVENT_UPGRADES = {
    { Id = "RNGEggLuck",   MaxTier = 15  },
    { Id = "RNGHatchSpeed", MaxTier = 15  },
    { Id = "RNGBonusLuck",  MaxTier = 8  },
    { Id = "RNGHugeLuck",   MaxTier = 13  },
}
getgenv().GWEBHOOK_USERID = "https://discord.com/api/webhooks/1408866660017766500/8OgtYYAinAJ9qhpqLxr_jIzUztGg0YqnxzayJql_zAyaYqzoXxUH2OhEoo9DX09HpDOF"
getgenv().GWEBHOOK_LINK = "https://discord.com/api/webhooks/1408866660017766500/8OgtYYAinAJ9qhpqLxr_jIzUztGg0YqnxzayJql_zAyaYqzoXxUH2OhEoo9DX09HpDOF"
getgenv().GHUGE_COUNT = 0 -- amount of huges to keep/not mail
getgenv().GMAIL_RECEIVERS = {"your-receiver-mule"}
getgenv().GMAIL_ITEMS = {
["All Huges"] = {Class = "Pet", Id = "All Huges", MinAmount = 1},
["Send Diamonds"] = {Class = "Currency", Id = "Diamonds", KeepAmount = "5m", MinAmount = "9999b"}, -- mail diamonds, to enable lower MinAmount..
}
getgenv().GMAX_MAIL_COST = "2m"
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/34915da4ad87a5028e1fd64efbe3543f.lua"))()
