setfpscap(5)
repeat wait() until game:IsLoaded()
getgenv().Config =  {
    ["Webhook"] = {
        ["URL"] = "https://discord.com/api/webhooks/1394039615949639822/ru1nhLaHQ0YheuaUN238iKf337NATfBXg224aTMSInFTWhNg24i7aPpFSIy6NAUAfr3r",
        ["Discord Id to ping"] = {"993062998652493824"},
        ["Send Normal Huges"] = true,
    },
    ["Mail Settings"] = {
        ["User"] = "DreamSoCow",
        ["Min_Gems"] = 100000000,
        ["MAX_MAIL_COST"] = 2000000,
        ["Only_New_Huges"] = false,

        ["Mailing"] = {
            ["Exclusive Special Ops Egg"] = {Class = "Egg", MinAmount = 1},
            ["Exclusive Origami Egg"] = {Class = "Egg", MinAmount = 1},
            ["Mystical Kitsune"] = {Class = "Pet", MinAmount = 1},
            ["Wisp Owl"] = {Class = "Pet", MinAmount = 1},
            ["Gift Bag"] = {Class = "Misc", MinAmount = 99},
            ["Diamond Gift Bag"] = {Class = "Misc", MinAmount = 99},
            ["Large Gift Bag"] = {Class = "Misc", MinAmount = 99},
            ["Charm Stone"] = {Class = "Misc", MinAmount = 50},
            ["Rainbow Mini Chest"] = {Class = "Misc", MinAmount = 10},
            ["Mini Chest"] = {Class = "Misc", MinAmount = 50},
            ["Pinata"] = {Class = "Misc", MinAmount = 50},
            ["Exotic Treasure Flag"] = {Class = "Misc", MinAmount = 50},
            ["Diamond Plant Seed"] = {Class = "Misc", MinAmount = 99},
            ["Insta-Plant Capsule"] = {Class = "Misc", MinAmount = 99},
            ["MVP Key Lower Half"] = {Class = "Misc", MinAmount = 50},
            ["MVP Key Upper Half"] = {Class = "Misc", MinAmount = 50},
            ["MVP Key"] = {Class = "Misc", MinAmount = 50},
            ["Fantasy Key"] = {Class = "Misc", MinAmount = 50},
            ["Secret Key"] = {Class = "Misc", MinAmount = 50},
            ["Void Key"] = {Class = "Misc", MinAmount = 50},
            ["Tech Key"] = {Class = "Misc", MinAmount = 50},
            ["Time Trial Gift #2"] = {Class = "Misc", MinAmount = 10},
            ["Hype Egg #2"] = {Class = "Misc", MinAmount = 1},
            ["Exclusive Raffle Ticket"] = {Class = "Misc", MinAmount = 1},
            ["Basketball Gift"] = {Class = "Misc", MinAmount = 50},
            ["Candycane Gift"] = {Class = "Misc", MinAmount = 50},
            ["Snowflake Gift"] = {Class = "Misc", MinAmount = 50},
            ["Cosmic Basketball Gift"] = {Class = "Misc", MinAmount = 50},
            ["Santa Gift"] = {Class = "Misc", MinAmount = 50},
            ["Blossom Gift"] = {Class = "Misc", MinAmount = 50},
            ["Overload Charm"] = {Class = "Misc", MinAmount = 1},
        }
    },
    ["CPU Saver"] = true,
    ["AutoUseDice"] = {"Mega Lucky Dice V2"},
    ["SyncOnWeather"] = false,
    ["PetsToSell"] = {"Sand Turtle", "Sprout Stag", "Blossom Fox", "Honey Bee", "Chamelon", "Tiedye Elephant", "Surge Wolf", "Starry Eye Wolf", "Bubble Bunny", "Sapphire Dragon", "Wisp Owl", "Mystical Kitsune"},
}
loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/9f9b656e577ba1b9d87d4c855e7ac1a4.lua"))()
