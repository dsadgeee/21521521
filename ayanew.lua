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
			["Strawberry"] = 4,
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
				"Strawberry"
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
		MaxMoney_Restocks = 5_000_000_000_000,
		Shop = { -- un comment to buy
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
-- 🌟 Auto Harvest Sunbulb + Auto Craft Seed Pack/Chest + Claim + Fairy

local Players = game:GetService('Players')
local Rep = game:GetService('ReplicatedStorage')
local CollectionService = game:GetService('CollectionService')

local localPlayer = Players.LocalPlayer
local DataService = require(Rep.Modules.DataService)

local CollectRemote = Rep.GameEvents.Crops.Collect
local SubmitFairy = Rep.GameEvents.FairyService.SubmitFairyFountainAllPlants
local CraftRemote = Rep.GameEvents.CraftingGlobalObjectService
local bench =
    workspace.Interaction.UpdateItems.FairyGenius.FairyWorldCraftingWorkBench

-- ⚙️ Config
local INTERVAL = 50 -- giây giữa mỗi vòng harvest
local LIMIT = 20 -- số trái tối đa mỗi vòng
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

-- Kiểm tra CollectPrompt tag
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

-- ✅ Harvest Sunbulb
local function harvestSunbulb(limit)
    local collected = 0
    local descendants = USE_FARM_ONLY and farmFolder:GetDescendants()
        or workspace:GetDescendants()

    for _, inst in ipairs(descendants) do
        if inst:IsA('ProximityPrompt') and hasCollectTag(inst) then
            local crop = inst.Parent and inst.Parent.Parent
            if crop and crop.Name == 'Sunbulb' then
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

-- 🔑 UUID
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
end

-- Đếm item trong balo
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
    CraftRemote:FireServer(
        'SetRecipe',
        bench,
        'FairyWorldCraftingWorkBench',
        'Enchanted Seed Pack'
    )

    local items = {
        { slot = 1, Name = 'Mushroom Seed', Type = 'Seed' },
        { slot = 2, Name = 'Mushroom Seed', Type = 'Seed' },
    }

    for _, v in ipairs(items) do
        local uuid = getUUID(v.Name)
        if uuid then
            CraftRemote:FireServer(
                'InputItem',
                bench,
                'FairyWorldCraftingWorkBench',
                v.slot,
                {
                    ItemType = v.Type,
                    ItemData = { UUID = uuid },
                }
            )
        end
    end

    CraftRemote:FireServer('Craft', bench, 'FairyWorldCraftingWorkBench')
    CraftRemote:FireServer('Claim', bench, 'FairyWorldCraftingWorkBench', 1)
end

-- 🧰 Craft Enchanted Chest
local function craftChest()
    CraftRemote:FireServer(
        'SetRecipe',
        bench,
        'FairyWorldCraftingWorkBench',
        'Enchanted Chest'
    )

    local items = {
        { slot = 1, Name = 'Sunbulb', Type = 'Holdable' },
        { slot = 2, Name = 'Enchanted Seed Pack', Type = 'Seed Pack' },
        { slot = 3, Name = 'Enchanted Egg', Type = 'PetEgg' },
    }

    for _, v in ipairs(items) do
        local uuid = getUUID(v.Name)
        if uuid then
            CraftRemote:FireServer(
                'InputItem',
                bench,
                'FairyWorldCraftingWorkBench',
                v.slot,
                {
                    ItemType = v.Type,
                    ItemData = { UUID = uuid },
                }
            )
        end
    end

    CraftRemote:FireServer('Craft', bench, 'FairyWorldCraftingWorkBench')
    CraftRemote:FireServer('Claim', bench, 'FairyWorldCraftingWorkBench', 1)
end

-- 🧿 Harvest Glimmering (chỉ nếu tier < 5)
local function getCurrentTier()
    local data = DataService:GetData()
    if not data or not data.FairyQuests then
        return 0
    end
    return data.FairyQuests.WishLevel
end

local function harvestGlimmering(limit)
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

-- 🧚 Auto interact Fairy (1 -> 10)
task.spawn(function()
    while true do
        for i = 1, 10 do
            local fairy = workspace:FindFirstChild(tostring(i))
            if fairy then
                local prompt =
                    fairy:FindFirstChildWhichIsA('ProximityPrompt', true)
                if prompt then
                    fireproximityprompt(prompt)
                end
            end
        end
        task.wait(30)
    end
end)

-- 🔄 Main loop
while task.wait(INTERVAL) do
    harvestSunbulb(LIMIT)

    if countItem('Enchanted Seed Pack') < 1 then
        craftSeedPack()
    else
        craftChest()
    end

    if getCurrentTier() < 5 then
        harvestGlimmering(LIMIT)
    end
end
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild('HumanoidRootPart')

local Rep = game:GetService('ReplicatedStorage')
local Events = Rep:WaitForChild('GameEvents')
local FairyEventVisuals = require(Rep.Modules.FairyEventVisualsController)
local FairyNetEvent = Events:WaitForChild('FairyNetActivated')

-- Hàm auto equip item theo keyword
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

-- Hàm collect fairy gần HRP
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

-- Task 1: Fake teleport tới folder 1 → 10 và collect fairy
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
        game:GetService("ReplicatedStorage").GameEvents.FairyService.FairySubmitAllJar:FireServer()
        print("📦 FairySubmitAllJar đã gửi!")

        -- Mua Enchanted Chest x2
        local args = {
            [1] = "Enchanted Chest",
            [2] = 2,
        }
        game:GetService("ReplicatedStorage").GameEvents.BuyEventShopStock:FireServer(unpack(args))
        print("💎 Đã mua Enchanted Chest x2!")
    end
end)
