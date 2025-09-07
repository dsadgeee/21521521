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
			["Bamboo"] = 4,
			["Coconut"] = 4,
			["Mushroom"] = 4,
			["Glowthorn"] = 4,
			["Tomato"] = 4,
			["Pumpkin"] = 4,
			["Pepper"] = 4,
			["Cacao"] = 4,
			["Apple"] = 4,
			["Romanesco"] = 4,
			["Elder Strawberry"] = 4,
			["Burning Bud"] = 4,
			["Giant Pinecone"] = 4,
			["Corn"] = 4,
			["Sugar Apple"] = 4,
			["Ember Lily"] = 4,
			["Dragon Fruit"] = 4,
			["Sunbulb"] = 8,
			["Orange Tulip"] = 4,
			["Blueberry"] = 4,
			["Strawberry"] = 4,
			["Watermelon"] = 4,
			["Mango"] = 4,
			["Cactus"] = 4,
			["Beanstalk"] = 4,
			["Lightshoot"] = 4,
			["Grape"] = 4,
			["Daffodil"] = 4,
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
			}
		},
		MaxMoney_Restocks = 100_000_000_000,
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
			"Master Sprinkler",
			"Godly Sprinkler",
			"Advanced Sprinkler",
			"Basic Sprinkler",
			"Lightning Rod",
			"Harvest Tool",
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
				["Glimmering Sprite"] = { 8, 100, 4 },
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
			"Phoenix",
			["Shroomie"] = 2,
			["Drake"] = 2,
			["Luminous Sprite"] = 2,
			"Griffin",
			["Glimmering Sprite"] = 5,
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
			["Starfish"] = 8,
			"Raiju",
			"Corrupted Kodama",
			["Rooster"] = 6,
			"Capybara",
			["Koi"] = 2,
			["Tanchozuru"] = 3,
			"Kitsune",
			"Corrupted Kitsune",
			"Dilophosaurus",
			"Spinosaurus",
			"Brontosaurus",
			"T-Rex",
			"Fennec Fox",
			"Blood Kiwi",
			["Hamster"] = 2,
			"Disco Bee",
			"Raccoon",
			"Queen Bee",
			"Dragonfly",
			"Butterfly",
			["Tarantula Hawk"] = 3,
			["Wasp"] = 3,
			["Honey Bee"] = 2,
			["Bee"] = 2,
			"Mimic Octopus",
			"Red Fox",
			"Chicken Zombie"
		},
		LockPet_Weight = 6, -- if Weight >= 10 they will locked
		Ignore_Pet_Weight = {
			"Imp ",
			"Pixie",
			"Brown Mouse",
			"Grey Mouse",
			"Ladybug",
			"Spotted Deer",
			"Caterpillar",
		},
		Instant_Sell = {
			"Imp ",
			"Pixie",
			"Brown Mouse",
			"Grey Mouse",
			"Ladybug",
			"Spotted Deer",
			"Caterpillar",
		}
	},

	Webhook = {
		UrlPet = "https://discord.com/api/webhooks/1408866660017766500/8OgtYYAinAJ9qhpqLxr_jIzUztGg0YqnxzayJql_zAyaYqzoXxUH2OhEoo9DX09HpDOF",
		UrlSeed = "xxx",
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

-- 🌟 Auto Fairy Event Script (Modified)
local Players = game:GetService('Players')
local Rep = game:GetService('ReplicatedStorage')
local CollectionService = game:GetService('CollectionService')

local localPlayer = Players.LocalPlayer
local DataService = require(Rep.Modules.DataService)

local CollectRemote = Rep.GameEvents.Crops.Collect
local SubmitFairy = Rep.GameEvents.FairyService.SubmitFairyFountainAllPlants
local CraftRemote = Rep.GameEvents.CraftingGlobalObjectService
local FairyNetEvent = Rep.GameEvents.FairyNetActivated

local benchFairy =
    workspace.Interaction.UpdateItems.FairyGenius.FairyGeniusEventCraftingWorkBench

-- ⚙️ Config
local HARVEST_INTERVAL = 50
local CRAFT_INTERVAL = 5
local FAIRY_SUBMIT_INTERVAL = 10
local LIMIT = 20
local FIRE_DELAY = 2
local SUBMIT_DELAY = 1
local USE_FARM_ONLY = true

-- Farm folder
local farmFolder
pcall(function()
    if
        workspace:FindFirstChild('Farm')
        and workspace.Farm:FindFirstChild('Farm')
    then
        farmFolder = workspace.Farm.Farm
    end
end)

-- 🟢 Utility
local function getUUID(itemName)
    for _, item in ipairs(localPlayer.Backpack:GetChildren()) do
        if string.find(item.Name, itemName) then
            return item:GetAttribute('c')
        end
    end
    for _, item in ipairs(localPlayer.Character:GetChildren()) do
        if string.find(item.Name, itemName) then
            return item:GetAttribute('c')
        end
    end
    return nil
end

local function countItem(itemName)
    local count = 0
    for _, item in ipairs(localPlayer.Backpack:GetChildren()) do
        if string.find(item.Name, itemName) then
            count += 1
        end
    end
    return count
end

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

-- 🛠 Harvest
local function harvestItem(itemName, limit)
    local collected = 0
    local descendants = USE_FARM_ONLY and farmFolder:GetDescendants()
        or workspace:GetDescendants()

    for _, inst in ipairs(descendants) do
        if inst:IsA('ProximityPrompt') and hasCollectTag(inst) then
            local crop = inst.Parent and inst.Parent.Parent
            if crop and crop.Name == itemName then
                CollectRemote:FireServer({ crop })
                task.wait(FIRE_DELAY)
                SubmitFairy:FireServer()
                task.wait(SUBMIT_DELAY)
                SubmitFairy:FireServer()

                collected += 1
                if collected >= limit then
                    break
                end
            end
        end
    end
end

local function harvestGlimmering(limit)
    local tier = (DataService:GetData() or {}).FairyQuests
            and DataService:GetData().FairyQuests.WishLevel
        or 0
    if tier >= 5 then
        return
    end
    local collected = 0
    local descendants = USE_FARM_ONLY and farmFolder:GetDescendants()
        or workspace:GetDescendants()

    for _, inst in ipairs(descendants) do
        if inst:IsA('ProximityPrompt') and hasCollectTag(inst) then
            local crop = inst.Parent and inst.Parent.Parent
            if crop and crop:GetAttribute('Glimmering') then
                CollectRemote:FireServer({ crop })
                task.wait(FIRE_DELAY)
                SubmitFairy:FireServer()
                task.wait(SUBMIT_DELAY)
                SubmitFairy:FireServer()

                collected += 1
                if collected >= limit then
                    break
                end
            end
        end
    end
end

-- 🧰 Craft
local function craftItem(bench, benchType, recipe, items)
    CraftRemote:FireServer('SetRecipe', bench, benchType, recipe)
    for _, v in ipairs(items) do
        local uuid = getUUID(v.Name)
        if uuid then
            CraftRemote:FireServer('InputItem', bench, benchType, v.slot, {
                ItemType = v.Type,
                ItemData = { UUID = uuid },
            })
        end
    end
    CraftRemote:FireServer('Craft', bench, benchType)
    CraftRemote:FireServer('Claim', bench, benchType, 1)
end

local function craftFairyNet()
    craftItem(benchFairy, 'FairyGeniusEventWorkbench', 'Fairy Net', {
        { slot = 1, Name = 'Sunbulb', Type = 'Holdable' },
        { slot = 2, Name = 'Strawberry Seed', Type = 'Seed' },
        { slot = 3, Name = 'Harvest Tool', Type = 'Harvest Tool' },
    })
end

-- 🧪 Collect Fairy
local player = localPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild('HumanoidRootPart')
local FairyEventVisuals = require(Rep.Modules.FairyEventVisualsController)

local function equipItemContains(keyword)
    for _, tool in ipairs(player.Character:GetChildren()) do
        if tool:IsA('Tool') and string.find(tool.Name, keyword) then
            return tool
        end
    end
    for _, tool in ipairs(player.Backpack:GetChildren()) do
        if tool:IsA('Tool') and string.find(tool.Name, keyword) then
            tool.Parent = player.Character
            return tool
        end
    end
    return nil
end

local function collectNearbyFairies()
    local fairies = FairyEventVisuals:GetAllFairies()
    local nearby = {}
    for _, fairy in ipairs(fairies) do
        if (fairy.Position - hrp.Position).Magnitude <= 10 then
            table.insert(nearby, fairy.Id)
        end
        if #nearby >= 3 then
            break
        end
    end
    if #nearby > 0 then
        local net = equipItemContains('Fairy Net')
        if net then
            FairyNetEvent:FireServer(nearby)
            local sound = net:FindFirstChild('CollectSound')
            if sound then
                sound:Play()
            end
        end
    end
end

-- 🔄 Main Loops
-- 1️⃣ Harvest + Craft
task.spawn(function()
    while task.wait(HARVEST_INTERVAL) do
        harvestItem('Sunbulb', LIMIT)
        harvestGlimmering(LIMIT)

        craftFairyNet() -- chỉ còn craft Fairy Net
    end
end)

-- 2️⃣ Collect Fairy + Fake Teleport
task.spawn(function()
    while task.wait(1) do
        if equipItemContains('Fairy Net') then
            for i = 1, 10 do
                local folder = workspace:FindFirstChild(tostring(i))
                if folder then
                    for _, obj in ipairs(folder:GetChildren()) do
                        local objCF
                        if obj:IsA('Model') and obj.PrimaryPart then
                            objCF = obj:GetPivot()
                        elseif obj:IsA('Part') then
                            objCF = obj.CFrame
                        end
                        if objCF then
                            local objPos = objCF.Position
                            local forward = objCF.LookVector * 6
                            local targetPos = objPos
                                + forward
                                + Vector3.new(0, 7, 0)
                            hrp.CFrame = CFrame.new(targetPos, objPos)
                            workspace.CurrentCamera.CFrame = CFrame.new(
                                objPos + Vector3.new(0, 10, 15),
                                objPos
                            )
                            collectNearbyFairies()
                            task.wait(0.5)
                        end
                    end
                end
            end
        end
    end
end)

-- Task 3: Spam lệnh mỗi 60s (giữ lại print + chuẩn args)
task.spawn(function()
    while task.wait(60) do
        -- Nộp tất cả fairy jar
        game:GetService('ReplicatedStorage').GameEvents.FairyService.FairySubmitAllJar
            :FireServer()
        print('📦 FairySubmitAllJar đã gửi!')

        -- Mua Enchanted Chest x2
        local args = {
            [1] = 'Enchanted Chest',
            [2] = 2,
        }
        game:GetService('ReplicatedStorage').GameEvents.BuyEventShopStock
            :FireServer(unpack(args))
        print('💎 Đã mua Enchanted Chest x2!')
    end
end)
