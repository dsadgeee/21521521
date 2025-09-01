setfpscap(2)
getgenv().ConfigsKaitun = {
	Beta_Fix_Data_Sync = true,

	NoDeletePlayer = false,

	["Block Pet Gift"] = true,

	Collect_Cooldown = 90, -- cooldown to collect fruit

	["Low Cpu"] = true,
	["Auto Rejoin"] = false,

	["Rejoin When Update"] = false,

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
		["Limit"] = 200,
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
			-- for the event
			["Bamboo"] = 10,
			["Coconut"] = 5,
			["Mushroom"] = 5,
			["Glowthorn"] = 5,
			["Tomato"] = 5,
			["Pumpkin"] = 5,
			["Pepper"] = 5,
			["Cacao"] = 5,
			["Apple"] = 5,
			["Romanesco"] = 10,
			["Elder Strawberry"] = 10,
			["Burning Bud"] = 10,
			["Giant Pinecone"] = 5,
			["Corn"] = 5,
			["Sugar Apple"] = 5,
			["Ember Lily"] = 5,
			["Dragon Fruit"] = 5,
			["Sunbulb"] = 5,
			["Orange Tulip"] = 10,
			["Blueberry"] = 5,
			["Watermelon"] = 5,
			["Mango"] = 5,
			["Cactus"] = 5,
			["Strawberry"] = 5,
			["Beanstalk"] = 10,
			["Lightshoot"] = 5,
			["Grape"] = 5,
			["Daffodil"] = 5,
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
		["Fairy Event"] = {
			Minimum_Money = 10_000_000, -- minimum money to start play this event
			Rewards_Item = {
				"Enchanted Egg",
				"Fairy Targeter",
				"FairyPoints",
				--"Enchanted Seed Pack",
				--"Enchanted Crate",
			},
			Upgrade = {
				Mode = "Order", -- Order (mean will up on order), Chepest, Highest
				Order = { -- top upgrade first, not put mean not upgrade
					"Fairy Spawn Amount",
					"Loose Fairy Spawn Amount",
					"Glimmer Multiplier",
					"Fairy Event Duration",
				},
				Limit = {
					["Glimmer Multiplier"] = 10, -- max 10
					["Loose Fairy Spawn Amount"] = 4, -- max 4
					["Fairy Event Duration"] = 10, -- max 10
					["Fairy Spawn Amount"] = 9, -- max 9
				}
			}
		},
		MaxMoney_Restocks = 100_000_000_000,
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
			--"Pet Shard GiantBean",
		},
		["Traveling Shop"] = {
			"Bee Egg",
			"Paradise Egg",
			"Rare Summer Egg", 
			"Common Summer Egg",
		},
		Craft = {
			"Anti Bee Egg",
			"Skyroot Chest",
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
			"Enchanted Egg",
			"Sprout Egg",
			"Legendary Egg",
			"Gourmet Egg",
			"Zen Egg",
			"Anti Bee Egg",
			"Primal Egg",
			"Bug Egg",
			"Paradise Egg",
			"Mythical Egg",
			"Common Summer Egg",
			"Rare Summer Egg",
			"Rare Egg",
		},
		Buy = {
			"Bee Egg",
			"Enchanted Egg",
			"Oasis Egg",
			"Paradise Egg",
			"Anti Bee Egg",
			"Night Egg",
			"Rare Summer Egg",
			"Bug Egg",
			"Mythical Egg",
			"Legendary Egg",
			"Rare Egg",
		}
	},

	Pets = {
		["Auto Feed"] = true,

		["Start Delete Pet At"] = 40,
		["Upgrade Slot"] = {
			["Pet"] = {
				 ["Brown Mouse"] = { 2, 100, 1 },
				 ["Squirrel"] = { 1, 100, 2 },
				 ["Grey Mouse"] = { 2, 100, 3 },-- the "true" on the last is auto equip (use for like only need to use for upgrade pet)
			},
			["Limit Upgrade"] = 2, -- max is 5 (more than or lower than 1 will do nothing)
			["Equip When Done"] = {
				["Glimmering Sprite"] = { 3, 100, 1 },
				["Sunny-Side Chicken"] = { 5, 100, 2 },
				["Rooster"] = { 5, 100, 3 },
			},
		},
		Unfavorite_AllPet = false,
		Favorite_LockedPet = false,
		Locked_Pet_Age = 60, -- pet that age > 60 will lock
		Locked = {
			["Pixie"] = 2,
			["Imp"] = 2,
			"Griffin",
			"Glimmering Sprite",
			"Cockatrice",
			"Golem",
			"Gnome",
			"Green Bean", 
			"Apple Gazelle", 
			"Lemon Lion", 
			"Peach Wasp",
			"Golden Goose",
			["Spriggan"] = 5,
			["Gorilla Chef"] = 4,
			"Junkbot",
			"Hotdog Daschund",
			"Sunny-Side Chicken",
			"Lobster Thermidor",
			"French Fry Ferret",
			["Starfish"] = 3,
			"Raiju",
			"Corrupted Kodama",
			"Rooster",
			"Capybara",
			["Koi"] = 2,
			["Tanchozuru"] = 3,
			"Kitsune",
			"Corrupted Kitsune",
			"Kappa",
			"Dilophosaurus",
			"Spinosaurus",
			"Brontosaurus",
			"T-Rex",
			"Fennec Fox",
			"Blood Kiwi",
			["Peacock"] = 2,
			["Hamster"] = 2,
			"Disco Bee",
			"Raccoon",
			"Queen Bee",
			"Dragonfly",
			"Butterfly",
			"Mimic Octopus",
			"Red Fox",
			"Chicken Zombie"
		},
		LockPet_Weight = 5, -- if Weight >= 10 they will locked
	},

    Webhook = {
		UrlPet = "https://discord.com/api/webhooks/1408866663558025278/ohhAUmTACbJP2YbxoGH8iXRYJpT36w0HcHrffSsza8TA6iw62VUO1Sb2jCBavqeK1FeW",
		UrlSeed = "XXX",
		PcName = "1",

		Noti = {
			Seeds = {
			},
			SeedPack = {
				"Idk"
			},
			Pets = {
				"Golden Goose",
				"Cockatrice",
				"Griffin",
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
wait(3)
while true do
    for i = 1, 10 do
        local fairy = workspace:FindFirstChild(tostring(i))
        if fairy then
            local prompt = fairy:FindFirstChildWhichIsA('ProximityPrompt', true)
            if prompt then
                fireproximityprompt(prompt)
                print('Đã tương tác với Fairy:', fairy.Name)
            end
        end
    end
    wait(20) -- lặp lại sau 60 giây
end


