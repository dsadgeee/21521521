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
		["Limit"] = 400,
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
			Coconut = 4,
			Mushroom = 4,
			Glowthorn = 4,
			Tomato = 4,
			Pumpkin = 4,
			Pepper = 4,
			Cacao = 4,
			Apple = 4,
			Romanesco = 4,
			["Elder Strawberry"] = 4,
			["Burning Bud"] = 4,
			["Giant Pinecone"] = 4,
			Corn = 4,
			["Sugar Apple"] = 4,
			["Ember Lily"] = 4,
			["Dragon Fruit"] = 4,
			Sunbulb = 8,
			["Orange Tulip"] = 4,
			Blueberry = 4,
			Strawberry = 4,
			Watermelon = 4,
			Mango = 4,
			Cactus = 4,
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
				"Strawberry",
				"Fossilight",
			}
		}
	},

	["Seed Pack"] = {
		Locked = {
			"Enchanted Seed Pack",
		}
	},

	Events = {
		["Fairy Event"] = {
			Minimum_Money = 100_000_000_000, -- minimum money to start play this event
			Rewards_Item = { -- top mean select first
				"Pet Shard Glimmering",
				"Enchanted Egg",
				"Mutation Spray Glimmering",
				"FairyPoints",
				"Fairy Targeter",
				"Enchanted Seed Pack",
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
					["Glimmer Multiplier"] = 5, -- max 10
					["Loose Fairy Spawn Amount"] = 10, -- max 10
					["Fairy Event Duration"] = 10, -- max 10
					["Fairy Spawn Amount"] = 9, -- max 9
				}
			},

			Minimum_Fairy_Point_Restock = 10000, -- if fairy point more then this will restock
			Catch_Fairy_Before_Restock = 51, -- fr it 50 but to be sure i put 51
		},
		MaxMoney_Restocks = 10_000_000,
		Shop = { -- un comment to buy
			"Enchanted Chest",
			"Pet Shard Glimmering",
			"Enchanted Egg",
			"Enchanted Seed Pack",
			-- "Drake",

			"Sprout Seed Pack",
			"Sprout Egg",
			-- "Mandrake",
			"Silver Fertilizer",
			-- "Canary Melon",
			-- "Amberheart",
			["Spriggan"] = 8,
			-- Friend Shop
			"Skyroot Chest",
			"Pet Shard GiantBean",
		},
		["Traveling Shop"] = {
			"Bee Egg",
			"Paradise Egg", 
			"Rare Summer Egg", 
			"Common Summer Egg"
		},
		Craft = {
            "Fairy Summoner",
            "Fairy Power Extender",
			"Anti Bee Egg",
            "Fairy Caller",
            "Enchanted Chest",
            "Enchanted Egg",
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
		}
	},

	Pets = {
		["Auto Feed"] = true,

		MutationPet = {
			["PET NAME"] = { "Glimmering","... any other" }
		},

		["Start Delete Pet At"] = 40,
		["Upgrade Slot"] = {
			["Pet"] = {
				["Starfish"] = { 1, 100, 7 , true }, -- the "true" on the last is auto equip (use for like only need to use for upgrade pet)
			},
			["Limit Upgrade"] = 5, -- max is 5 (more than or lower than 1 will do nothing)
			["Equip When Done"] = {
				["Glimmering Sprite"] = { 8, 100, 1 },
				["Tarantula Hawk"] = { 1, 100, 2 },
				["Sunny-Side Chicken"] = { 4, 100, 3 }, -- 5 on the first mean equip only 5 | pet , 100 mean equip only level pet lower than 100 | the one on the last is priority it will ues first if possible 
				["Hotdog Daschund"] = { 4, 100, 4 },
				["Blood Kiwi"] = { 8, 100, 5 },
				["Rooster"] = { 8, 100, 6 },
				["Starfish"] = { 1, 100, 7 },
			},
		},
		Unfavorite_AllPet = false,
		Favorite_LockedPet = false,
		Locked_Pet_Age = 60, -- pet that age > 60 will lock
		Locked = {
			"Cockatrice",
			"Drake",
			"Wisp",
			"Luminous Sprite",
			"Wisp Well",
			"Phoenix",
			["Glimmering Sprite"] = 8,
			["Imp"] = 3,
			"Griffin",
			["Brown Mouse"] = 2,
			["Squirrel"] = 1,
			["Grey Mouse"] = 2,
			["Rooster"] = 10,
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
				"Phoenix",
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
-- 🌟 Auto Equip Tools (Enchanted Chest + Fairy Power Extender)
local Players = game:GetService('Players')
local localPlayer = Players.LocalPlayer

-- 🧰 Hàm trang bị Enchanted Chest
local function equipEnchantedChest()
    -- Nếu đã cầm trên tay rồi thì thôi
    for _, tool in ipairs(localPlayer.Character:GetChildren()) do
        if tool:IsA('Tool') and string.find(tool.Name, 'Fairy Summoner') then
            return tool
        end
    end

    -- Nếu còn trong Backpack thì auto equip
    for _, tool in ipairs(localPlayer.Backpack:GetChildren()) do
        if tool:IsA('Tool') and string.find(tool.Name, 'Fairy Summoner') then
            tool.Parent = localPlayer.Character
            print('📦 Đã auto cầm Enchanted Chest!')
            return tool
        end
    end
end

-- 🧰 Hàm trang bị Fairy Power Extender
local function equipFairyPowerExtender()
    -- Nếu đã cầm trên tay rồi thì thôi
    for _, tool in ipairs(localPlayer.Character:GetChildren()) do
        if
            tool:IsA('Tool') and string.find(tool.Name, 'Fairy Power Extender')
        then
            return tool
        end
    end

    -- Nếu còn trong Backpack thì auto equip
    for _, tool in ipairs(localPlayer.Backpack:GetChildren()) do
        if
            tool:IsA('Tool') and string.find(tool.Name, 'Fairy Power Extender')
        then
            tool.Parent = localPlayer.Character
            print('📦 Đã auto cầm Fairy Power Extender!')
            return tool
        end
    end
end

-- 🧚 Hàm gọi Fairy Summoner skill
local function fairySummoner()
    local args = {
        [1] = true,
        [2] = CFrame.new(-9.378669738769531, 0, -49.54979705810547)
            * CFrame.Angles(
                -1.340797781944275,
                1.1134178638458252,
                1.3155239820480347
            ),
    }

    local char = localPlayer.Character
    if
        char
        and char:FindFirstChild('InputGateway')
        and char.InputGateway:FindFirstChild('Activation')
    then
        char.InputGateway.Activation:FireServer(unpack(args))
        print('✨ Fairy Summoner skill đã được kích hoạt!')
    else
        warn('⚠️ Không tìm thấy Activation trong InputGateway')
    end
end

-- 🔄 Luôn giữ trên tay & dùng skill (mỗi 10s)
task.spawn(function()
    while task.wait(10) do
        equipEnchantedChest()
        fairySummoner()
    end
end)
wait(3)
-- 🔄 Luôn giữ trên tay & dùng skill (mỗi 10s)
task.spawn(function()
    while task.wait(10) do
        equipFairyPowerExtender()
        fairySummoner()
    end
end)
