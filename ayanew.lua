getgenv().ConfigsKaitun = {
	Beta_Fix_Data_Sync = true,

	NoDeletePlayer = false,

	["Block Pet Gift"] = true,

	Collect_Cooldown = 120, -- cooldown to collect fruit

	["Low Cpu"] = true,
	["Auto Rejoin"] = true,

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
		["Limit"] = 250,
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
				"FairyPoints",
				"Enchanted Seed Pack",
				"Fairy Targeter",
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
		MaxMoney_Restocks = 50_000_000_000_000,
		Shop = { -- un comment to buy
			"Sprout Seed Pack",
			"Sprout Egg",
			-- "Mandrake",
			-- "Silver Fertilizer",
			-- "Canary Melon",
			-- "Amberheart",
			-- ["Spriggan"] = 8,
			-- Friend Shop
			"Sprout Egg",
			"Skyroot Chest",
			"Pet Shard GiantBean",
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
			"Gourmet Egg",
			"Enchanted Egg",
			"Sprout Egg",
			"Zen Egg",
			"Primal Egg",
			"Dinosaur Egg",
			"Oasis Egg",
			"Anti Bee Egg",
			"Night Egg",
			"Bug Egg",
			"Paradise Egg",
			"Rare Summer Egg",
			"Legendary Egg",
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
				["Starfish"] = { 5, 100, 1, true }, -- the "true" on the last is auto equip (use for like only need to use for upgrade pet)
			},
			["Limit Upgrade"] = 2, -- max is 5 (more than or lower than 1 will do nothing)
			["Equip When Done"] = {
				["Glimmering Sprite"] = { 5, 100, 1 },
                		["Sunny-Side Chicken"] = { 3, 100, 2 },
                		["Starfish"] = { 5, 100, 3 },
                		["Brown Mouse"] = { 3, 100, 4 },
                		["Grey Mouse"] = { 3, 100, 5 },
                		["Rooster"] = { 4, 100, 6 },
			},
		},
		Unfavorite_AllPet = false,
		Favorite_LockedPet = false,
		Locked_Pet_Age = 60, -- pet that age > 60 will lock
		Locked = {
			"Phoenix",
			"Shroomie"
			"Cardinal"
			"Cockatrice",
			["Glimmering Sprite"] = 3,
			["Imp"] = 15,
			"Griffin",
			["Spriggan"] = 1, 
			"Chicken Zombie",
			"Peach Wasp",
			"Lemon Lion",
			"Green Bean",
			"Golden Goose",
			["Golem"] = 2,
			["Rooster"] = 10,
			["Sapling"] = 5,
			"Lobster Thermidor",
			["Sunny-Side Chicken"] = 35,
			"French Fry Ferret",
			"Kodama",
			"Corrupted Kitsune",
			"Nihonzaru",
			["Starfish"] = 15,
			["Capybara"] = 1,
			["Seal"] = 3,
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
		LockPet_Weight = 6, -- if Weight >= 10 they will locked
	},

    Webhook = {
		UrlPet = "https://discord.com/api/webhooks/1408866660017766500/8OgtYYAinAJ9qhpqLxr_jIzUztGg0YqnxzayJql_zAyaYqzoXxUH2OhEoo9DX09HpDOF",
		UrlSeed = "XXX",
		PcName = "1",

		Mention = "698853568291143821", -- discord id

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
    wait(60) -- lặp lại sau 60 giây
end
