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
				"Sunbulb",
				"Strawberry",
				"Dragon Fruit",
				"Mango",
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
			Minimum_Money = 10_000_000, -- minimum money to start play this event
			Rewards_Item = { -- top mean select first
				"Enchanted Egg",
				"Enchanted Seed Pack",
				"Fairy Targeter",
				"FairyPoints",
				"Pet Shard Glimmering",
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
			"Enchanted Egg",
			"Enchanted Seed Pack",
			"Drake",

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
			"Legendary Egg",
			"Rare Egg",
			"Mythical Egg",
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
			["Glimmering Sprite"] = { 3, 100, 1 },
			["Capybara"] = { 1, 100 },
			["Rooster"] = { 5, 100, 2 },
            ["Starfish"] = { 1, 100 },
            ["Brown Mouse"] = { 1, 100 },
            ["Squirrel"] = { 1, 100 }, 
            ["Grey Mouse"] = { 1, 100 },
            ["Sunny-Side Chicken"] = { 5, 100, 2 },
			},
		},
		Unfavorite_AllPet = false,
		Favorite_LockedPet = false,
		Locked_Pet_Age = 60, -- pet that age > 60 will lock
		Locked = {
			"Phoenix",
			"Shroomie",
			"Cardinal",
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
		LockPet_Weight = 5, -- if Weight >= 10 they will locked
	},

	Webhook = {
		UrlPet = "https://discord.com/api/webhooks/1408866660017766500/8OgtYYAinAJ9qhpqLxr_jIzUztGg0YqnxzayJql_zAyaYqzoXxUH2OhEoo9DX09HpDOF",
		UrlSeed = "xxx",
		PcName = "2",

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
License = "hLv5vGDrHC1cR2eyIaPkonhV0CmU0L12"
loadstring(game:HttpGet('https://raw.githubusercontent.com/Real-Aya/Loader/main/Init.lua'))()
wait(10)
-- Auto interact Fairy trong workspace["1"] -> workspace["10"]
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
    wait(30) -- lặp lại sau 60 giây
end
-- 🌟 Auto Harvest Sunbulb + Auto Craft Seed Pack/Chest
local Players = game:GetService("Players")
local Rep = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")

local localPlayer = Players.LocalPlayer
local DataService = require(Rep.Modules.DataService)

local CollectRemote = Rep.GameEvents.Crops.Collect
local SubmitFairy = Rep.GameEvents.FairyService.SubmitFairyFountainAllPlants
local CraftRemote = Rep.GameEvents.CraftingGlobalObjectService
local bench = workspace.Interaction.UpdateItems.FairyGenius.FairyWorldCraftingWorkBench

-- ⚙️ Config
local INTERVAL = 50      -- giây giữa mỗi vòng harvest
local LIMIT = 20         -- số trái Sunbulb tối đa mỗi vòng
local FIRE_DELAY = 2     -- delay giữa các lần thu hoạch
local SUBMIT_DELAY = 1   -- delay giữa 2 lần submit
local USE_FARM_ONLY = true -- true = chỉ quét farm của bạn

-- Farm folder
local farmFolder
pcall(function()
    if workspace:FindFirstChild("Farm") and workspace.Farm:FindFirstChild("Farm") then
        farmFolder = workspace.Farm.Farm
    end
end)

-- Kiểm tra CollectPrompt tag
local function hasCollectTag(obj)
    if type(obj.HasTag) == "function" then
        local ok, res = pcall(function()
            return obj:HasTag("CollectPrompt")
        end)
        if ok then return res end
    end
    return CollectionService:HasTag(obj, "CollectPrompt")
end

-- ✅ Hàm thu hoạch Sunbulb
local function harvestSunbulb(limit)
    local collected = 0
    local descendants = USE_FARM_ONLY and farmFolder:GetDescendants() or workspace:GetDescendants()

    for _, inst in ipairs(descendants) do
        if inst:IsA("ProximityPrompt") and hasCollectTag(inst) then
            local crop = inst.Parent and inst.Parent.Parent
            if crop and crop.Name == "Sunbulb" then
                CollectRemote:FireServer({ crop })
                task.wait(FIRE_DELAY)

                -- Submit ngay sau mỗi trái
                SubmitFairy:FireServer()
                task.wait(SUBMIT_DELAY)
                SubmitFairy:FireServer()

                collected += 1
                if collected >= limit then break end
            end
        end
    end
    return collected
end

-- 🔑 Lấy UUID từ Backpack/Character
local function getUUID(itemName)
    for _, item in ipairs(localPlayer.Backpack:GetChildren()) do
        if string.find(item.Name, itemName) then
            return item:GetAttribute("c")
        end
    end
    for _, item in ipairs(localPlayer.Character:GetChildren()) do
        if string.find(item.Name, itemName) then
            return item:GetAttribute("c")
        end
    end
    return nil
end

-- Đếm số lượng item trong Backpack
local function countItem(itemName)
    local count = 0
    for _, item in ipairs(localPlayer.Backpack:GetChildren()) do
        if string.find(item.Name, itemName) then
            count += 1
        end
    end
    return count
end

-- 🧪 Craft Enchanted Seed Pack
local function craftSeedPack()
    CraftRemote:FireServer("SetRecipe", bench, "FairyWorldCraftingWorkBench", "Enchanted Seed Pack")

    local items = {
        {slot = 1, Name = "Mushroom Seed", Type = "Seed"},
        {slot = 2, Name = "Mushroom Seed", Type = "Seed"},
    }

    for _, v in ipairs(items) do
        local uuid = getUUID(v.Name)
        if uuid then
            CraftRemote:FireServer("InputItem", bench, "FairyWorldCraftingWorkBench", v.slot, {
                ItemType = v.Type,
                ItemData = {UUID = uuid}
            })
        end
    end

    CraftRemote:FireServer("Craft", bench, "FairyWorldCraftingWorkBench")
end

-- 🧰 Craft Enchanted Chest
local function craftChest()
    CraftRemote:FireServer("SetRecipe", bench, "FairyWorldCraftingWorkBench", "Enchanted Chest")

    local items = {
        {slot = 1, Name = "Sunbulb", Type = "Holdable"},
        {slot = 2, Name = "Enchanted Seed Pack", Type = "Seed Pack"},
        {slot = 3, Name = "Enchanted Egg", Type = "PetEgg"},
    }

    for _, v in ipairs(items) do
        local uuid = getUUID(v.Name)
        if uuid then
            CraftRemote:FireServer("InputItem", bench, "FairyWorldCraftingWorkBench", v.slot, {
                ItemType = v.Type,
                ItemData = {UUID = uuid}
            })
        end
    end

    CraftRemote:FireServer("Craft", bench, "FairyWorldCraftingWorkBench")
end

-- 🔄 Main loop
while task.wait(60) do
    -- Thu hoạch Sunbulb mỗi vòng
    harvestSunbulb(LIMIT)

    -- Craft theo logic
    if countItem("Enchanted Seed Pack") < 1 then
        craftSeedPack()
    else
        craftChest()
    end
end
