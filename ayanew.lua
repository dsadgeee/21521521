setfpscap(5)
repeat wait() until game:IsLoaded()
getgenv().Config =  {
    ["Webhook"] = {
        ["URL"] = "https://discord.com/api/webhooks/1394039615949639822/ru1nhLaHQ0YheuaUN238iKf337NATfBXg224aTMSInFTWhNg24i7aPpFSIy6NAUAfr3r",
        ["Discord Id to ping"] = {"993062998652493824"},
        ["Send Normal Huges"] = true,

        ["Rank Updates"] = "https://discord.com/api/webhooks/1394039615949639822/ru1nhLaHQ0YheuaUN238iKf337NATfBXg224aTMSInFTWhNg24i7aPpFSIy6NAUAfr3r",
        ["Rank Update Min"] = 20 -- will send rank update when reaches that ranl
    },
    ["Mail Settings"] = {
        ["User"] = "DreamSoCow",
        ["Min_Gems"] = 100000000,
        ["MAX_MAIL_COST"] = 2000000,
        ["Only_New_Huges"] = false,

        ["Mailing"] = {
            ["Exclusive Special Ops Egg"] = {Class = "Egg", MinAmount = 1},
            ["Exclusive Origami Egg"] = {Class = "Egg", MinAmount = 1},
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
    ["Auto Enchant"] = {"Treasure Hunter", "Coins", "Diamonds", "Criticals", "Strong Pets"},
    ["Time Trial"] = {
        ["Disabled"] = false, -- will disable Timetrial
        ["Open Chest"] = 3, -- 1,2,3 or do false to not open
    },

    ["CPU Saver"] = true, -- makes your game run smoother

    ["MaxEggSlots"] = 99,
    ["MaxPetSlots"] = 99,

    ["Ignore Do Ranks"] = false, -- wont do quest at all

    ["Fast Rankup"] = false, -- will focus on quest in world 1 until it reaches a specific rank (broken a bit)
    ["Fast Rankup to"] = 20, -- choose your rank you want to do
    ["UltraMastery"] = {"Economy", "Eggs", "Potions", "Enchants", "Fruits"},

    ["StarterPets"] = true, -- will hatch event pets
    ["ClaimFreeStuff"] = false, -- disables claiming stuff loop (may fix stuck on upgrading stuff)
    ["AutoCombinePresents"] = true, -- combines Prestes to the desired level
    ["MaxCombineTier"] = 4, -- 1 = max Medium, 2 = max Large, 3 = max X-Large, 4 = max Titanic (default, craft everything)
    ["OpenPresent"] = 5, -- 1 = small, 2 = Medium, 3 = Large, 4 = X-Large, 5 = Titanic, false = disabled

    ["AutoConsumeFlag"] = {"Strength Flag","Hasty Flag"},
    ["AutoSprinkler"] = true,
}
loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/cd6279ef22ef689bec5cd78c7cd2f0a1.lua"))()
