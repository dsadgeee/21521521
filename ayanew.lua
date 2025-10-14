wait(2)
setfpscap(2)
getgenv().ConfigsKaitun = {
	Beta_Fix_Data_Sync = true,

	NoDeletePlayer = false,

	["Block Pet Gift"] = true,

	Collect_Cooldown = 90, -- cooldown to collect fruit

	["Low Cpu"] = true,
	["Auto Rejoin"] = true,

	["Rejoin When Update"] = false,

	["Auto Trade Pet"] = { -- beta idk it work or no
		["Enabled"] = false, 
		["Target"] =  { -- multi users
			"username1",
			"username2",
		},
		["Pet To Send"] = {
			
		}
	},

	Ascend = {
		Enabled = false,
		Max_Rebirth_Money = 1_000_000_000_000,
		Shop = {
			"Egg Capacity"
		}
	},

	["Limit Tree"] = {
		["Limit"] = 250,
		["Destroy Until"] = 400,

		["Safe Tree"] = {
			"Moon Blossom",
			"Bone Blossom",
			"Moon Melon",
			"Maple Apple",
			"Moon Mango",
			"Dragon Pepper",
			"Elephant Ears",
			"Fossilight",
			"Princess Thorn",
		}
	},

	Seed = {
		Buy = {
			Mode = "Auto", -- Custom , Auto
			Custom = { -- any seed u need to buy
				"Carrot",
			}
		},
		Place = {
			Mode = "Lock", -- Select , Lock
			Select = {
				"Carrot"
			},
			Lock = {
				"Maple Apple",
				"Sunflower",
				"Dragon Pepper",
				"Elephant Ears",
				"Moon Melon",
				"Easter Egg",
				"Moon Mango",
				"Bone Blossom",
				"Fossilight",
			}
		}
	},

	["Seed Pack"] = {
		Locked = {
			["Enchanted Seed Pack"] = 10,
		}
	},

	Events = {
		-- MaxMoney_Restocks = 10_000_000,
		
		Shop = { -- un comment to buy
		
		},
		["Traveling Shop"] = {
			"Bee Egg",
			"Paradise Egg", 
			"Rare Summer Egg", 
			"Common Summer Egg"
		},
		Craft = {
			"Enchanted Chest",
			"Enchanted Egg",
			"Enchanted Seed Pack",
			"Anti Bee Egg",
			"Pet Shard GiantBean",
			"Sprout Egg",
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
			"Level Up Lollipop",
			"Medium Treat",
			"Medium Toy",
			"Harvest Tool",
			"Watering Can"
		},
		Lock = {
			"Master Sprinkler",
			"Godly Sprinkler",
			"Advanced Sprinkler",
			"Basic Sprinkler",
			"Lightning Rod",
		},
	},

	Eggs = {
		Place = {
            "Spooky Egg",
			"Jungle Egg",
		},
		Buy = {
			"Spooky Egg",
			"Rare Egg",
			"Jungle Egg",
			"Bee Egg",
			"Oasis Egg",
			"Paradise Egg",
			"Anti Bee Egg",
			"Night Egg",
			"Rare Summer Egg",
			"Bug Egg",
			"Mythical Egg",
		}
	},

	Pets = {
		["Auto Feed"] = true,

		MutationPet = {
			["PET NAME"] = { "Glimmering","... any other" }
		},

		["Start Delete Pet At"] = 50,
		["Upgrade Slot"] = {
			["Pet"] = {
				["Starfish"] = { 1, 100, 7 , true }, -- the "true" on the last is auto equip (use for like only need to use for upgrade pet)
			},
			["Limit Upgrade"] = 3, -- max is 5 (more than or lower than 1 will do nothing)
			["Equip When Done"] = {
                ["Ghost Bear"] = { 3, 100, 1},
				["Rooster"] = { 5, 100, 1 },
				["Tarantula Hawk"] = { 1, 100, 2 },
				["Wasp"] = { 1, 100, 3 }, 
			},
		},
		Unfavorite_AllPet = false,
		Favorite_LockedPet = false,
		Locked_Pet_Age = 60, -- pet that age > 60 will lock
		Locked = {
			    ["Ghost Bear"] = 8,
			    "Headless Horseman",
			    "Reaper",
			    ["Black Cat"] = 5,
			    ["Spider"] = 5,
			    ["Bat"] = 5,
			    ["Idol Chipmunk"] = 4,
			    "Ostrich",
			    "Flamingo",
			    "Chinchilla",
			    "Mizuchi",
			    "Tiger",
			    "Red Panda",
			    "Barn Owl",
			    "Swan",
			    ["Space Squirrel"] = 3,
			    "Cockatrice",
			    "Drake",
			    "Wisp",
			    "Luminous Sprite",
			    "Wisp Well",
			    "Phoenix",
			    "Griffin",
			    ["Brown Mouse"] = 1,
			    ["Squirrel"] = 1,
			    ["Grey Mouse"] = 1,
			    ["Rooster"] = 5,
			    "Lemon Lion",
			    "Peach Wasp",
			    "Chicken Zombie",
			    ["Gorilla Chef"] = 8,
			    "Green Bean",
			    "Golden Goose",
			    ["Spriggan"] = 1,
			    "Lobster Thermidor",
			    ["Sunny-Side Chicken"] = 25,
			    "French Fry Ferret",
			    ["Kodama"] = 1,
			    "Corrupted Kitsune",
			    ["Starfish"] = 10,
			    "Capybara",
			    ["Seal"] = 8,
			    "Peacock",
			    "Kitsune",
			    "Blood Kiwi",
			    "Disco Bee",
			    "Raccoon",
			    "Queen Bee",
			    "Dragonfly",
			    "Butterfly",
			    "Mimic Octopus",
			    "Red Fox",
			    "Bee",
			    "Honey Bee",
			    "Bear Bee",
			    "Petal Bee",
			    ["Wasp"] = 5,
			    ["Tarantula Hawk"] = 5,
		},
		LockPet_Weight = 6, -- if Weight >= 10 they will locked
	},
    Webhook = {
		UrlPet = "https://discord.com/api/webhooks/1408866660017766500/8OgtYYAinAJ9qhpqLxr_jIzUztGg0YqnxzayJql_zAyaYqzoXxUH2OhEoo9DX09HpDOF",
		UrlSeed = "XXX",
		PcName = "1",

		Mention = "698853568291143821", -- discord id

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
			},
			Pet_Weight_Noti = true,
		}
	},
}
License = "4vWx20QgVjGB2bC68YTGTKTo4OyjKSaP"
loadstring(game:HttpGet('https://raw.githubusercontent.com/Real-Aya/Loader/main/Init.lua'))()
