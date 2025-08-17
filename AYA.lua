wait(5)
getgenv().ConfigsKaitun = {
	Beta_Fix_Data_Sync = true,

	NoDeletePlayer = false,

	["Block Pet Gift"] = true,
 
	Collect_Cooldown = 30, -- cooldown to collect fruit
	JustFuckingCollectAll = false, -- Collect all (fruit not wait mutation)

	["Low Cpu"] = true,
	["Auto Rejoin"] = false,

	["Rejoin When Update"] = false,
	["Limit Tree"] = {
		["Limit"] = 250,
		["Destroy Untill"] = 225,

		["Safe Tree"] = {
			"Tranquil Bloom",
			"Bone Blossom",
			"Fossilight",
			"Sunflower",
			"Dragon Pepper",
			"Elephant Ears",
			"Moon Melon",
			"Moon Mango",
			"Fossilight",
			"Pineapple",
			"Spike Mango",
			"Starfruit",
			"Horned Dinoshroom",
			"Celestiberry",
			"Mango",
			"Watermelon",
			"Grape",
			"Mapple Apple",
			"Moon Blossom",
			"Sugar Apple",
			"Beanstalk",
			"Cacao",
			"Apple",
			"Conocut",
			"Dragon Fruit",
			"Grand Tomato",
			"Pricklefruit",
			"Mandrake",
			"Mangosteen",
			"Princess Thorn",
			"Ember Lily",
			"Burning Bud",
			"Pepper",
			"Mushroom",
			"Strawberry",
			"Blueberry",
			"Tomato",

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
				"Pineapple",
				"Spike Mango",
				"Starfruit",
				"Horned Dinoshroom",
				"Celestiberry",
				"Mango",
				"Watermelon",
				"Grape",
				"Mapple Apple",
				"Moon Blossom",
				"Sugar Apple",
				"Beanstalk",
				"Cacao",
				"Apple",
				"Conocut",
				"Dragon Fruit",
				"Grand Tomato",
				"Pricklefruit",
				"Mandrake",
				"Mangosteen",
				"Princess Thorn",
				"Ember Lily",
				"Burning Bud",
				"Mushroom",
				"Pepper",
				"Strawberry",
				"Blueberry",
				"Tomato",

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
		MaxMoney_Restocks = 100_000_000_000,
		Shop = { -- delete -- to buy
			"Sprout Seed Pack",
			"Sprout Egg",
			-- "Mandrake",
			"Silver Fertilizer",
			-- "Canary Melon",
			-- "Amberheart",
			-- "Spriggan",
		},
		["Traveling Shop"] = {
			"Bee Egg",
		},
		Craft = {
			"Anti Bee Egg",
		},
		Shop = {
			"Zen Egg",
		},
		Start_Do_Honey = 2_000_000 -- start trade fruit for honey at money
	},

	Gear = {
		Buy = { 
			"Master Sprinkler",
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
			"Godly Sprinkler",
			"Lightning Rod",
			"Levelup Lollipop",
			"Trading Ticket",
		},
	},

	Eggs = {
		Place = {
			"Sprout Egg",
			"Gourmet Egg",
			"Zen Egg",
			"Primal Egg",
			"Dinosaur Egg",
			"Oasis Egg",
			"Anti Bee Egg",
			"Night Egg",
			"Bug Egg",
			"Paradise Egg",
			"Bee Egg",
			"Mythical Egg",
			"Common Summer Egg",
		},
		Buy = {
			"Sprout Egg",
			"Gourmet Egg",
			"Bee Egg",
			"Oasis Egg",
			"Paradise Egg",
			"Anti Bee Egg",
			"Night Egg",
			"Bug Egg",
			"Mythical Egg",
			"Common Summer Egg",
		}
	},

	Pets = {
		["Start Delete Pet At"] = 45,
        ["Upgrade Slot"] = {
            ["Pet"] = {
                ["Starfish"] = { 4, 100, 1, true }, -- the "true" on the last is auto equip (use for like only need to use for upgrade pet)
            },
            ["Limit Upgrade"] = 5,-- max is 5 (more than or lower than 1 will do nothing)
            ["Equip When Done"] = {
                ["Sunny-Side Chicken"] = { 5, 100, 1},
                ["Starfish"] = { 3, 100, 2 },
            },
        },
		Unfavorite_AllPet = false,
		Favorite_LockedPet = true,
		 Locked_Pet_Age = 76, -- pet that age > 60 will lock
        Locked = {
			["Sushi Bear"] = 5,
			"Golden Goose",
			["Golem"] = 5,
			["Sapling"] = 5,
			["Jackalope"] = 5,
			"Lobster Thermidor",
            ["Gorilla Chef"] = 8,
        	["Sunny-Side Chicken"] = 35,
            ["Junkbot"] = 4,
            "French Fry Ferret",
            ["Spaghetti Sloth"] = 1,
            "Kodama",
            "Spriggan",
            "Corrupted Kitsune",
            "Nihonzaru",
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
		UrlPet = "https://discord.com/api/webhooks/1288486290794217565/GtYWtRVhHU_Eq6XXyF0szbG3Ox3YRjUx2u6q4Ow9gvv083CwWUMT6zOY7SUbStQorr0v",
		UrlSeed = "",
		PcName = "PVT",

		Mention = "", -- discord id

		Noti = {
			Seeds = {
				"Sunflower",
				"Dragon Pepper",
				"Elephant Ears",
			},
			SeedPack = {
				"Idk"
			},
			Pets = {
				"Lobster Thermidor",
				"Golden Goose",
				"French Fry Ferret",
				"Corrupted Kitsune",
				"Kitsune",
				"Spinosaurus",
				"T-Rex",
				"Disco Bee",
				"Butterfly",
				"Mimic Octopus",
				"Queen Bee",
				"Fennec Fox",
				"Dragonfly",
				"Raccoon",
				"Red Fox",
			},
			Pet_Weight_Noti = true,
		}
	},
}
License = "8xGBxxJlHuPLdS1c2sW50enf54WzHG6L"
loadstring(game:HttpGet('https://raw.githubusercontent.com/Real-Aya/Loader/main/Init.lua'))()
