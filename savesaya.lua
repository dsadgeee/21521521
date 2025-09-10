getgenv().ConfigsKaitun = {
	Beta_Fix_Data_Sync = true,

	NoDeletePlayer = false,

	["Block Pet Gift"] = true,

	Collect_Cooldown = 90, -- cooldown to collect fruit

	["Low Cpu"] = true,
	["Auto Rejoin"] = true,

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
-- 🌟 Auto Fairy Event Script (Switch by Score)
local Players = game:GetService('Players')
local Rep = game:GetService('ReplicatedStorage')
local DataService = require(Rep.Modules.DataService)
local localPlayer = Players.LocalPlayer

-- 🔮 Các remote quan trọng
local FairyNetEvent = Rep.GameEvents.FairyNetActivated
local FairyEventVisuals = require(Rep.Modules.FairyEventVisualsController)

-- 🧰 Utility
local function getFairyCount()
    local data = DataService:GetData()
    if data and data.FairyEvent then
        return (data.FairyEvent.FairiesCapturedWithNetV1 or 0)
            + (data.FairyEvent.FairiesCapturedWithNetV2 or 0)
    end
    return 0
end

local function equipItemContains(keyword)
    for _, tool in ipairs(localPlayer.Character:GetChildren()) do
        if tool:IsA('Tool') and string.find(tool.Name, keyword) then
            return tool
        end
    end
    for _, tool in ipairs(localPlayer.Backpack:GetChildren()) do
        if tool:IsA('Tool') and string.find(tool.Name, keyword) then
            tool.Parent = localPlayer.Character
            return tool
        end
    end
    return nil
end

-- 🧚 Collect Fairy gần
local char = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local hrp = char:WaitForChild('HumanoidRootPart')

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

-- 🌌 Script 1: Fake teleport + FairyNet
local function runNetMode()
    while task.wait(1) do
        local score = getFairyCount()
        if score < 900 then
            print('🔁 Chuyển sang Auto Interact Mode!')
            break -- thoát vòng loop này
        end

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

                            -- camera follow
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
end

-- 🌌 Script 2: Auto interact fairy bằng prompt
local function runInteractMode()
    while task.wait(5) do
        local score = getFairyCount()
        if score > 900 then
            print('🔁 Quay lại Net Mode!')
            break
        end

        for i = 1, 10 do
            local fairy = workspace:FindFirstChild(tostring(i))
            if fairy then
                local prompt =
                    fairy:FindFirstChildWhichIsA('ProximityPrompt', true)
                if prompt then
                    fireproximityprompt(prompt)
                    print('✨ Đã tương tác với Fairy:', fairy.Name)
                end
            end
        end
    end
end

-- 🔄 Vòng điều khiển chính
task.spawn(function()
    while task.wait(2) do
        local score = getFairyCount()
        if score < 900 then
            print('📊 Điểm hiện tại:', score, '→ chạy Net Mode')
            runNetMode()
        else
            print(
                '📊 Điểm hiện tại:',
                score,
                '→ chạy Interact Mode'
            )
            runInteractMode()
        end
    end
end)

-- 🟢 Auto teleport + nộp jar + mua item shop
local npc =
    workspace.Interaction.UpdateItems.FairyIsland.FairyIsland['Luminous Sprite']
task.spawn(function()
    while task.wait(30) do
        Rep.GameEvents.FairyService.TeleportFairyWorld:FireServer()
        print('🌌 Đã teleport vào Fairy World!')
        task.wait(2)

        local npcPos = npc.PrimaryPart.Position
        local targetPos = npcPos + Vector3.new(0, 6, 0)
        hrp.CFrame = CFrame.lookAt(targetPos, npcPos, Vector3.new(0, 1, 0))

        Rep.GameEvents.FairyService.FairySubmitAllJar:FireServer()
        print('📦 FairySubmitAllJar đã gửi!')

        local args1 = { 'Enchanted Chest', 2 }
        Rep.GameEvents.BuyEventShopStock:FireServer(unpack(args1))
        print('💎 Đã mua Enchanted Chest x2!')

        local args2 = { 'Luminous Sprite', 2 }
        Rep.GameEvents.BuyEventShopStock:FireServer(unpack(args2))
        print('✨ Đã mua Luminous Sprite x2!')
    end
end)

-- 🟢 Teleport + collect RewardPoint1 → RewardPoint20
print('🔍 Bắt đầu teleport + collect RewardPoint1 → RewardPoint20...')
local function tryCollect(point)
    if not point or not point.Parent then
        return false
    end
    for _, descendant in ipairs(point:GetDescendants()) do
        if descendant:IsA('ProximityPrompt') and descendant.Enabled then
            fireproximityprompt(descendant)
            print('✅ Đã lấy RewardPoint:', point.Name)
            return true
        end
    end
    return false
end

task.spawn(function()
    while task.wait(20) do
        for i = 1, 20 do
            local point = workspace:FindFirstChild('RewardPoint' .. i)
            if point then
                local objCF
                if point:IsA('Model') and point.PrimaryPart then
                    objCF = point:GetPivot()
                elseif point:IsA('BasePart') then
                    objCF = point.CFrame
                end
                if objCF then
                    local objPos = objCF.Position
                    local forward = objCF.LookVector * 3
                    local targetPos = objPos + forward + Vector3.new(0, 1, 0)
                    hrp.CFrame = CFrame.new(targetPos, objPos)
                    workspace.CurrentCamera.CFrame =
                        CFrame.new(objPos + Vector3.new(0, 10, 15), objPos)
                    task.wait(0.4)
                    tryCollect(point)
                end
            end
        end
    end
end)
