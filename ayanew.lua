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
			["Coconut"] = 10,
			["Mushroom"] = 10,
			["Glowthorn"] = 10,
			["Pepper"] = 10,
			["Cacao"] = 10,
			["Apple"] = 10,
			["Wispwing"] = 10,
			["Romanesco"] = 10,
			["Elder Strawberry"] = 10,
			["Burning Bud"] = 10,
			["Giant Pinecone"] = 10,
			["Corn"] = 10,
			["Sugar Apple"] = 10,
			["Ember Lily"] = 10,
			["Dragon Fruit"] = 10,
			["Sunbulb"] = 10,
			["Orange Tulip"] = 10,
			["Mango"] = 10,
			["Cactus"] = 10,
			["Beanstalk"] = 10,
			["Lightshoot"] = 10,
			["Grape"] = 10,
			["Daffodil"] = 10,
			["Aurora Vine"] = 10,
			["Grand Tomato"] = 10,
			["Maple Apple"] = 10,
			["Princess Thorn"] = 10,
			["Spiked Mango"] = 10,
			["Pineapple"] = 10,
			["King Cabbage"] = 10,
			["Carnival Pumpkin"] = 10,
			["Kniphofia"] = 10,
			["Golden Peach"] = 10,
			["Maple Resin"] = 10,
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
		["Fall Event"] = {
			Minimum_Money = 10_000_000,
		},
		["Fairy Event"] = {
			Minimum_Money = 10_000_000, -- minimum money to start play this event
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
					["Glimmer Multiplier"] = 1, -- max 10
					["Loose Fairy Spawn Amount"] = 10, -- max 10
					["Fairy Event Duration"] = 10, -- max 10
					["Fairy Spawn Amount"] = 9, -- max 9
				}
			}
		},
		MaxMoney_Restocks = 5_000_000_000_000,
		Shop = { -- un comment to buy
			"Fell Egg",
			"Enchanted Chest",
			"Enchanted Egg",
			"Enchanted Seed Pack",
			"Drake",
			"Wisp",
			"Luminous Sprite",

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
			"Fairy Net",
			"Enchanted Chest",
			"Enchanted Egg",
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
			"Harvest Tool",
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
			"Fall Egg",
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
			"Rare Egg",
		},
		Buy = {
			"Fall Egg",
			"Bee Egg",
			"Enchanted Egg",
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
				["Starfish"] = { 5, 100, 1, true }, -- the "true" on the last is auto equip (use for like only need to use for upgrade pet)
				["Brown Mouse"] = { 1, 100 },
				["Squirrel"] = { 1, 100 }, 
				["Grey Mouse"] = { 1, 100 },
			},
			["Limit Upgrade"] = 5, -- max is 5 (more than or lower than 1 will do nothing)
			["Equip When Done"] = {
                		["Sunny-Side Chicken"] = { 8, 100, 2 },
                		["Starfish"] = { 1, 100, 3 },
                		["Brown Mouse"] = { 1, 100, 4 },
                		["Grey Mouse"] = { 1, 100, 5 },
                		["Rooster"] = { 5, 100, 6 },
			},
		},
		Unfavorite_AllPet = false,
		Favorite_LockedPet = false,
		Locked_Pet_Age = 60, -- pet that age > 60 will lock
		Locked = {
			"Phoenix",
			"Cockatrice",
			"Swan",
			"Barn Owl",
 			"Griffin",
 			"Chicken Zombie",
 			"Peach Wasp",
 			"Lemon Lion",
 			"Golden Goose",
 			["Rooster"] = 5,
 			"Lobster Thermidor",
 			["Sunny-Side Chicken"] = 35,
 			"French Fry Ferret",
 			"Kodama",
 			"Corrupted Kitsune",
 			"Nihonzaru",
 			["Starfish"] = 6,
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
		LockPet_Weight = 7, -- if Weight >= 10 they will locked
		Ignore_Pet_Weight = {
			"NAME oF PET THAT U DONT NEED LOCK",
		},
		Instant_Sell = {
			"NAME oF SOMETHING",
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
				"Swan",
				"Phoenix",
				"Golden Goose",
				"French Fry Ferret",
				"Cockatrice",
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
License = "8xGBxxJlHuPLdS1c2sW50enf54WzHG6L"
loadstring(game:HttpGet('https://raw.githubusercontent.com/Real-Aya/Loader/main/Init.lua'))()

wait(4)
-- Script generated by SimpleSpy - credits to exx#9394
local Rep = game:GetService("ReplicatedStorage")

task.spawn(function()
    while task.wait(1) do -- delay 1 giây để tránh kick
        -- 🛒 Mua Fall Egg
        local args1 = {
            [1] = "Fall Egg",
            [2] = 3
        }
        Rep.GameEvents.BuyEventShopStock:FireServer(unpack(args1))
        print("🛒 Đã mua:", args1[1])

        -- 🛒 Mua Space Squirrel
        local args2 = {
            [1] = "Space Squirrel",
            [2] = 3
        }
        Rep.GameEvents.BuyEventShopStock:FireServer(unpack(args2))
        print("🛒 Đã mua:", args2[1])
    end
end)

local Players = game:GetService('Players')
local Rep = game:GetService('ReplicatedStorage')
local CollectionService = game:GetService('CollectionService')

local localPlayer = Players.LocalPlayer
local CollectRemote = Rep.GameEvents.Crops.Collect
local SubmitAllRemote = Rep.GameEvents.FallMarketEvent.SubmitAllPlants

-- ⚙️ Delay và quét
local USE_FARM_ONLY = true
local FIRE_DELAY = 1
local INTERVAL = 10

-- 📂 Farm folder
local farmFolder
pcall(function()
    if
        workspace:FindFirstChild('Farm')
        and workspace.Farm:FindFirstChild('Farm')
    then
        farmFolder = workspace.Farm.Farm
    end
end)

-- 🏷️ Các loại cây cần thu hoạch
local targetCrops = {
    ['Mushroom'] = true,
    ['Glowthorn'] = true,
    ['Pepper'] = true,
    ['Cacao'] = true,
    ['Apple'] = true,
    ['Wispwing'] = true,
    ['Romanesco'] = true,
    ['Elder Strawberry'] = true,
    ['Burning Bud'] = true,
    ['Giant Pinecone'] = true,
    ['Corn'] = true,
    ['Sugar Apple'] = true,
    ['Ember Lily'] = true,
    ['Dragon Fruit'] = true,
    ['Sunbulb'] = true,
    ['Orange Tulip'] = true,
    ['Mango'] = true,
    ['Cactus'] = true,
    ['Beanstalk'] = true,
    ['Lightshoot'] = true,
    ['Grape'] = true,
    ['Daffodil'] = true,
    ['Aurora Vine'] = true,
    ['Grand Tomato'] = true,
    ['Maple Apple'] = true,
    ['Princess Thorn'] = true,
    ['Spiked Mango'] = true,
    ['Pineapple'] = true,
    ['King Cabbage'] = true,
    ['Carnival Pumpkin'] = true,
    ['Kniphofia'] = true,
    ['Golden Peach'] = true,
    ['Maple Resin'] = true,
}

-- 🏷️ Kiểm tra tag thu hoạch
local function hasCollectTag(obj)
    if type(obj.HasTag) == 'function' then
        local ok, res = pcall(function()
            return obj:HasTag('CollectPrompt')
        end)
        if ok then
            return res
        end
    end
    return CollectionService:HasTag(obj, 'CollectPrompt')
end

-- 🌱 Thu hoạch và nộp ngay sau mỗi lần
local function harvestAndSubmit()
    local descendants = USE_FARMONLY and farmFolder:GetDescendants()
        or workspace:GetDescendants()

    for _, inst in ipairs(descendants) do
        if inst:IsA('ProximityPrompt') and hasCollectTag(inst) then
            local crop = inst.Parent and inst.Parent.Parent
            if crop and targetCrops[crop.Name] then
                -- Thu hoạch
                CollectRemote:FireServer({ crop })
                task.wait(FIRE_DELAY)

                -- Nộp ngay sau khi thu hoạch cây này
                SubmitAllRemote:FireServer()
            end
        end
    end
end

-- 🔄 Loop
while task.wait(INTERVAL) do
    harvestAndSubmit()
end
