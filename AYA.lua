--loadstring(game:HttpGet("https://raw.githubusercontent.com/dsadgeee/21521521/refs/heads/main/AYA.lua"))()
getgenv().ConfigsKaitun = {
	Beta_Fix_Data_Sync = true,

	NoDeletePlayer = false,

	["Block Pet Gift"] = true,

	Collect_Cooldown = 60, -- cooldown to collect fruit

	["Low Cpu"] = true,
	["Auto Rejoin"] = true,

	["Rejoin When Update"] = false,
	["Limit Tree"] = {
		["Limit"] = 250,
		["Destroy Until"] = 225,
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
			-- for the event
            ["Blueberry"] = 15,
            ["Strawberry"] = 15,
            ["Apple"] = 15,
            ["Coconut"] = 15,
            ["Dragon Fruit"] = 15,
            ["Mango"] = 15,
            ["Tomato"] = 20,
            ["Cactus"] = 15,
            ["Beanstalk"] = 20,
		}
	},

	Seed = {
		Buy = {
			Mode = "Auto", -- Custom , Auto
			Custom = { -- any fruit u need to place
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
		}
	},

	Events = {
		["Bean Event"] = {
			Minimum_Money = 10_000_000, -- minimum money to start play this event
		},
		MaxMoney_Restocks = 500_000_000_000,
		Shop = { -- un comment to buy
			"Sprout Seed Pack",
			"Sprout Egg",
			-- "Mandrake",
			-- "Silver Fertilizer",
			-- "Canary Melon",
			-- "Amberheart",
			-- ["Spriggan"] = 8,
			-- Friend Shop
			"Skyroot Chest",
			"Pet Shard GiantBean",
			"Gnome",
		},
		["Traveling Shop"] = {
			"Bee Egg",
			"Paradise Egg",
		},
		Craft = {
			"Anti Bee Egg",
			"Skyroot Chest",
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
			"Gourmet Egg",
			"Sprout Egg",
			"Zen Egg",
			"Primal Egg",
			"Dinosaur Egg",
			"Oasis Egg",
			"Anti Bee Egg",
			"Night Egg",
			"Bug Egg",
			"Paradise Egg",
			"Bee Egg",
			"Rare Summer Egg",
			"Mythical Egg",
			"Legendary Egg",
			"Rare Egg",
		},
		Buy = {
			"Bee Egg",
			"Oasis Egg",
			"Paradise Egg",
			"Anti Bee Egg",
			"Night Egg",
			"Rare Summer Egg",
			"Bug Egg",
			"Mythical Egg",
			"Uncommon Egg",
			"Common Egg",
			"Legendary Egg",
			"Rare Egg",
		}
	},

	Pets = {
		["Auto Feed"] = true,

		["Start Delete Pet At"] = 45,
		["Upgrade Slot"] = {
			["Pet"] = {
				["Starfish"] = { 5, 100, 1, true }, -- the "true" on the last is auto equip (use for like only need to use for upgrade pet)
			},
			["Limit Upgrade"] = 2, -- max is 5 (more than or lower than 1 will do nothing)
			["Equip When Done"] = {
				["Capybara"] = { 1, 100 },
				["Rooster"] = { 5, 100 },
				["Sunny-Side Chicken"] = { 5, 100 },
                ["Starfish"] = { 2, 100 },
			},
		},
		Unfavorite_AllPet = false,
		Favorite_LockedPet = true,
		Locked_Pet_Age = 60, -- pet that age > 60 will lock
		Locked = {
			    ["Rooster"] = 16,
                ["Chicken"] = 5,
                ["Mandrake"] = 2,
                "Griffin",
                "Chicken Zombie",
                "Peach Wasp",
                "Lemon Lion",
                "Apple Gazelle",
                "Green Bean",
                ["Golem"] = 1,
                "Golden Goose",
                ["Spriggan"] = 4,
                "Lobster Thermidor",
                ["Gorilla Chef"] = 1,
                ["Sunny-Side Chicken"] = 35,
                ["Hotdog Daschund"] = 1,
                ["Bacon Pig"] = 1,
                ["Junkbot"] = 3,
                "French Fry Ferret",
                ["Spaghetti Sloth"] = 1,
                ["Mochi Mouse"] = 1,
                ["Kodama"] = 1,
                "Corrupted Kitsune",
                ["Starfish"] = 8,
                ["Capybara"] = 1,
                ["Tanchozuru"] = 1,
                ["Seal"] = 1,
                "Dilophosaurus",
                "Brontosaurus",
                "Ankylosaurus",
                "Spinosaurus",
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
		UrlPet = "https://discord.com/api/webhooks/1408866660017766500/8OgtYYAinAJ9qhpqLxr_jIzUztGg0YqnxzayJql_zAyaYqzoXxUH2OhEoo9DX09HpDOF",
		UrlSeed = "xxx",
		PcName = "2",

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
				"Golden Goose",
				"Griffin",
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
License = "hLv5vGDrHC1cR2eyIaPkonhV0CmU0L12"
loadstring(game:HttpGet('https://raw.githubusercontent.com/Real-Aya/Loader/main/Init.lua'))()
