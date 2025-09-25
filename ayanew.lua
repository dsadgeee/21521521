
getgenv().ConfigsKaitun = {
	Beta_Fix_Data_Sync = true,

	NoDeletePlayer = false,

	["Block Pet Gift"] = true,

	Collect_Cooldown = 90, -- cooldown to collect fruit

	["Low Cpu"] = true,
	["Auto Rejoin"] = false,

	["Rejoin When Update"] = true,

	["Auto Trade Pet"] = { -- not done yet bro dont use
		["Enabled"] = false, 
		["Target"] =  { -- multi users
			"username1",
			"username2",
		},
		["Pet To Send"] = {
			
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
			-- for the event
			Bamboo = 4,
			Coconut = 15,
			Mushroom = 4,
			Glowthorn = 4,
			Tomato = 15,
			Pumpkin = 4,
			Pepper = 4,
			Cacao = 15,
			Apple = 15,
			Romanesco = 4,
			["Elder Strawberry"] = 4,
			["Burning Bud"] = 4,
			["Giant Pinecone"] = 4,
			Corn = 4,
			["Sugar Apple"] = 4,
			["Ember Lily"] = 4,
			["Dragon Fruit"] = 15,
			Sunbulb = 8,
			["Orange Tulip"] = 4,
			Blueberry = 15,
			Watermelon = 4,
			Mango = 15,
			Cactus = 4,
			Strawberry = 15,
			Beanstalk = 4,
			Lightshoot = 4,
			Grape = 4,
			Daffodil = 4,
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
			"Enchanted Seed Pack",
            "Fall Seed Pack",
		}
	},

	Events = {
		["Fall Event"] = {
			Minimum_Money = 10_000_000, -- minimum money to start play this event
		},
		MaxMoney_Restocks = 10_000_000,
		
		Shop = { -- un comment to buy
            "Golden Acorn",
			"Fall Egg",
			"Red Panda",
            "Firefly Jar",
            "Sky Lantern",
            "Maple Leaf Kite",
            "Leaf Blower",
            "Maple Leaf Charm",
            "Maple Sprinkler",
            "Bonfire",
            "Harvest Basket",
            "Fall Leaf Chair",
            "Maple Flag",
            "Flying Kite",
            "Maple Resin",
            "Fall Fountain",
            "Enchanted Chest",
            "Enchanted Egg",
            "Luminous Sprite",
            "Wisp",
		},
		["Traveling Shop"] = {
			"Bee Egg",
			"Paradise Egg", 
			"Rare Summer Egg", 
			"Common Summer Egg"
		},
		Craft = {
			"Enchanted Chest",
			"Fairy Net",
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
		},
		Lock = {
            "Golden Acorn",
            "Firefly Jar",
            "Sky Lantern",
            "Maple Leaf Kite",
            "Leaf Blower",
            "Maple Leaf Charm",
            "Maple Sprinkler",
            "Bonfire",
            "Harvest Basket",
            "Fall Leaf Chair",
            "Maple Flag",
            "Flying Kite",
            "Maple Resin",
            "Fall Fountain",
            "Cleansing Pet Shard",
            "Grandmaster Sprinkler",
            "Master Sprinkler",
            "Godly Sprinkler",
            "Lightning Rod",
            "Harvest Tool",
            "Level Up Lollipop",
            "Medium Treat",
            "Medium Toy",
		},
	},

	Eggs = {
		Place = {
			"Anti Bee Egg",
			"Rare Egg",
			"Bug Egg",
			"Enchanted Egg",
			"Mythical Egg",
		},
		Buy = {
			"Bee Egg",
			"Rare Egg",
			"Oasis Egg",
			"Paradise Egg",
			"Anti Bee Egg",
			"Night Egg",
			"Rare Summer Egg",
			"Bug Egg",
			"Mythical Egg",
			"Uncommon Egg",
			"Common Egg",
		}
	},

	Pets = {
		["Auto Feed"] = true,

		MutationPet = {
			["PET NAME"] = { "Glimmering","... any other" }
		},

		["Start Delete Pet At"] = 60,
		["Upgrade Slot"] = {
			["Pet"] = {
			},
			["Limit Upgrade"] = 5, -- max is 5 (more than or lower than 1 will do nothing)
			["Equip When Done"] = {
				["Tarantula Hawk"] = { 1, 100, 1 },
				["Wasp"] = { 1, 100, 1 }, 
				["Rooster"] = { 7, 100, 2 },
			},
		},
		Unfavorite_AllPet = false,
		Favorite_LockedPet = false,
		Locked_Pet_Age = 60, -- pet that age > 60 will lock
		Locked = {
			"Swan",
			"Red Panda",
			"Space Squirrel",
			"Barn Owl",
			"Phoenix",
			"Cockatrice",
			"Griffin",
			"Golden Goose",
			"Golem",
			"French Fry Ferret",
			"Spaghetti Sloth",
			"Corrupted Kitsune",
			"Raiju",
			"Koi",
			"Tanuki",
			"Tanchozuru",
			"Kappa",
			"Kitsune",
			"Dilophosaurus",
			"Moon Cat",
			"Capybara",
			"Spinosaurus",
			"Bear Bee",
			"T-Rex",
			"Brontosaurus",
			"Disco Bee",
			"Butterfly",
			"Queen Bee",
			"Dragonfly",
			"Raccoon",
			"Fennec Fox",
			"Mimic Octopus",
			"Red Fox",
			"Blood Owl",
			["Starfish"] = 10,
			"Swan",
			["Space Squirrel"] = 3,
			"Cockatrice",
			"Drake",
			"Wisp",
			"Luminous Sprite",
			"Wisp Well",
			"Phoenix",
			["Glimmering Sprite"] = 8,
			"Griffin",
			["Brown Mouse"] = 2,
			["Squirrel"] = 1,
			["Grey Mouse"] = 2,
			["Rooster"] = 4,
			"Lemon Lion",
			"Peach Wasp",
			"Chicken Zombie",
			["Gorilla Chef"] = 8,
			"Green Bean",
			"Golden Goose",
			["Spriggan"] = 1, 
			"Lobster Thermidor",
			["Sunny-Side Chicken"] = 35,
			"French Fry Ferret",
			["Kodama"] = 1,
			"Corrupted Kitsune",
			["Starfish"] = 10,
			["Capybara"] = 1,
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
			"Bee",
			"Honey Bee",
			"Bear Bee",
			"Petal Bee",
			"Wasp",
			"Tarantula Hawk",
		},
		LockPet_Weight = 5, -- if Weight >= 10 they will locked
		Ignore_Pet_Weight = {
			"Cardinal",
		},
		Instant_Sell = {
			"Cardinal",
			"Ladybug",
			"Pixie",
			"Imp",
			"Shroomie",
			"Badger",
			"Robin",
			"Grizzly Bear",
		}
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
