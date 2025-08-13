wait(5)
setfpscap(2)
getgenv().ConfigsKaitun = {
    Beta_Fix_Data_Sync = true,

    NoDeletePlayer = false,

    ["Block Pet Gift"] = true,

    Collect_Cooldown = 60, -- cooldown to collect fruit

    ["Low Cpu"] = true,
    ["Auto Rejoin"] = false,

    ["Rejoin When Update"] = false,
    ["Limit Tree"] = {
        ["Limit"] = 250,
        ["Destroy Untill"] = 230,

        ["Safe Tree"] = {
            "Moon Blossom",
            "Fossilight",

        }
    },

    Seed = {
        Buy = {
            Mode = "Auto", -- Custom , Auto
            Custom = {
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
                "Easter Egg",
                "Bone Blossom",
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
		["Zen Event"] = {
			["Restocking"] = { -- Minimumthing to restock
				Max_Restocks_Price = 10000000000,
				Minimum_Money = 10000000,
				Minimum_Chi = 30
			},
			["Doing"] = {
				Minimum_Money = 1000, -- minimum money to start play this event
				First_Upgrade_Tree = 1,
				Maximum_Chi = 50,
			}
		},
        ["Cook Event"] = {
            Minimum_Money = 10000000,          -- minimum money to start play this event
            Rewards_Item = {   -- The top is the most top mean prefered.
                "Culinarian Chest",
                "Gourmet Egg",
                "Gourmet Seed Pack",
                "Sunny-Side Chicken",
				"Cooking Cauldron",
				"Gorilla Chef",
                -- u can add it more as u want, if it not in list.
            }
        },
        ["Traveling Shop"] = {
            "Bee Egg",
        },
        Craft = {
            "Ancient Seed Pack",
            "Anti Bee Egg",
            "Primal Egg",
        },
        Shop = {
            "Zen Egg",
            "Zen Seed Pack",
            "Spiked Mango",
            "Pet Shard Tranquil",
            "Pet Shard Corrupted",
            "Koi",
            "Soft Sunshine",
            "Sakura Bush",
            "Raiju",
        },
        Start_Do_Honey = 2000000, -- start trade fruit for honey at money
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
			"Paradise Egg",
			"Anti Bee Egg",
			"Night Egg",
			["Rare Summer Egg"] = 20,
			"Bug Egg",
			"Mythical Egg",
			["Common Summer Egg"] = 20,
			["Common Egg"] = 40,
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
                ["Gorilla Chef"] = { 4, 100, 1 },
				["Sushi Bear"] = { 1, 100, 2 },
				["Sunny-Side Chicken"] = { 3, 100, 3 },
                ["Capybara"] = { 1, 100, 4 },
                ["Starfish"] = { 8, 100, 5 },
            },
        },
        Favorite_LockedPet = true,
        Locked_Pet_Age = 76, -- pet that age > 60 will lock
        Locked = {
			["Sushi Bear"] = 2,
			"Lobster Thermidor",
            ["Gorilla Chef"] = 10,
        	"Sunny-Side Chicken",
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
		UrlPet = "https://discord.com/api/webhooks/1401748636291039303/mrWcwfJUa15zymUYhAXo51iPJmSxJqjruvotDtv3NDoRzmHv65cIt86yUCIiLBUEdFMH",
		UrlSeed = "XXX",
		PcName = "Dream",

		Noti = {
			Seeds = {
			},
			SeedPack = {
				"Idk"
			},
			Pets = {
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
