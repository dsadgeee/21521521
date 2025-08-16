wait(5)
getgenv().ConfigsKaitun = {
	Beta_Fix_Data_Sync = true,

	NoDeletePlayer = false,

	["Block Pet Gift"] = true,
 
	Collect_Cooldown = 60, -- cooldown to collect fruit
	JustFuckingCollectAll = false, -- Collect all (fruit not wait mutation)

	["Low Cpu"] = true,
	["Auto Rejoin"] = false,

	["Rejoin When Update"] = false,
	["Limit Tree"] = {
		["Limit"] = 200,
		["Destroy Untill"] = 150,

		["Safe Tree"] = {
			"Tranquil Bloom",
			"Maple Apple",
			"Moon Mango",
			"Bone Blossom",
			"Fossilight",
      		"Serenity",

		}
	},

	Seed = {
		Buy = {
			Mode = "Custom", -- Custom , Auto
			Custom = {
				"Tomato",
				"Strawberry",
				"Bell Pepper",
				"Blood Banana",
				"Onion",
				"Pear",
				"Grape",
				"Mushroom",
				"Pepper",
				"Cacao",
				"Beanstalk",
				"Ember Lily",
				"Sugar Apple",
				"Burning Bud",
				"Giant Pinecone",
				"Elder Strawberry",
			}
		},
		Place = {
			Mode = "Lock", -- Select , Lock
			Select = {
				"Carrot"
			},
			Lock = {
				"Sunflower",
				"Dragon Pepper",
				"Elephant Ears",
				"Moon Melon",
				"Moon Mango",
				"Fossilight",
			}
		}
	},

	["Seed Pack"] = {
		Locked = {

		}
	},

	Events = {
		["Bean Event"] = {
			Minimum_Money = 10_000_000, -- minimum money to start play this event
		},
		Shop = { -- delete -- to buy
			"Sprout Seed Pack",
			"Sprout Egg",
			--"Mandrake",
			"Silver Fertilizer",
			"Canary Melon",
			"Amberheart",
			"Spriggan",
		},
		["Traveling Shop"] = {
			"Bee Egg",
		},
		Craft = {
			"Anti Bee Egg",
		},
		Shop = {
			"Zen Egg",
			"Koi",
		},
		Start_Do_Honey = 2_000_000 -- start trade fruit for honey at money
	},

	Gear = {
		Buy = { 
			"Master Sprinkler",
			"Grandmaster Sprinkler",
			"Godly Sprinkler",
			"Advanced Sprinkler",
			"Basic Sprinkler",
			"Lightning Rod",
			"Levelup Lollipop",
			"Medium Treat",
			"Medium Toy",
			"Trading Ticket",
		},
		Lock = {
			"Master Sprinkler",
			"Grandmaster Sprinkler",
			"Godly Sprinkler",
			"Advanced Sprinkler",
			"Basic Sprinkler",
			"Lightning Rod",
			"Levelup Lollipop",
			"Trading Ticket",
		},
	},

	Eggs = {
		Place = {
			"Gourmet Egg",
			"Zen Egg",
			"Sprout Egg",
			"Primal Egg",
			"Dinosaur Egg",
			"Oasis Egg",
			"Anti Bee Egg",
			"Night Egg",
			"Bug Egg",
			"Paradise Egg",
			"Bee Egg",
			"Mythical Egg",
			"Rare Summer Egg",
			"Common Summer Egg",
			"Common Egg",
		},
		Buy = {
			"Bee Egg",
			"Oasis Egg",
			"Sprout Egg",
			"Paradise Egg",
			"Anti Bee Egg",
			"Night Egg",
			["Rare Summer Egg"] = 20,
			"Bug Egg",
			"Mythical Egg",
			"Common Summer Egg",
		}
	},

    Pets = {
        ["Start Delete Pet At"] = 45,
        ["Upgrade Slot"] = {
            ["Pet"] = {
                ["Starfish"] = { 2, 100, 1, true }, -- the "true" on the last is auto equip (use for like only need to use for upgrade pet)
            },
            ["Limit Upgrade"] = 5,-- max is 5 (more than or lower than 1 will do nothing)
            ["Equip When Done"] = {
				["Sunny-Side Chicken"] = { 1, 100, 1},
				["Hotdog Daschund"] = { 1, 100, 2 },
                ["Starfish"] = { 8, 76, 3 },
            },
        },
        Favorite_LockedPet = true,
        Locked_Pet_Age = 76, -- pet that age > 60 will lock
        Locked = {
			"Golden Goose",
			["Golem"] = 2,
			["Sushi Bear"] = 2,
			"Lobster Thermidor",
            ["Gorilla Chef"] = 5,
        	["Sunny-Side Chicken"] = 35,
            ["Hotdog Daschund"] = 1,
            ["Bacon Pig"] = 1,
            ["Junkbot"] = 4,
            "French Fry Ferret",
            ["Spaghetti Sloth"] = 1,
            ["Mochi Mouse"] = 2,
            ["Kodama"] = 1,
            "Corrupted Kitsune",
            ["Starfish"] = 8,
            ["Capybara"] = 1,
            ["Tanchozuru"] = 1,
            ["Seal"] = 1,
            "Kitsune",
            "Blood Kiwi",
            "Disco Bee",
            "Raccoon",
            "Queen Bee",
            "Dragonfly",
            "Butterfly",
            "Mimic Octopus",
            "Red Fox",
        },
        LockPet_Weight = 5, -- if Weight >= 10 they will locked
    },

    Webhook = {
		UrlPet = "https://discord.com/api/webhooks/1386629644140417145/rXZ-L2AWqC2p-dzbGULNBLoKmQiJ7tvUrPIhsFT5DcysdOvid77952-1jVKi4hOiq0qs",
		UrlSeed = "XXX",
		PcName = "LUCKY-AYAYA",

		Noti = {
			Seeds = {
			},
			SeedPack = {
				"Idk"
			},
			Pets = {
				"Golden Goose",
				"French Fry Ferret",
                "Lobster Thermidor",
				"Disco Bee",
		        "Corrupted Kitsune",
				"Butterfly",
				"Mimic Octopus",
				"Queen Bee",
				"Dragonfly",
				"Kitsune",
				"Raccoon",
				"Fennec Fox",
			},
			Pet_Weight_Noti = true,
		}
	},
}
License = "8xGBxxJlHuPLdS1c2sW50enf54WzHG6L"
loadstring(game:HttpGet('https://raw.githubusercontent.com/Real-Aya/Loader/main/Init.lua'))()





