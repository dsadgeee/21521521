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
"Enchanted Seed Pack",
		}
	},

	Events = {
		["Fairy Event"] = {
			Minimum_Money = 10_000_000, -- minimum money to start play this event
			Rewards_Item = {
				"Enchanted Egg",
				"Enchanted Seed Pack",
				"Fairy Targeter",
				"FairyPoints",
				"Mutation Spray Glimmering",
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
			},
				Catch_Fairy_Before_Restock = 1000, -- fr it 50 but to be sure i put 51
		},
		MaxMoney_Restocks = 5_000_000_000_000,
		Shop = { -- un comment to buy
			"Enchanted Egg",
			"Enchanted Seed Pack",
			"Sprout Seed Pack",
			"Sprout Egg",
			"Luminous Sprite",
			"Mutation Spray Luminous",
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
                "Phoenix",
                ["Shroomie"] = 2,
                ["Drake"] = 2,
                "Luminous Sprite",
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
                "Chicken Zombie",
		},
		LockPet_Weight = 6, -- if Weight >= 10 they will locked
	},

    Webhook = {
		UrlPet = "https://discord.com/api/webhooks/1408866660017766500/8OgtYYAinAJ9qhpqLxr_jIzUztGg0YqnxzayJql_zAyaYqzoXxUH2OhEoo9DX09HpDOF",
		UrlSeed = "XXX",
		PcName = "2",

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

wait(4)
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
