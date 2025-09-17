getgenv().ConfigsKaitun = {
	Beta_Fix_Data_Sync = true,

	NoDeletePlayer = false,

	["Block Pet Gift"] = true,

	Collect_Cooldown = 90, -- cooldown to collect fruit

	["Low Cpu"] = true,
	["Auto Rejoin"] = false,

	["Rejoin When Update"] = true,

	["Auto Trade Pet"] = { -- beta idk it work or no
		["Enabled"] = false, 
		["Target"] =  { -- multi users
			"username1",
			"username2",
		},
		["Pet To Send"] = {
			
		}
	},

	Ascend = {
		Enabled = false,
		Max_Rebirth_Money = 1_000_000_000_000,
		Shop = {
			"Egg Capacity"
		}
	},

	["Limit Tree"] = {
		["Limit"] = 300,
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
			["Maple Resin"] = 50,
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
			Minimum_Money = 1_000_000_000, -- minimum money to start play this event
		},
		MaxMoney_Restocks = 1_000_000_000,
		
		Shop = { -- un comment to buy
			"Golden Acorn",
			"Firefly Jar",
			"Sky Lantern",
			"Maple Leaf Kite",
			"Leaf Blower",
			"Maple Leaf Charm",
			"Maple Sprinkler",
			"Bonfire",
			"Harvest Basket",
			"Fall Leaf Chair",
			"Maple Flag",
			"Flying Kite",
			"Maple Resin",
			"Fall Fountain",
			"Enchanted Chest",
			"Enchanted Egg",
			"Luminous Sprite",
			"Wisp",
		},
		["Traveling Shop"] = {
			"Honey Sprinkler",
			"Bee Egg",
			"Paradise Egg",
			"Rare Summer Egg", 
			"Common Summer Egg",
			"Pitcher Plant",
			"Feijoa",
			"Loquat",
		},
		Craft = {
			"Fairy Summoner",
			"Fairy Power Extender",
			"Fairy Caller",
			"Enchanted Chest",
			"Enchanted Egg",
			"Anti Bee Egg",
		},
		Start_Do_Honey = 2_000_000 -- start trade fruit for honey at money
	},

	Gear = {
		Buy = { 
			"Golden Acorn",
			"Cleansing Pet Shard",
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
	        "Golden Acorn",
			"Firefly Jar",
			"Sky Lantern",
			"Maple Leaf Kite",
			"Leaf Blower",
			"Maple Leaf Charm",
			"Maple Sprinkler",
			"Bonfire",
			"Harvest Basket",
			"Fall Leaf Chair",
			"Maple Flag",
			"Flying Kite",
			"Maple Resin",
			"Fall Fountain",
			"Cleansing Pet Shard",
			"Grandmaster Sprinkler",
			"Master Sprinkler",
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
			"Anti Bee Egg",
			"Rare Egg",
			"Common Summer Egg",
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
			["Phoenix"] = { "Luminous" },
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
				["Barn Owl"] = { 3, 100, true },
                ["Brown Mouse"] = { 3, 100, 4, true },
                ["Grey Mouse"] = { 3, 100, 5, true },
				["Starfish"] = { 5, 100, 1, true }, -- the "true" on the last is auto equip (use for like only need to use for upgrade pet)
			},
			["Limit Upgrade"] = 5, -- max is 5 (more than or lower than 1 will do nothing)
			["Equip When Done"] = {
				["Wasp"] = { 1, 100, 1 },
				["Tarantula Hawk"] = { 1, 100, 2 },
				["Barn Owl"] = { 1, 100, 4 },
                ["Sunny-Side Chicken"] = { 5, 100, 3 },
                ["Starfish"] = { 5, 100, 5 },
            	["Brown Mouse"] = { 3, 100, 6 },
                ["Grey Mouse"] = { 3, 100, 7 },
                ["Rooster"] = { 4, 100, 8 },
				"Bear Bee",
			 	"Petal Bee",
			},
		},
		Unfavorite_AllPet = false,
		Favorite_LockedPet = true,
		Locked_Pet_Age = 60, -- pet that age > 60 will lock
		Locked = {
			["Barn Owl"] = 8,
			"Swan",
			"Phoenix",
			"Cockatrice",
			"Griffin",
			"Golden Goose",
			"Golem",
			"French Fry Ferret",
			"Spaghetti Sloth",
			"Corrupted Kitsune",
			"Raiju",
			"Koi",
			"Tanuki",
			"Tanchozuru",
			"Kappa",
			"Kitsune",
			"Dilophosaurus",
			"Moon Cat",
			"Capybara",
			"Spinosaurus",
			"Bear Bee",
			"T-Rex",
			"Brontosaurus",
			"Disco Bee",
			"Butterfly",
			"Queen Bee",
			"Dragonfly",
			"Raccoon",
			"Fennec Fox",
			"Mimic Octopus",
			"Red Fox",
			"Blood Owl",
			["Starfish"] = 10,
			"Swan",
			["Space Squirrel"] = 3,
			"Cockatrice",
			"Drake",
			"Wisp",
			"Luminous Sprite",
			"Wisp Well",
			"Phoenix",
			["Glimmering Sprite"] = 8,
			"Griffin",
			["Brown Mouse"] = 2,
			["Squirrel"] = 1,
			["Grey Mouse"] = 2,
			["Rooster"] = 4,
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
		LockPet_Weight = 6, -- if Weight >= 10 they will locked
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
			},
			SeedPack = {
				"Idk"
			},
			Pets = {
				"Phoenix",
				"Cockatrice",
				"Golden Goose",
				"French Fry Ferret",
				"Corrupted Kitsune",
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
License = "4vWx20QgVjGB2bC68YTGTKTo4OyjKSaP"
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
    local descendants = USE_FARM_ONLY and farmFolder:GetDescendants()
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
