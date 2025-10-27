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

local keys = {  -- Add as many key
    "gBgCmAPZTSmdqGHMSmmUdgFuEcELDZWK", 
    "qIVzNCBYuxaJkHOwVmcdnrwgFCgjzopH", 
    "ztMvmvBRojVRaBhAHDtmYBWxgLZXDYfv",
}

math.randomseed(os.time())
script_key = keys[math.random(#keys)];
task.wait(30) -- DO NOT remove this wait, it's against double counts.
getgenv().GGFX_MODE = 1 -- or put 1 later = REMOVE_TEXTURES : might be more stable, but no visuals
getgenv().GDO_HALLOWEEN_WORLD = true
--read the buyer-announcements to understand these:
getgenv().GHALLOWEEN_WORLD_BUY_FROM_SPECIFIC_HOUSE = { 1, 2, 3 , 4 } -- to buy from multiple houses at same time
getgenv().GHALLOWEEN_WORLD_HATCH_SPOTS = 2
getgenv().GHALLOWEEN_WORLD_ALLOW_WORSE_EGG_PLACEMENT = true
getgenv().GHALLOWEEN_WORLD_USE_BOOSTS = true
getgenv().GHOP_ON_STAFF = true --if true it moves you back to a new public world
getgenv().GRANK_FIRST = true --if you use this you have to specify values for GREBIRTH_TO and GRANK_TO
getgenv().GZONE_TO = 101  -- to enter event from W1 put 1, from W2 put 100, from W3 200, from W4 240
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
getgenv().GHUGE_COUNT = 0 -- amount of huges to keep/not mail
getgenv().GMAIL_RECEIVERS = {"DreamSoCow"} 
getgenv().GMAX_MAIL_COST = "2m" 
getgenv().GMAIL_ITEMS = {
["All Huges"] = {Class = "Pet", Id = "All Huges", MinAmount = 1},
["Send Diamonds"] = {Class = "Currency", Id = "Diamonds", KeepAmount = "5m", MinAmount = "1b"}, -- mail diamonds, to enable lower MinAmount..
["Hype Egg 2"] = {Class = "Lootbox", Id = "Hype Egg 2", MinAmount = 1},
["Daycare egg 5"] = {Class = "Egg", Id = "Huge Machine Egg 5", MinAmount = 1},
["Secret pet1"] = {Class = "Pet", Id = "Rainbow Swirl", MinAmount = 1, AllVariants = true},
["Secret pet2"] = {Class = "Pet", Id = "Banana", MinAmount = 1, AllVariants = true},
["Secret pet3"] = {Class = "Pet", Id = "Coin", MinAmount = 1, AllVariants = true},
["Secret pet4"] = {Class = "Pet", Id = "Yellow Lucky Block", MinAmount = 1, AllVariants = true},
}
-- ⚙️ CONFIG
_G.Config = {
    UserID = "0d28ea66-a410-47c0-a707-06d7cb199774",
    discord_id = "698853568291143821",
    Note = "Pc",
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/skadidau/unfazedfree/refs/heads/main/pet99"))()
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/6e75890d2e36b4613270666c4f5ccab3.lua"))()
