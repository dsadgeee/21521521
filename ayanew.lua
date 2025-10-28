setfpscap(3)
local keys = {
    "gBgCmAPZTSmdqGHMSmmUdgFuEcELDZWK", 
    "qIVzNCBYuxaJkHOwVmcdnrwgFCgjzopH", 
    "ztMvmvBRojVRaBhAHDtmYBWxgLZXDYfv",
}
math.randomseed(os.time())
script_key = keys[math.random(#keys)]-- DO NOT remove this wait, it's against double counts.
-- INSERT YOUR CONFIG HERE --
getgenv().GGFX_MODE = 1 --1 = REMOVE_TEXTURES : more stable! but no visuals
getgenv().GRANK_FIRST = true
getgenv().GRANK_TO = 5
getgenv().GREBIRTH_TO = 4
getgenv().GZONE_TO = 99 -- to enter event from W1 put 1, from W2 put 100, from W3 200, from W4 240
getgenv().GHALLOWEEN_JOIN_LOCAL = true
getgenv().GDO_HALLOWEEN_WORLD = true
getgenv().GHALLOWEEN_WORLD_BUY_FROM_SPECIFIC_HOUSE = {1,2,3}
getgenv().GHALLOWEEN_WORLD_RECIPES_TO_DO = {1,2,3}
--getgenv().GKEEP_CURRENCY_FOR_CRAFTS = "20m"
getgenv().GALLOW_HOPPING = true
getgenv().GHOP_ON_STAFF = true
getgenv().GHALLOWEEN_WORLD_BUY_FROM_HOUSES_BELOW = false
getgenv().GHALLOWEEN_WORLD_HATCH_SPOTS = 0
getgenv().GHALLOWEEN_WORLD_ALLOW_WORSE_EGG_PLACEMENT = true
getgenv().GHALLOWEEN_WORLD_USE_BOOSTS = true
getgenv().GEVENT_UPGRADES = {
  "HalloweenCandyMultiplier",
  "HalloweenEggLuck",
  "HalloweenTrickOrTreatLuck",
  "HalloweenMoreDiamonds",
  "HalloweenMoreWitchHats",
  "HalloweenHugeLuck",
  "HalloweenTitanicLuck"
}
getgenv().GWEBHOOK_USERID = "698853568291143821"
getgenv().GWEBHOOK_LINK = "https://discord.com/api/webhooks/1283496015286112306/6GynCAV9qP7lv4kCSkAZ7RY37TbpqkZROFwoHmvVtIgq4QYLywx9oDyg1rEy-6fkkAKI"
getgenv().GHUGE_COUNT = 0
getgenv().GMAIL_RECEIVERS = {"DreamSoCow"}
getgenv().GMAX_MAIL_COST = "2m"
getgenv().GMAIL_ITEMS = {
  ["All Huges"] = {Class = "Pet", Id = "All Huges", MinAmount = 1},
  ["Send Diamonds"] = {Class = "Currency", Id = "Diamonds", KeepAmount = "1k", MinAmount = "10m"},
  ["Hype Egg 2"] = {Class = "Lootbox", Id = "Hype Egg 2", MinAmount = 1},
  ["Daycare egg 5"] = {Class = "Egg", Id = "Huge Machine Egg 5", MinAmount = 1},
  ["Secret pet1"] = {Class = "Pet", Id = "Rainbow Swirl", MinAmount = 1, AllVariants = true},
  ["Secret pet2"] = {Class = "Pet", Id = "Banana", MinAmount = 1, AllVariants = true},
  ["Secret pet3"] = {Class = "Pet", Id = "Coin", MinAmount = 1, AllVariants = true},
  ["Secret pet4"] = {Class = "Pet", Id = "Yellow Lucky Block", MinAmount = 1, AllVariants = true},
}
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/6e75890d2e36b4613270666c4f5ccab3.lua"))()
