setfpscap(2)
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
		["Limit"] = 200,
		["Destroy Until"] = 300,

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
			--"Mythical Egg",
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
		Unfavorite_AllPet = true,
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
			["Rooster"] = 4,
			"Capybara",
			["Koi"] = 2,
			["Tanchozuru"] = 3,
			["Moth"] = 3, 
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
			["Tarantula Hawk"] = 5,
			["Wasp"] = 5,
			["Honey Bee"] = 5,
			["Bee"] = 5,
			"Mimic Octopus",
			"Red Fox",
			"Chicken Zombie"
		},
		LockPet_Weight = 5, -- if Weight >= 10 they will locked
		Ignore_Pet_Weight = {
			"Cardinal",
		},
		Instant_Sell = {
			"Cardinal",
			"Ladybug",
			"Pixie",
			"Imp",
			"Shroomie",
		}
	},
    Webhook = {
		UrlPet = "https://discord.com/api/webhooks/1408866660017766500/8OgtYYAinAJ9qhpqLxr_jIzUztGg0YqnxzayJql_zAyaYqzoXxUH2OhEoo9DX09HpDOF",
		UrlSeed = "XXX",
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
local HARVEST_INTERVAL = 1
local CRAFT_INTERVAL = 2
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
                            local forward = objCF.LookVector * 4
                            local targetPos = objPos
                                + forward
                                + Vector3.new(0, 1, 0)
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

local Players = game:GetService('Players')
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local player = Players.LocalPlayer

-- 🟢 NPC cần đứng gần
local npc =
    workspace.Interaction.UpdateItems.FairyIsland.FairyIsland['Luminous Sprite']

-- 🟢 Lấy nhân vật
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild('HumanoidRootPart')

-- 🟢 Auto vòng lặp
task.spawn(function()
    while task.wait(30) do
        -- Teleport vào Fairy World trước
        ReplicatedStorage.GameEvents.FairyService.TeleportFairyWorld:FireServer()
        print('🌌 Đã teleport vào Fairy World!')

        task.wait(2) -- chờ 1–2s để server load map Fairy World

        -- Tele đứng cách NPC, nhìn thẳng vào NPC
        local npcPos = npc.PrimaryPart.Position
        local targetPos = npcPos + Vector3.new(0, 6, 0) -- đứng cách NPC 5 studs
        hrp.CFrame = CFrame.lookAt(targetPos, npcPos, Vector3.new(0, 1, 0))

        -- Nộp tất cả fairy jar
        ReplicatedStorage.GameEvents.FairyService.FairySubmitAllJar:FireServer()
        print('📦 FairySubmitAllJar đã gửi!')

        -- Mua Enchanted Chest x2
        local args1 = { 'Enchanted Chest', 2 }
        ReplicatedStorage.GameEvents.BuyEventShopStock:FireServer(unpack(args1))
        print('💎 Đã mua Enchanted Chest x2!')

        -- Mua Luminous Sprite x2
        local args2 = { 'Luminous Sprite', 2 }
        ReplicatedStorage.GameEvents.BuyEventShopStock:FireServer(unpack(args2))
        print('✨ Đã mua Luminous Sprite x2!')
    end
end)
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild('HumanoidRootPart')

print('🔍 Bắt đầu teleport + collect RewardPoint1 → RewardPoint20...')

-- 🟢 Hàm thử claim RewardPoint
local function tryCollect(point)
    if not point or not point.Parent then
        return false
    end

    for _, descendant in ipairs(point:GetDescendants()) do
        if descendant:IsA('ProximityPrompt') then
            if descendant.Enabled == true then
                print('✨ Collecting:', point.Name)
                fireproximityprompt(descendant) -- bấm E
                return true
            else
                print('⚪ Prompt ở', point.Name, 'đã bị disable')
            end
        end
    end

    return false
end

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild('HumanoidRootPart')

print('🔍 Bắt đầu teleport + collect RewardPoint1 → RewardPoint20...')

-- 🟢 Hàm thử claim RewardPoint
local function tryCollect(point)
    if not point or not point.Parent then
        return false
    end

    for _, descendant in ipairs(point:GetDescendants()) do
        if descendant:IsA('ProximityPrompt') then
            if descendant.Enabled == true then
                print('✨ Collecting:', point.Name)
                fireproximityprompt(descendant) -- bấm E
                return true
            else
                print('⚪ Prompt ở', point.Name, 'đã bị disable')
            end
        end
    end

    return false
end

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild('HumanoidRootPart')

print('🔍 Bắt đầu teleport + collect RewardPoint1 → RewardPoint20...')

-- 🟢 Hàm thử claim RewardPoint
local function tryCollect(point)
    if not point or not point.Parent then
        return false
    end

    for _, descendant in ipairs(point:GetDescendants()) do
        if descendant:IsA('ProximityPrompt') then
            if descendant.Enabled == true then
                print('✨ Collecting:', point.Name)
                fireproximityprompt(descendant) -- bấm E
                return true
            else
                print('⚪ Prompt ở', point.Name, 'đã bị disable')
            end
        end
    end

    return false
end

while task.wait(1) do
    for i = 1, 20 do
        local point = workspace:FindFirstChild('RewardPoint' .. i)
        if point then
            -- Lấy vị trí pivot
            local objCF
            if point:IsA('Model') and point.PrimaryPart then
                objCF = point:GetPivot()
            elseif point:IsA('BasePart') then
                objCF = point.CFrame
            end

            if objCF then
                local objPos = objCF.Position
                print('➡️ Teleport tới:', point.Name)

                -- Tele ra trước 3 studs, cao hơn 1 stud
                local forward = objCF.LookVector * 3
                local targetPos = objPos + forward + Vector3.new(0, 1, 0)
                hrp.CFrame = CFrame.new(targetPos, objPos)

                -- Camera follow
                workspace.CurrentCamera.CFrame =
                    CFrame.new(objPos + Vector3.new(0, 10, 15), objPos)

                -- ⏳ Chờ tí rồi thử claim
                task.wait(0.5)
                local collected = tryCollect(point)
                if collected then
                    print('✅ Đã lấy RewardPoint:', point.Name)
                else
                    print('❌ Không có gì để lấy ở:', point.Name)
                end
            end
        else
            print('⚠️ Không tìm thấy RewardPoint' .. i)
        end
    end
end
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
