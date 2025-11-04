setfpscap(3)
script_key = "auzzdBRFaVDxAUzDxhCCTxhqRaycDzLL";
task.wait(10) -- DO NOT remove this wait, it's against double counts.
-- INSERT YOUR CONFIG HERE --
getgenv().GGFX_MODE = 1 --1 = REMOVE_TEXTURES : more stable! but no visuals
getgenv().GRANK_FIRST = true
getgenv().GRANK_TO = 1
getgenv().GREBIRTH_TO = 1
getgenv().GZONE_TO = 1 -- to enter event from W1 put 1, from W2 put 100, from W3 200, from W4 240
getgenv().GHALLOWEEN_JOIN_LOCAL = true
getgenv().GHALLOWEEN_OPEN_HOUSE_6 = false
getgenv().GDO_HALLOWEEN_WORLD = true
getgenv().GHALLOWEEN_WORLD_BUY_FROM_SPECIFIC_HOUSE = {1,2,3,4}
getgenv().GHALLOWEEN_WORLD_RECIPES_TO_DO = {1,2,3,4,5}
getgenv().GKEEP_CURRENCY_FOR_CRAFTS = "20m"
getgenv().GALLOW_HOPPING = true
getgenv().GHOP_ON_STAFF = true
getgenv().GHALLOWEEN_WORLD_BUY_FROM_HOUSES_BELOW = false
getgenv().GHALLOWEEN_WORLD_HATCH_SPOTS = 1
getgenv().GHALLOWEEN_WORLD_ALLOW_WORSE_EGG_PLACEMENT = true
getgenv().GHALLOWEEN_WORLD_USE_BOOSTS = true
getgenv().GEVENT_UPGRADES = {
    'HalloweenCandyMultiplier',
    'HalloweenEggLuck',
    'HalloweenTrickOrTreatLuck',
    'HalloweenMoreDiamonds',
    'HalloweenMoreWitchHats',
    'HalloweenHugeLuck',
    'HalloweenTitanicLuck',
} --you can put the comment symbols (these 2 dashes): -- in front of the ones you don't want to upgrade
getgenv().GWEBHOOK_USERID = ""
getgenv().GWEBHOOK_LINK = ""
getgenv().GMAIL_RECEIVERS = {"DreamSoCow"} -- for Huges and mailrules.
getgenv().GMAIL_ITEMS = {
["All Huges"] = {Class = "Pet", Id = "All Huges", MinAmount = 1},
["Send Diamonds"] = {Class = "Currency", Id = "Diamonds", KeepAmount = "2m", MinAmount = "50m"}, -- mail diamonds, to enable lower MinAmount..
["Hype Egg 2"] = {Class = "Lootbox", Id = "Hype Egg 2", MinAmount = 1},
["Daycare egg 5"] = {Class = "Egg", Id = "Huge Machine Egg 5", MinAmount = 1},
["Secret pet1"] = {Class = "Pet", Id = "Rainbow Swirl", MinAmount = 1, AllVariants = true},
["Secret pet2"] = {Class = "Pet", Id = "Banana", MinAmount = 1, AllVariants = true},
["Secret pet3"] = {Class = "Pet", Id = "Coin", MinAmount = 1, AllVariants = true},
["Secret pet4"] = {Class = "Pet", Id = "Yellow Lucky Block", MinAmount = 1, AllVariants = true},
["Brainrot egg"] = {Class = "Egg", Id = "Exclusive Egg 56", MinAmount = 1},
}
getgenv().GMAX_MAIL_COST = "2m" -- this can limit how many mails sent/day
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/ba2dcad2127dcfc04301dfe52ce6c61c.lua"))()
