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
				Max_Restocks_Price = 10_000_000_000,
				Minimum_Money = 10_000_000,
				Minimum_Chi = 30
			},
			["Doing"] = {
				Minimum_Money = 1000, -- minimum money to start play this event
				First_Upgrade_Tree = 1,
				Maximum_Chi = 50,
			}
		},
        ["Cook Event"] = {
            Minimum_Money = 10_000_000,          -- minimum money to start play this event
            Rewards_Item = {   -- The top is the most top mean prefered.
                "Gorilla Chef",
                "Gourmet Egg",
                "Culinarian Chest",
                "Gourmet Seed Pack",
                "Sunny-Side Chicken",
				"Cooking Cauldron",
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
        Start_Do_Honey = 2_000_000, -- start trade fruit for honey at money
    },

    Gear = {
        Buy = {
            "Master Sprinkler",
            "Grandmaster Sprinkler",
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
            "Grandmaster Sprinkler",
            "Godly Sprinkler",
            "Advanced Sprinkler",
            "Basic Sprinkler",
            "Lightning Rod",
        },
    },

    Eggs = {
        Place = {
            "Gourmet Egg",
            "Zen Egg",
            "Anti Bee Egg",
            "Primal Egg",
            "Bug Egg",
            "Paradise Egg",
            "Mythical Egg",
			"Common Egg",
            "Common Summer Egg",
            "Rare Summer Egg",
        },
        Buy = {
            "Mythical Egg",
            "Bug Egg",
            "Bee Egg",
            "Paradise Egg",
			"Common Egg",
            ["Common Summer Egg"] = 20,
            ["Rare Summer Egg"] = 20,
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
                ["Gorilla Chef"] = { 6, 100, 1 },
				["Sushi Bear"] = { 1, 100, 2 },
				["Sunny-Side Chicken"] = { 1, 100, 3 },
                ["Capybara"] = { 1, 100, 4 },
                ["Starfish"] = { 8, 100, 5 },
            },
        },
        Favorite_LockedPet = true,
        Locked_Pet_Age = 76, -- pet that age > 60 will lock
        Locked = {
			["Sushi Bear"] = 2,
			"Lobster Thermidor",
            ["Gorilla Chef"] = 5,
            ["Sunny-Side Chicken"] = 60,
            ["Hotdog Daschund"] = 2,
            ["Bacon Pig"] = 2,
            ["Junkbot"] = 4,
            "French Fry Ferret",
            ["Spaghetti Sloth"] = 2,
            ["Mochi Mouse"] = 2,
            ["Kodama"] = 1,
            "Corrupted Kitsune",
            ["Starfish"] = 10,
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
		PcName = "LUCKY-AYAYA",

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
License = "dY8f40dvdVToW40xyQj7gqt8faG4IoFO"
loadstring(game:HttpGet('https://raw.githubusercontent.com/Real-Aya/Loader/main/Init.lua'))()
