getgenv().ConfigsKaitun = {
	Beta_Fix_Data_Sync = true,

	NoDeletePlayer = false,

	["Block Pet Gift"] = true,

	Collect_Cooldown = 60, -- cooldown to collect fruit

	["Low Cpu"] = true,
	["Auto Rejoin"] = true,

	["Rejoin When Update"] = false,
	["Limit Tree"] = {
		["Limit"] = 300,
		["Destroy Until"] = 250,

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
			"Mushrotrue",
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
                "Gorilla Chef",
                "Golden Goose",
                ["Spriggan"] = 4,
                "Lobster Thermidor",
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
		UrlPet = "https://discord.com/api/webhooks/1394039615949639822/ru1nhLaHQ0YheuaUN238iKf337NATfBXg224aTMSInFTWhNg24i7aPpFSIy6NAUAfr3r",
		UrlSeed = "xxx",
		PcName = "xxx",

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
