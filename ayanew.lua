setfpscap(3)
repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players
repeat task.wait() until game.Players.LocalPlayer
UserSettings():GetService("UserGameSettings").MasterVolume = 0
UserSettings():GetService("UserGameSettings").SavedQualityLevel = 1
workspace.LevelOfDetail = Enum.ModelLevelOfDetail.Disabled
game:GetService("Lighting").GlobalShadows = false
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Level04
settings().Rendering.GraphicsMode = 9

local keys = {
    "gBgCmAPZTSmdqGHMSmmUdgFuEcELDZWK", 
    "qIVzNCBYuxaJkHOwVmcdnrwgFCgjzopH", 
    "ztMvmvBRojVRaBhAHDtmYBWxgLZXDYfv",
}
math.randomseed(os.time())
script_key = keys[math.random(#keys)];
-- INSERT YOUR CONFIG HERE --
task.wait(10) -- DO NOT remove this wait, it's against double counts.
getgenv().GGFX_MODE = 1 --1 = REMOVE_TEXTURES : more stable! but no visuals
getgenv().GRANK_FIRST = true
getgenv().GRANK_TO = 5
getgenv().GREBIRTH_TO = 4
getgenv().GZONE_TO = 99 -- to enter event from W1 put 1, from W2 put 100, from W3 200, from W4 240
getgenv().GHALLOWEEN_JOIN_LOCAL = true
getgenv().GDO_HALLOWEEN_WORLD = true
getgenv().GHALLOWEEN_WORLD_BUY_FROM_SPECIFIC_HOUSE = {1,2,3,4,5}
getgenv().GHALLOWEEN_WORLD_RECIPES_TO_DO = {1,2,3,4,5}
--getgenv().GKEEP_CURRENCY_FOR_CRAFTS = "20m"
getgenv().GALLOW_HOPPING = true
getgenv().GHOP_ON_STAFF = true
getgenv().GHALLOWEEN_WORLD_BUY_FROM_HOUSES_BELOW = false
getgenv().GHALLOWEEN_WORLD_HATCH_SPOTS = 0
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
getgenv().GWEBHOOK_LINK = "https://discord.com/api/webhooks/1283496015286112306/6GynCAV9qP7lv4kCSkAZ7RY37TbpqkZROFwoHmvVtIgq4QYLywx9oDyg1rEy-6fkkAKI"
getgenv().GMAIL_RECEIVERS = {"DreamSoCow"} -- for Huges and mailrules.
getgenv().GMAIL_ITEMS = {
["All Huges"] = {Class = "Pet", Id = "All Huges", MinAmount = 1},
["Send Diamonds"] = {Class = "Currency", Id = "Diamonds", KeepAmount = "2m", MinAmount = "30m"}, -- mail diamonds, to enable lower MinAmount..
["All Egg"] = {Class = "Lootbox", Id = "All Egg", MinAmount = 1},
}
getgenv().GMAX_MAIL_COST = "2m" -- this can limit how many mails sent/day
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/6e75890d2e36b4613270666c4f5ccab3.lua"))()
