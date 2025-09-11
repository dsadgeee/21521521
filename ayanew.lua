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
			["Wispwing"] = 10,
			["Romanesco"] = 10,
			["Elder Strawberry"] = 10,
			["Burning Bud"] = 10,
			["Giant Pinecone"] = 5,
			["Corn"] = 5,
			["Sugar Apple"] = 5,
			["Ember Lily"] = 5,
			["Dragon Fruit"] = 5,
			["Sunbulb"] = 10,
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
			["Aurora Vine"] = 10,
			["Aetherfruit"] = 10,
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
				"Strawberry",
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
			Minimum_Money = 100_000, -- minimum money to start play this event
			Rewards_Item = { -- top mean select first
				"Enchanted Egg",
				"Enchanted Seed Pack",
				"FairyPoints",
				"Pet Shard Glimmering",
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
					["Glimmer Multiplier"] = 8, -- max 10
					["Loose Fairy Spawn Amount"] = 8, -- max 10
					["Fairy Event Duration"] = 8, -- max 10
					["Fairy Spawn Amount"] = 8, -- max 9
				}
			},
		Minimum_Fairy_Point_Restock = 5000, -- if fairy point more then this will restock
        Catch_Fairy_Before_Restock = 51, -- fr it 50 but to be sure i put 51
		},
		MaxMoney_Restocks = 1_000_000_000_000,
		Shop = { -- un comment to buy
			"Enchanted Chest",
			"Enchanted Egg",
			"Enchanted Seed Pack",
			"Sprout Seed Pack",
			"Sprout Egg",
			-- "Mandrake",
			-- "Silver Fertilizer",
			-- "Canary Melon",
			-- "Amberheart",
			-- ["Spriggan"] = 8,
			-- Friend Shop
			"Skyroot Chest",
		},
		Craft = {
			"Enchanted Chest",
			"Enchanted Egg",
			"Fairy Summoner",
            "Fairy Power Extender",
            "Fairy Caller",
			"Anti Bee Egg",
			"Sprout Egg",
		},
		["Traveling Shop"] = {
			"Bee Egg",
			"Paradise Egg",
			"Rare Summer Egg", 
			"Common Summer Egg",
			"Pitcher Plant",
			"Feijoa",
			"Loquat",
		},
		Start_Do_Honey = 2_000_000 -- start trade fruit for honey at money
	},

	Gear = {
		Buy = { 
			"Master Sprinkler",
			"Godly Sprinkler",
			"Grandmaster Sprinkler",
			"Advanced Sprinkler",
			"Basic Sprinkler",
			"Lightning Rod",
			"Level Up Lollipop",
			"Medium Treat",
			"Medium Toy",
		},
		Lock = {
			"Grandmaster Sprinkler",
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
		MutationPet = {
			["Rooster"] = { "Glimmering" },
			["Sunny-Side Chicken"] = { "Glimmering" },
			["Glimmering Sprite"] = { "Glimmering" },
			["Brown Mouse"] = { "Glimmering" },
			["Grey Mouse"] = { "Glimmering" },
			["Squirrel"] = { "Glimmering" },
		},
		["Start Delete Pet At"] = 40,
		["Upgrade Slot"] = {
			["Pet"] = {
                ["Brown Mouse"] = { 3, 100, 4, true },
                ["Grey Mouse"] = { 3, 100, 5, true },
				["Starfish"] = { 5, 100, 1, true }, -- the "true" on the last is auto equip (use for like only need to use for upgrade pet)
			},
			["Limit Upgrade"] = 5, -- max is 5 (more than or lower than 1 will do nothing)
			["Equip When Done"] = {
				["Bee"] = { 5, 100, 1 },
				["Honey Bee"] = { 5, 100, 2 },
				["Bear Bee"] = { 5, 100, 3 },
				["Petal Bee"] = { 5, 100, 4 },
				["Wasp"] = { 5, 100, 5 },
				["Tarantula Hawk"] = { 5, 100, 6 },
				["Glimmering Sprite"] = { 5, 100, 7 },
                ["Sunny-Side Chicken"] = { 3, 100, 8 },
                ["Starfish"] = { 5, 100, 9 },
            	["Brown Mouse"] = { 3, 100, 10 },
                ["Grey Mouse"] = { 3, 100, 11 },
                ["Rooster"] = { 4, 100, 12 },
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
