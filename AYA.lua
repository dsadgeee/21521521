-- ===============================
-- 🛡️ Anti-AFK Script (auto chạy luôn)
-- ===============================

local Players = game:GetService('Players')
local VirtualUser = game:GetService('VirtualUser')
local player = Players.LocalPlayer

player.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
    warn('✅ Anti-AFK: giả lập click chuột, tránh bị kick')
end)

-- ===============================
-- 🔧 Services & Modules
-- ===============================
local RS = game:GetService('ReplicatedStorage')
local Players = game:GetService('Players')
local CollectionService = game:GetService('CollectionService')
local HttpService = game:GetService('HttpService')
local CoreGui = game:GetService('CoreGui')
local player = Players.LocalPlayer

local DataService = nil
pcall(function()
    DataService = require(RS.Modules.DataService)
end)

local ReplicatorClass = nil
pcall(function()
    ReplicatorClass = require(RS.Modules.ReplicationClass)
end)

local PetRegistry = nil
pcall(function()
    PetRegistry = require(RS.Data.PetRegistry)
end)

-- Replicators cho Pets
local ActivePetsService, ActivePetStates, PlayerPetData
if ReplicatorClass then
    ActivePetsService = ReplicatorClass.new('ActivePetsService_Replicator')
    pcall(function()
        ActivePetsService:YieldUntilData()
    end)
    local tbl = ActivePetsService and ActivePetsService:YieldUntilData().Table
        or {}
    ActivePetStates = tbl.ActivePetStates or {}
    PlayerPetData = tbl.PlayerPetData or {}
end

-- ===============================
-- 🖼️ HUD UI Sucacheo
-- ===============================
local TimeHelper = nil
pcall(function()
    TimeHelper = require(RS.Modules.TimeHelper)
end)

local screenGui = Instance.new('ScreenGui')
screenGui.Name = 'SucacheoHubUI'
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
screenGui.DisplayOrder = 200 -- HUD luôn nổi trên overlay
screenGui.Parent = CoreGui

local hubTitle = Instance.new('TextLabel')
hubTitle.Size = UDim2.new(1, 0, 0, 50)
hubTitle.Position = UDim2.new(0, 0, 0, 10)
hubTitle.BackgroundTransparency = 1
hubTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
hubTitle.Font = Enum.Font.GothamBold
hubTitle.TextSize = 24
hubTitle.TextStrokeTransparency = 0.1
hubTitle.Text = '🌟 Sucacheo Hub 🌟'
hubTitle.ZIndex = 9999
hubTitle.Parent = screenGui

local status = Instance.new('TextLabel')
status.Size = UDim2.new(0, 600, 0, 500)
status.AnchorPoint = Vector2.new(0.5, 0)
status.Position = UDim2.new(0.5, 0, 0.5, -200)
status.BackgroundTransparency = 1
status.TextColor3 = Color3.fromRGB(255, 215, 0)
status.Font = Enum.Font.GothamBold
status.TextSize = 24
status.TextStrokeTransparency = 0.2
status.TextXAlignment = Enum.TextXAlignment.Center
status.TextYAlignment = Enum.TextYAlignment.Top
status.TextWrapped = true
status.Text = '🐣 Egg Farm Status\nLoading...'
status.ZIndex = 9999
status.Parent = screenGui

-- ===============================
-- 🔑 Extra Stats (pet, fruit, cây)
-- ===============================
local function getMyFarm()
    for _, farm in ipairs(workspace:GetChildren()) do
        if farm.Name == 'Farm' then
            for _, subFarm in ipairs(farm:GetChildren()) do
                if
                    subFarm.Name == 'Farm'
                    and subFarm:FindFirstChild('Important')
                    and subFarm.Important:FindFirstChild('Data')
                    and subFarm.Important.Data:FindFirstChild('Owner')
                    and subFarm.Important.Data.Owner.Value == player.Name
                then
                    return subFarm
                end
            end
        end
    end
    return nil
end

local function countAllPlants(myFarm)
    if not myFarm then
        return 0
    end
    local folder = myFarm.Important:FindFirstChild('Plants_Physical')
    if not folder then
        return 0
    end
    return #folder:GetChildren()
end

local function getExtraStats()
    local equippedCount, backpackCount, fruitCount, plantCount = 0, 0, 0, 0
    if PlayerPetData and ActivePetStates then
        local pdata = PlayerPetData[player.Name]
        local active = ActivePetStates[player.Name] or {}
        if pdata then
            for _ in pairs(active) do
                equippedCount += 1
            end
            local total = 0
            for _ in pairs(pdata.PetInventory.Data or {}) do
                total += 1
            end
            backpackCount = total - equippedCount
        end
    end
    for _, tool in ipairs(player.Backpack:GetChildren()) do
        if tool:GetAttribute('b') == 'j' then
            local q = tool:GetAttribute('Quantity') or 1
            fruitCount += q
        end
    end
    local myFarm = getMyFarm()
    if myFarm then
        plantCount = countAllPlants(myFarm)
    end
    return equippedCount, backpackCount, fruitCount, plantCount
end

-- ===============================
-- 🔄 Update UI
-- ===============================
local function GetPlacedEggs()
    local eggs = {}
    for _, egg in ipairs(CollectionService:GetTagged('PetEggServer')) do
        if egg:GetAttribute('EggName') then
            table.insert(eggs, egg)
        end
    end
    return eggs
end

local function GetMaxSlots()
    local data = DataService and DataService:GetData()
    local purchased = data and data.PetsData and data.PetsData.PurchasedEggSlots
        or 0
    return (purchased or 0) + 3
end

local function updateUI()
    local eggs = GetPlacedEggs()
    local maxSlots = GetMaxSlots()
    local lines = {}
    table.insert(lines, ('Slots: %d/%d'):format(#eggs, maxSlots))
    table.insert(lines, '-------------------------')
    for i, egg in ipairs(eggs) do
        local name = egg:GetAttribute('EggName') or egg.Name
        local t = egg:GetAttribute('TimeToHatch') or 0
        local hatchText = (t == 0) and '✅ Ready'
            or (
                TimeHelper and TimeHelper:GenerateColonFormatFromTime(t)
                or tostring(t)
            )
        table.insert(lines, ('[%d] %s | %s'):format(i, name, hatchText))
    end
    local equip, balo, fruits, plants = getExtraStats()
    table.insert(lines, '-------------------------')
    table.insert(lines, ('🐾 Pet equip: %d'):format(equip))
    table.insert(lines, ('🎒 Pet balo: %d'):format(balo))
    table.insert(lines, ('🍎 Fruit balo: %d'):format(fruits))
    table.insert(lines, ('🌱 Cây trong vườn: %d'):format(plants))

    status.Text = '🌟 Farm Status 🌟\n' .. table.concat(lines, '\n')
end

task.spawn(function()
    while task.wait(3) do
        pcall(updateUI)
    end
end)

-- ===============================
-- 📌 Overlay trắng + Nút toggle
-- ===============================
local overlayGui = Instance.new('ScreenGui')
overlayGui.Name = 'FullScreenOverlay'
overlayGui.IgnoreGuiInset = true
overlayGui.ResetOnSpawn = false
overlayGui.DisplayOrder = 50 -- dưới HUD
overlayGui.Parent = game:GetService('CoreGui')

local overlayFrame = Instance.new('Frame')
overlayFrame.Size = UDim2.new(1, 0, 1, 0)
overlayFrame.Position = UDim2.new(0, 0, 0, 0)
overlayFrame.BorderSizePixel = 0
overlayFrame.BackgroundColor3 = Color3.new(1, 1, 1)
overlayFrame.Visible = true -- mặc định luôn bật
overlayFrame.Parent = overlayGui

local toggleButton = Instance.new('TextButton')
toggleButton.Size = UDim2.new(0, 50, 0, 50)
toggleButton.Position = UDim2.new(0, 10, 0.5, -25)
toggleButton.BackgroundColor3 = Color3.new(1, 0, 0)
toggleButton.Text = 'MT'
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.Font = Enum.Font.GothamBold
toggleButton.TextSize = 20
toggleButton.Parent = overlayGui

toggleButton.MouseButton1Click:Connect(function()
    overlayFrame.Visible = not overlayFrame.Visible
end)

getgenv().RunningFarm = true
-- ===============================
-- 🌟 CONFIG CHUNG (bạn chỉnh tại đây)
-- ===============================
getgenv().Config = {
    LoopInterval = 12, -- giây: mỗi vòng lặp tổng

    -- Trồng cây
    Plant_Seeds = { -- target số lượng cây trong farm
        ['Evo Beetroot I'] = 50,
        ['Evo Blueberry I'] = 50,
        ['Evo Pumpkin I'] = 50,
        ['Evo Mushroom I'] = 50,

        ['Evo Beetroot II'] = 50,
        ['Evo Blueberry II'] = 50,
        ['Evo Pumpkin II'] = 50,
        ['Evo Mushroom II'] = 50,

        ['Evo Beetroot III'] = 50,
        ['Evo Blueberry III'] = 50,
        ['Evo Pumpkin III'] = 50,
        ['Evo Mushroom III'] = 50,
        ['Carrot'] = 4,
        ['Turnip'] = 4,
        ['Parsley'] = 4,
        ['Meyer Lemon'] = 4,
        ['Carnival Pumpkin'] = 4,
        ['Kniphofia'] = 4,
        ['Golden Peach'] = 4,
        ['Maple Resin'] = 4,
        ['Moon Blossom'] = 4,
        ['Bone Blossom'] = 4,
        ['Moon Melon'] = 4,
        ['Maple Apple'] = 4,
        ['Moon Mango'] = 4,
        ['Dragon Pepper'] = 4,
        ['Elephant Ears'] = 4,
        ['Fossilight'] = 4,
        ['Princess Thorn'] = 4,
        ['Coconut'] = 4,
        ['Mushroom'] = 4,
        ['Glowthorn'] = 4,
        ['Pepper'] = 4,
        ['Cacao'] = 4,
        ['Apple'] = 4,
        ['Wispwing'] = 4,
        ['Romanesco'] = 4,
        ['Elder Strawberry'] = 4,
        ['Burning Bud'] = 4,
        ['Giant Pinecone'] = 4,
        ['Corn'] = 4,
        ['Sugar Apple'] = 4,
        ['Ember Lily'] = 4,
        ['Dragon Fruit'] = 4,
        ['Sunbulb'] = 4,
        ['Orange Tulip'] = 4,
        ['Mango'] = 4,
        ['Cactus'] = 4,
        ['Beanstalk'] = 4,
        ['Lightshoot'] = 4,
        ['Grape'] = 4,
        ['Daffodil'] = 4,
        ['Aurora Vine'] = 4,
        ['Grand Tomato'] = 4,
        ['Maple Apple'] = 4,
        ['Princess Thorn'] = 4,
        ['Spiked Mango'] = 4,
        ['Pineapple'] = 4,
        ['King Cabbage'] = 4,
        ['Carnival Pumpkin'] = 4,
        ['Kniphofia'] = 4,
        ['Golden Peach'] = 4,
        ['Maple Resin'] = 4,
    },

    -- Vòi phun (đặt theo thứ tự ưu tiên, mặc định đặt ở bên phải)
    Sprinklers = {
        'Basic Sprinkler',
        'Advanced Sprinkler',
        'Master Sprinkler',
        'Godly Sprinkler',
    },

    -- Fruit
    skipFruit = { 'Weed', 'StoneFruit' }, -- bỏ qua tên fruit
    skipMutation = { 'Glimmering', 'Golden' }, -- bỏ qua mutation

    -- Eggs (đặt & nở + ưu tiên khi thiếu pet)
    EggsPlant = {
        { Name = 'Jungle Egg', Amount = 8 },
        { Name = 'Bug Egg', Amount = 2 },
        { Name = 'Fall Egg', Amount = 1 },
    },
    PetNeedsPlant = { -- ví dụ: nếu Rooster < 9 thì ưu tiên Rare Egg
        ['Rooster<1'] = 'Rare Egg',
    },
    AutoHatch = true,
    PlaceDelay = 0.25,
    HatchDelay = 0.25,

    -- Bán pet
    PetNoSell = {
        'Tiger',
        'Red Panda',
        'Griffin',
        'Space Squirrel',
        'Barn Owl',
        'Swan',
        'Wisp',
        ['Shroomie'] = 8,
        'Luminous Sprite',
        'Phoenix',
        'Cockatrice',
        'Apple Gazelle',
        'Lemon Lion',
        'Peach Wasp',
        'Golden Goose',
        'French Fry Ferret',
        'Corrupted Kitsune',
        'Raiju',
        'Koi',
        'Kitsune',
        'Dilophosaurus',
        'Moon Cat',
        'Capybara',
        'Chicken Zombie',
        ['Sunny-Side Chicken'] = 35,
        ['Rooster'] = 10,
        'Spinosaurus',
        ['Brown Mouse'] = 5,
        ['Squirrel'] = 5,
        ['Grey Mouse'] = 5,
        'Bee',
		    'Honey Bee',
		    'Petal Bee',
	    	'Wasp',
	    	'Tarantula Hawk',
        'Bear Bee',
        'T-Rex',
        'Brontosaurus',
        'Disco Bee',
        'Butterfly',
        'Queen Bee',
        'Dragonfly',
        'Raccoon',
        'Fennec Fox',
        'Mimic Octopus',
        'Red Fox',
        'Blood Owl',
        ['Seal'] = 8,
        ['Starfish'] = 8,
    },
    WeightLimit = 5, -- kg

    -- Cho pet ăn
    HungerThreshold = 0, -- dưới ngưỡng này sẽ cho ăn

    -- Equip pet
    PetUpLv = { ['Rooster'] = 5, ['Starfish'] = 2, ['Brown Mouse'] = 2, ['Grey Mouse'] = 2 },
    PetPrioritize = { ['Sunny-Side Chicken'] = 5, ['Tarantula Hawk'] = 2, ['Wasp'] = 2 },
    PetRandom = { ['Rooster'] = 5 },

    -- AutoBuy (chạy 1 pass / vòng)
    AutoBuy = {
        Seeds = {
            ['Carrot'] = 10,
            ['Strawberry'] = 10,
            ['Blueberry'] = 10,
            ['Orange Tulip'] = 10,
            ['Tomato'] = 10,
            ['Corn'] = 10,
            ['Daffodil'] = 10,
            ['Cauliflower'] = 10,
            ['Watermelon'] = 10,
            ['Rafflesia'] = 10,
            ['Green Apple'] = 10,
            ['Avocado'] = 10,
            ['Banana'] = 10,
            ['Pineapple'] = 10,
            ['Kiwi'] = 10,
            ['Bell Pepper'] = 10,
            ['Prickly Pear'] = 10,
            ['Loquat'] = 10,
            ['Feijoa'] = 10,
            ['Pitcher Plant'] = 10,
            ['Pumpkin'] = 10,
            ['Apple'] = 10,
            ['Bamboo'] = 10,
            ['Coconut'] = 10,
            ['Cactus'] = 10,
            ['Dragon Fruit'] = 10,
            ['Mango'] = 10,
            ['Grape'] = 10,
            ['Mushroom'] = 10,
            ['Pepper'] = 10,
            ['Cacao'] = 10,
            ['Beanstalk'] = 10,
            ['Ember Lily'] = 10,
            ['Sugar Apple'] = 10,
            ['Burning Bud'] = 10,
            ['Giant Pinecone'] = 10,
            ['Elder Strawberry'] = 10,
            ['Romanesco'] = 10,
        },
        Gears = {
            'Watering Can',
            'Trading Ticket',
            ['Trowel'] = 200,
            'Basic Sprinkler',
            'Advanced Sprinkler',
            'Godly Sprinkler',
            'Master Sprinkler',
            'Grandmaster Sprinkler',
            'Recall Wrench',
            'Magnifying Glass',
            ['Favorite Tool'] = 100,
            ['Harvest Tool'] = 100,
            ['Friendship Pot'] = 20,
            'Medium Toy',
            'Medium Treat',
            'Cleaning Spray',
            'Cleansing Pet Shard',
            'Levelup Lollipop',
        },
        Eggs = {
			      'Bee Egg',
            ['Common Egg'] = 5,
            ['Uncommon Egg'] = 10,
            'Rare Egg',
            'Legendary Egg',
            'Mythical Egg',
            'Jungle Egg',
            'Bug Egg',
        },
        EventShop = {
            ['Turnip'] = 1,
            ['Fall Seed Pack'] = 1,
            ['Parsley'] = 1,
            ['Meyer Lemon'] = 1,
            ['Carnival Pumpkin'] = 1,
            ['Kniphofia'] = 1,
            ['Golden Peach'] = 1,
            ['Maple Resin'] = 1,

            -- ⚙️ Gear
            ['Firefly Jar'] = 1,
            ['Sky Lantern'] = 1,
            ['Maple Leaf Kite'] = 1,
            ['Leaf Blower'] = 1,
            ['Maple Syrup'] = 1,
            ['Maple Sprinkler'] = 1,
            ['Bonfire'] = 1,
            ['Harvest Basket'] = 1,
            ['Maple Leaf Charm'] = 1,
            ['Golden Acorn'] = 1,
            ['Rake'] = 1,
            ['Acorn Bell'] = 1,
            ['Acorn Lollipop'] = 1,
            ['Super Leaf Blower'] = 1,

            -- 🐾 Pets & Eggs
            ['Fall Egg'] = 1,
            ['Chipmunk'] = 1,
            ['Red Squirrel'] = 1,
            ['Salmon'] = 1,
            ['Marmot'] = 1,
            ['Sugar Glider'] = 1,
            ['Woodpecker'] = 1,
            ['Space Squirrel'] = 1,
            ['Mallard'] = 1,
            ['Red Panda'] = 1,

            -- 📦 Crates & Cosmetics
            ['Fall Crate'] = 1,
            ['Maple Crate'] = 1,
            ['Fall Leaf Chair'] = 1,
            ['Maple Flag'] = 1,
            ['Fall Wreath'] = 1,
            ['Fall Hay Bale'] = 1,
            ['Pile Of Leaves'] = 1,
            ['Flying Kite'] = 1,
            ['Fall Fountain'] = 1,
        },
    },

    -- Phá cây
    MaxPlants = 250,
    BreakList = { 'Carrot' },

    -- Webhook (tùy chọn)
    WebhookUrl = 'https://discord.com/api/webhooks/1408866660017766500/8OgtYYAinAJ9qhpqLxr_jIzUztGg0YqnxzayJql_zAyaYqzoXxUH2OhEoo9DX09HpDOF',
    SendAllPets = false,
    PetFilter = {
        'Tiger',
        'Swan',
        'Phoenix',
        'Golden Goose',
        'French Fry Ferret',
        'Cockatrice',
        'Kitsune',
        'Spinosaurus',
        'T-Rex',
        'Disco Bee',
        'Butterfly',
        'Mimic Octopus',
        'Queen Bee',
        'Fennec Fox',
        'Dragonfly',
        'Raccoon',
        'Red Fox',
    },
}

-- ===============================
-- 🔧 Services & Modules (dùng chung)
-- ===============================
local RS = game:GetService('ReplicatedStorage')
local Players = game:GetService('Players')
local CollectionService = game:GetService('CollectionService')
local HttpService = game:GetService('HttpService')
local player = Players.LocalPlayer

local DEFAULT_SIDE = 'right' -- mặc định bên phải

-- Optional modules (một số game có)
local DataService = nil
pcall(function()
    DataService = require(RS.Modules.DataService)
end)

local ReplicatorClass = nil
pcall(function()
    ReplicatorClass = require(RS.Modules.ReplicationClass)
end)

local PetRegistry = nil
pcall(function()
    PetRegistry = require(RS.Data.PetRegistry)
end)

-- Replicators cho Pets
local ActivePetsService, ActivePetStates, PlayerPetData
if ReplicatorClass then
    ActivePetsService = ReplicatorClass.new('ActivePetsService_Replicator')
    pcall(function()
        ActivePetsService:YieldUntilData()
    end)
    local tbl = ActivePetsService and ActivePetsService:YieldUntilData().Table
        or {}
    ActivePetStates = tbl.ActivePetStates or {}
    PlayerPetData = tbl.PlayerPetData or {}
end

-- GameEvents
local PlantRE = RS.GameEvents:FindFirstChild('Plant_RE')
local SprinklerRE = RS.GameEvents:FindFirstChild('SprinklerService')
local PetEggService = RS.GameEvents:FindFirstChild('PetEggService')
local SellInventoryRE = RS.GameEvents:FindFirstChild('Sell_Inventory')
local RemoveItemRE = RS.GameEvents:FindFirstChild('Remove_Item')
local SellPetRE = RS.GameEvents:FindFirstChild('SellPet_RE')
local ActivePetRE = RS.GameEvents:FindFirstChild('ActivePetService')
local PetsServiceRE = RS.GameEvents:FindFirstChild('PetsService')
local BuySeed = RS.GameEvents:FindFirstChild('BuySeedStock')
local BuyGear = RS.GameEvents:FindFirstChild('BuyGearStock')
local BuyEgg = RS.GameEvents:FindFirstChild('BuyPetEgg')
local BuyEventShop = RS.GameEvents:FindFirstChild('BuyEventShopStock')

-- Crops
local Crops = RS.GameEvents:FindFirstChild('Crops')
local CollectRemote = Crops and Crops:FindFirstChild('Collect')

-- ===============================
-- 🧰 Helpers
-- ===============================
local function waitForData()
    if not DataService then
        return nil
    end
    local data
    repeat
        data = DataService:GetData()
        task.wait(0.2)
    until (not DataService) or (data and (data.PetsData or data.InventoryData))
    return data
end

local function equipOnly(itemName)
    if not player.Character then
        return
    end
    for _, tool in ipairs(player.Character:GetChildren()) do
        if tool:IsA('Tool') and not string.find(tool.Name, itemName) then
            tool.Parent = player.Backpack
            warn('🛑 Unequip:', tool.Name)
        end
    end
    local hasItem = false
    for _, tool in ipairs(player.Character:GetChildren()) do
        if tool:IsA('Tool') and string.find(tool.Name, itemName) then
            hasItem = true
            break
        end
    end
    if not hasItem then
        for _, tool in ipairs(player.Backpack:GetChildren()) do
            if tool:IsA('Tool') and string.find(tool.Name, itemName) then
                tool.Parent = player.Character
                print('📦 Auto equip:', tool.Name)
                break
            end
        end
    end
end

local function getMyFarm()
    for _, farm in ipairs(workspace:GetChildren()) do
        if farm.Name == 'Farm' then
            for _, subFarm in ipairs(farm:GetChildren()) do
                if
                    subFarm.Name == 'Farm'
                    and subFarm:FindFirstChild('Important')
                    and subFarm.Important:FindFirstChild('Data')
                    and subFarm.Important.Data:FindFirstChild('Owner')
                    and subFarm.Important.Data.Owner.Value == player.Name
                then
                    return subFarm
                end
            end
        end
    end
    return nil
end

local function getPlots(myFarm, side)
    local spots = {}
    if not myFarm then
        return spots
    end
    local pl = myFarm.Important:FindFirstChild('Plant_Locations')
    if not pl then
        return spots
    end
    for _, node in ipairs(pl:GetChildren()) do
        if node:IsA('BasePart') then
            local s = (node:GetAttribute('Side') or ''):lower()
            if s == (side or DEFAULT_SIDE):lower() then
                table.insert(spots, node)
            end
        end
    end
    return spots
end

local function getMiddlePlot(spots)
    if #spots == 0 then
        return nil
    end
    table.sort(spots, function(a, b)
        return a.Position.Z < b.Position.Z
    end)
    local midIndex = math.ceil(#spots / 2)
    return spots[midIndex]
end

-- ===============================
-- 🌱 TRỒNG CÂY (from trồng cây tele) - single pass
-- ===============================
local function hasSeed(seedName)
    for _, tool in ipairs(player.Backpack:GetChildren()) do
        if tool:IsA('Tool') and string.find(tool.Name, seedName .. ' Seed') then
            return true
        end
    end
    for _, tool in ipairs(player.Character:GetChildren()) do
        if tool:IsA('Tool') and string.find(tool.Name, seedName .. ' Seed') then
            return true
        end
    end
    return false
end

local function countPlants(myFarm, itemName)
    if not myFarm then
        return 0
    end
    local folder = myFarm.Important:FindFirstChild('Plants_Physical')
    if not folder then
        return 0
    end
    local count = 0
    for _, plant in ipairs(folder:GetChildren()) do
        if plant.Name == itemName then
            count += 1
        end
    end
    return count
end

local function getCenterBetweenSides(myFarm)
    if not myFarm then
        return nil
    end
    local pl = myFarm.Important:FindFirstChild('Plant_Locations')
    if not pl then
        return nil
    end
    local left, right
    for _, node in ipairs(pl:GetChildren()) do
        if node:IsA('BasePart') then
            local sideAttr = (node:GetAttribute('Side') or ''):lower()
            if sideAttr == 'left' and not left then
                left = node
            elseif sideAttr == 'right' and not right then
                right = node
            end
        end
    end
    if left and right then
        local centerPos = (left.Position + right.Position) / 2
        return CFrame.new(centerPos + Vector3.new(0, 3, 0))
    end
    return nil
end

local function teleportToCenter(myFarm)
    local hrp = player.Character
        and player.Character:FindFirstChild('HumanoidRootPart')
    local cf = getCenterBetweenSides(myFarm)
    if hrp and cf then
        hrp.CFrame = cf
        print('🚀 Teleport về giữa farm (trái-phải)')
    end
end

local function plantSeedAt(pos, seedName)
    if not PlantRE then
        return
    end
    equipOnly(seedName .. ' Seed')
    PlantRE:FireServer(pos, seedName)
    print(
        ('✅ Trồng %s tại (%.1f, %.1f, %.1f)'):format(
            seedName,
            pos.X,
            pos.Y,
            pos.Z
        )
    )
end

function DoPlanting()
    local myFarm = getMyFarm()
    if not myFarm then
        warn('❌ Không tìm thấy farm của bạn!')
        return
    end

    local plots = getPlots(myFarm, DEFAULT_SIDE)
    local midPlot = getMiddlePlot(plots)
    if not midPlot then
        warn('❌ Không tìm thấy plot ở bên ' .. DEFAULT_SIDE)
        return
    end

    for seedName, target in pairs(getgenv().Config.Plant_Seeds) do
        local current = countPlants(myFarm, seedName)
        print(('🔎 %s hiện có %d/%d'):format(seedName, current, target))
        if current < target then
            if not hasSeed(seedName) then
                warn(
                    '⏭️ Bỏ qua '
                        .. seedName
                        .. ' (không có seed trong balo)'
                )
            else
                local need = target - current
                print(
                    ('⚠️ Thiếu %d %s → bắt đầu trồng thêm'):format(
                        need,
                        seedName
                    )
                )
                for i = 1, need do
                    teleportToCenter(myFarm)
                    task.wait(1)
                    plantSeedAt(midPlot.Position, seedName)
                    task.wait(1)
                end
            end
        else
            print(
                ('✅ Đủ số lượng cây %s (%d/%d)'):format(
                    seedName,
                    current,
                    target
                )
            )
        end
    end
end

-- ===============================
-- 🚰 SPRINKLERS (from ĐẶT VÒI PHUN) - single pass
-- ===============================
local function hasSprinkler(myFarm, sprName)
    if not myFarm then
        return false
    end
    local folder = myFarm.Important:FindFirstChild('Objects_Physical')
    if not folder then
        return false
    end
    for _, obj in ipairs(folder:GetChildren()) do
        if obj.Name == sprName then
            return true
        end
    end
    return false
end

local function placeSprinklerAt(pos, sprName)
    if not SprinklerRE then
        return
    end
    equipOnly(sprName)
    local cf = CFrame.new(pos)
    SprinklerRE:FireServer('Create', cf)
    print(
        ('✅ Đã đặt %s tại (%.1f, %.1f, %.1f)'):format(
            sprName,
            pos.X,
            pos.Y,
            pos.Z
        )
    )
end

function DoSprinklers()
    local myFarm = getMyFarm()
    if not myFarm then
        warn('❌ Không tìm thấy farm của bạn!')
        return
    end

    local plots = getPlots(myFarm, DEFAULT_SIDE)
    local midPlot = getMiddlePlot(plots)
    if not midPlot then
        warn('❌ Không tìm thấy plot ở bên ' .. DEFAULT_SIDE)
        return
    end

    for _, sprName in ipairs(getgenv().Config.Sprinklers) do
        if hasSprinkler(myFarm, sprName) then
            print('✅ Đã có ' .. sprName .. ', bỏ qua.')
        else
            placeSprinklerAt(midPlot.Position, sprName)
            task.wait(0.8)
        end
    end
end

-- ===============================
-- 🌾 HARVEST FRUITS (from thu hoach trai bằng model) - single pass
-- ===============================
local YIELD_LIMIT = 100
local HARVEST_DELAY = 0.5

local function shouldSkipFruitModel(fruit)
    for _, bad in ipairs(getgenv().Config.skipFruit or {}) do
        if fruit.Name == bad then
            return true
        end
    end
    for _, badAttr in ipairs(getgenv().Config.skipMutation or {}) do
        if fruit:GetAttribute(badAttr) then
            return true
        end
    end
    return false
end

function DoHarvest()
    if not CollectRemote then
        return
    end
    local myFarm = getMyFarm()
    if not myFarm then
        warn('❌ Không tìm thấy farm của bạn!')
        return
    end

    local plantsFolder = myFarm.Important:FindFirstChild('Plants_Physical')
    if not plantsFolder then
        return
    end

    local collected = 0
    for _, plant in ipairs(plantsFolder:GetChildren()) do
        local fruitsFolder = plant:FindFirstChild('Fruits')
        if fruitsFolder then
            for _, fruit in ipairs(fruitsFolder:GetChildren()) do
                if not shouldSkipFruitModel(fruit) then
                    CollectRemote:FireServer({ fruit })
                    print('✅ Thu hoạch:', fruit:GetFullName())
                    collected += 1
                    task.wait(HARVEST_DELAY)
                    if collected >= YIELD_LIMIT then
                        return
                    end
                else
                    print('⏭️ Bỏ qua:', fruit:GetFullName())
                end
            end
        end
    end
end

-- ===============================
-- 🧺 SELL FRUITS (from sell cây) - single pass
-- ===============================
local SELL_NPC_CFRAME = CFrame.new(86.59, 2.999, 0.42)

function DoSellFruits()
    if not SellInventoryRE then
        return
    end
    local hrp = player.Character
        and player.Character:FindFirstChild('HumanoidRootPart')
    if not hrp then
        return
    end
    hrp.CFrame = SELL_NPC_CFRAME
    task.wait(0.6)
    SellInventoryRE:FireServer()
    print('✅ Đã bán toàn bộ fruit trong Backpack')
end

-- ===============================
-- 🥚 EGGS PLACE + HATCH (from dat trung 4) - single pass
-- ===============================
local MAX_EGGS = 8
local Y_OFFSET = 2.0
local CHECK_RAD = 3.5

local function GetMaxSlots()
    local data = waitForData()
    local val = data and data.PetsData and data.PetsData.PurchasedEggSlots or 0
    return (val or 0) + 3
end

local function GetPlacedEggs()
    local eggs = {}
    for _, egg in ipairs(CollectionService:GetTagged('PetEggServer')) do
        if egg:GetAttribute('EggName') then
            table.insert(eggs, egg)
        end
    end
    return eggs
end

local function countEggsByName(eggName)
    local count = 0
    for _, egg in ipairs(GetPlacedEggs()) do
        if egg:GetAttribute('EggName') == eggName then
            count += 1
        end
    end
    return count
end

local function equipEggTool(eggName)
    equipOnly(eggName)
    for _, tool in
        ipairs(player.Character and player.Character:GetChildren() or {})
    do
        if tool:IsA('Tool') and string.find(tool.Name, eggName) then
            return tool
        end
    end
    for _, tool in ipairs(player.Backpack:GetChildren()) do
        if tool:IsA('Tool') and string.find(tool.Name, eggName) then
            tool.Parent = player.Character
            return tool
        end
    end
    return nil
end

local function hasEggNearby(pos, radius)
    radius = radius or CHECK_RAD
    local parts = workspace:GetPartBoundsInBox(
        CFrame.new(pos),
        Vector3.new(radius * 2, radius * 2, radius * 2)
    )
    for _, p in ipairs(parts) do
        local name = (p.Name or ''):lower()
        if name:find('egg') or name:find('trung') then
            return true
        end
    end
    return false
end

local function GetCanPlantNode(myFarm)
    if not myFarm then
        return nil
    end
    local pl = myFarm.Important:FindFirstChild('Plant_Locations')
    if not pl then
        return nil
    end
    for _, node in ipairs(pl:GetChildren()) do
        if node.Name == 'Can_Plant' then
            local sideAttr = node:GetAttribute('Side')
            if sideAttr and sideAttr:lower() == 'left' then
                return node
            end
        end
    end
    return nil
end

local function GetCandidatePositions(maxNeeded)
    maxNeeded = math.max(0, math.min(MAX_EGGS, maxNeeded or MAX_EGGS))
    local myFarm = getMyFarm()
    if not myFarm then
        return {}
    end
    local canPlant = GetCanPlantNode(myFarm)
    if not canPlant then
        return {}
    end

    local spots = {}
    if canPlant:IsA('BasePart') then
        local size, cf = canPlant.Size, canPlant.CFrame
        local rows, cols = 2, 4
        if size.Z > size.X then
            rows, cols = 4, 2
        end
        local cellX, cellZ = size.X / cols, size.Z / rows
        for r = 1, rows do
            for c = 1, cols do
                local lx = (c - 0.5 - cols / 2) * cellX
                local lz = (r - 0.5 - rows / 2) * cellZ
                local pos = (cf * CFrame.new(lx, 0, lz)).p
                    + Vector3.new(0, Y_OFFSET, 0)
                local safeRad = math.min(cellX, cellZ) * 0.45
                if not hasEggNearby(pos, safeRad) then
                    table.insert(spots, pos)
                    if #spots >= maxNeeded then
                        return spots
                    end
                end
            end
        end
    end
    return spots
end

local function countEquippedPets(petName)
    if not PlayerPetData then
        return 0
    end
    local myPetData = PlayerPetData[player.Name]
    local activePets = (ActivePetStates and ActivePetStates[player.Name]) or {}
    local total = 0
    if not myPetData then
        return 0
    end
    for uuid, _ in pairs(activePets) do
        local petData = myPetData.PetInventory.Data[uuid]
        if petData and petData.PetType == petName then
            total += 1
        end
    end
    return total
end

local function countBackpackPets(petName)
    if not PlayerPetData then
        return 0
    end
    local myPetData = PlayerPetData[player.Name]
    if not myPetData then
        return 0
    end
    local activePets = (ActivePetStates and ActivePetStates[player.Name]) or {}
    local total = 0
    for uuid, petData in pairs(myPetData.PetInventory.Data or {}) do
        if petData.PetType == petName and not activePets[uuid] then
            total += 1
        end
    end
    return total
end

local function countPets(petName)
    return countEquippedPets(petName) + countBackpackPets(petName)
end

local function getPriorityEggs()
    local needEggs = {}
    for condition, eggName in pairs(getgenv().Config.PetNeedsPlant or {}) do
        local petName, limit = condition:match('(.+)<(%d+)')
        limit = tonumber(limit)
        if petName and limit then
            local current = countPets(petName)
            print(('🔎 Check %s: %d/%d'):format(petName, current, limit))
            if current < limit then
                print(
                    ("⚠️ Thiếu %d %s → cần '%s'"):format(
                        limit - current,
                        petName,
                        eggName
                    )
                )
                table.insert(
                    needEggs,
                    { Egg = eggName, Missing = limit - current }
                )
            else
                print(
                    ('✅ %s đủ số lượng (%d/%d)'):format(
                        petName,
                        current,
                        limit
                    )
                )
            end
        end
    end
    return needEggs
end

local function ensureEggCount(eggName, targetAmount)
    if not PetEggService then
        return false
    end
    local current = countEggsByName(eggName)
    if current >= targetAmount then
        print(
            ("✅ '%s' đã đủ %d/%d egg"):format(
                eggName,
                current,
                targetAmount
            )
        )
        return true
    end
    local need = targetAmount - current
    local remaining = math.max(0, GetMaxSlots() - #GetPlacedEggs())
    if remaining <= 0 then
        print('🚫 Không còn slot trống để đặt egg')
        return false
    end
    local toPlace = math.min(need, remaining)
    if not equipEggTool(eggName) then
        print("❌ Không tìm thấy tool cho '" .. eggName .. "'")
        return false
    end
    local spots = GetCandidatePositions(toPlace)
    if #spots == 0 then
        print(
            "⚠️ Không có vị trí hợp lệ để đặt '"
                .. eggName
                .. "'"
        )
        return false
    end
    for i = 1, math.min(toPlace, #spots) do
        PetEggService:FireServer('CreateEgg', spots[i])
        print(("🥚 Đã đặt '%s' tại vị trí #%d"):format(eggName, i))
        task.wait(getgenv().Config.PlaceDelay or 0.20)
    end
    return true
end

local function ensureEggsFallback()
    for _, eggInfo in ipairs(getgenv().Config.EggsPlant or {}) do
        local eggName, amount = eggInfo.Name, eggInfo.Amount
        local ok = ensureEggCount(eggName, amount)
        if not ok then
            print(
                "❌ Không đặt được '"
                    .. eggName
                    .. "', thử egg tiếp theo..."
            )
        end
    end
end

local function ensureEggsWithPriority()
    local priority = getPriorityEggs()
    if #priority > 0 then
        print('👉 Case 1: Thiếu pet → Ưu tiên PetNeedsPlant')
        local placedAny = false
        for _, info in ipairs(priority) do
            local slotsLeft = math.max(0, GetMaxSlots() - #GetPlacedEggs())
            if slotsLeft <= 0 then
                break
            end
            if equipEggTool(info.Egg) then
                print(
                    ("📦 Dùng toàn bộ %d slot còn lại cho '%s'"):format(
                        slotsLeft,
                        info.Egg
                    )
                )
                if
                    ensureEggCount(
                        info.Egg,
                        countEggsByName(info.Egg) + slotsLeft
                    )
                then
                    placedAny = true
                end
                break -- ưu tiên tuyệt đối
            else
                print(
                    ("❌ Không có tool cho '%s' → bỏ qua"):format(
                        info.Egg
                    )
                )
            end
        end
        if not placedAny then
            print(
                '👉 Case 2: Không có trứng PetNeedsPlant khả dụng → fallback EggsPlant'
            )
            ensureEggsFallback()
        end
    else
        print('👉 Case 3: Pet đủ → fallback EggsPlant')
        ensureEggsFallback()
    end
end

local function sendWebhookAsync(playerName, petName, rarity, imageUrl)
    if
        not (getgenv().Config.WebhookUrl and getgenv().Config.WebhookUrl ~= '')
    then
        return
    end
    task.spawn(function()
        local embed = {
            ['title'] = '🎉 Pet mới vừa xuất hiện!',
            ['color'] = 65280,
            ['fields'] = {
                {
                    ['name'] = '👤 Người chơi',
                    ['value'] = playerName,
                    ['inline'] = true,
                },
                {
                    ['name'] = '🐾 Pet',
                    ['value'] = petName,
                    ['inline'] = true,
                },
                {
                    ['name'] = '🌟 Rarity',
                    ['value'] = rarity,
                    ['inline'] = true,
                },
            },
            ['thumbnail'] = { ['url'] = imageUrl or '' },
        }
        local payload = HttpService:JSONEncode({ embeds = { embed } })
        pcall(function()
            request({
                Url = getgenv().Config.WebhookUrl,
                Method = 'POST',
                Headers = { ['Content-Type'] = 'application/json' },
                Body = payload,
            })
        end)
    end)
end

local function hatchReadyEggs()
    if not PetEggService then
        return
    end
    for _, egg in ipairs(GetPlacedEggs()) do
        local ready, t =
            egg:GetAttribute('Ready'), egg:GetAttribute('TimeToHatch') or 0
        if ready == true or (t and t <= 0) then
            local eggName = egg:GetAttribute('EggName') or egg.Name
            PetEggService:FireServer('HatchPet', egg)
            print("🐣 Egg '" .. eggName .. "' đã nở!")

            if PetRegistry then
                if
                    getgenv().Config.SendAllPets
                    or table.find(getgenv().Config.PetFilter or {}, eggName)
                then
                    local petInfo = PetRegistry.PetList[eggName]
                    if petInfo then
                        local rarity = petInfo.Rarity or 'Unknown'
                        local icon = petInfo.Icon or ''
                        local imageUrl = ''
                        if icon ~= '' then
                            imageUrl = 'https://www.roblox.com/asset-thumbnail/image?assetId='
                                .. tostring(icon):gsub('rbxassetid://', '')
                                .. '&width=420&height=420&format=png'
                        end
                        sendWebhookAsync(player.Name, eggName, rarity, imageUrl)
                    end
                end
            end

            task.wait(getgenv().Config.HatchDelay or 0.25)
        end
    end
end

function DoEggs()
    ensureEggsWithPriority()
    if getgenv().Config.AutoHatch then
        hatchReadyEggs()
    end
end

-- ===============================
-- 🐾 SELL PETS (from sell pet) - single pass
-- ===============================
local function equipOnlyToolUUID(uuid)
    if not player.Character then
        return
    end
    for _, tool in ipairs(player.Character:GetChildren()) do
        if tool:IsA('Tool') and tool:GetAttribute('PET_UUID') ~= uuid then
            tool.Parent = player.Backpack
            warn('🛑 Unequip:', tool.Name)
        end
    end
    for _, tool in ipairs(player.Backpack:GetChildren()) do
        if tool:IsA('Tool') and tool:GetAttribute('PET_UUID') == uuid then
            tool.Parent = player.Character
            print('📦 Auto equip Pet Tool:', tool.Name)
            return tool
        end
    end
    for _, tool in ipairs(player.Character:GetChildren()) do
        if tool:IsA('Tool') and tool:GetAttribute('PET_UUID') == uuid then
            return tool
        end
    end
    return nil
end

local function GetKeepLimit(petName)
    local tbl = getgenv().Config.PetNoSell or {}
    local v = tbl[petName]
    if type(v) == 'number' then
        return v
    end
    if table.find(tbl, petName) then
        return math.huge
    end
    return 0
end

local function CountPets(inventory)
    local counts = {}
    for _, pet in pairs(inventory) do
        counts[pet.PetType] = (counts[pet.PetType] or 0) + 1
    end
    return counts
end

local function SellPet(uuid, petName, level, weight)
    if not SellPetRE then
        return false
    end
    local tool = equipOnlyToolUUID(uuid)
    if tool then
        print(
            ('💡 Bán %s | Lv.%d | %.1fkg'):format(
                petName,
                level or 1,
                weight or 0
            )
        )
        local hrp = player.Character
            and player.Character:FindFirstChild('HumanoidRootPart')
        if hrp then
            hrp.CFrame = SELL_NPC_CFRAME
        end
        task.wait(0.2)
        SellPetRE:FireServer(tool)
        return true
    end
end

function DoSellPets()
    if not DataService then
        return
    end
    local data = DataService:GetData()
    local pets = data and data.PetsData and data.PetsData.PetInventory.Data
    if not pets then
        return
    end

    local PetUtilities = nil
    pcall(function()
        PetUtilities = require(RS.Modules.PetServices.PetUtilities)
    end)

    local counts = CountPets(pets)
    for uuid, pet in pairs(pets) do
        local name, pdata = pet.PetType, pet.PetData
        local level = pdata and pdata.Level or 1
        local weight = PetUtilities
                and PetUtilities:CalculateWeight(
                    pdata and pdata.BaseWeight or 1,
                    level
                )
            or 1

        local keepLimit = GetKeepLimit(name)
        local currentCount = counts[name] or 0
        local shouldSell = false

        if keepLimit == 0 then
            shouldSell = (weight < getgenv().Config.WeightLimit)
        elseif currentCount > keepLimit then
            shouldSell = true
            counts[name] = (counts[name] or 1) - 1
        end

        if shouldSell then
            if SellPet(uuid, name, level, weight) then
                task.wait(1.0)
            end
        end
    end
end

-- ===============================
-- 🍽️ FEED PETS (from cho pet ăn) - single pass
-- ===============================
local function getCurrentFoodType()
    for _, tool in
        ipairs(player.Character and player.Character:GetChildren() or {})
    do
        if tool:IsA('Tool') then
            local b = tool:GetAttribute('b')
            if b == 'j' then
                return 'Fruit', tool
            elseif b == 'u' then
                return 'PetFood', tool
            end
        end
    end
    return nil, nil
end

local function equipOnlyFood(foodType)
    if not player.Character then
        return
    end
    local targetAttr = (foodType == 'Fruit' and 'j')
        or (foodType == 'PetFood' and 'u')
    for _, tool in ipairs(player.Character:GetChildren()) do
        if tool:IsA('Tool') then
            local b = tool:GetAttribute('b')
            if b ~= targetAttr then
                tool.Parent = player.Backpack
                warn('🛑 Unequip:', tool.Name)
            end
        end
    end
    local hasItem = false
    for _, tool in ipairs(player.Character:GetChildren()) do
        if tool:IsA('Tool') and tool:GetAttribute('b') == targetAttr then
            hasItem = true
            break
        end
    end
    if not hasItem then
        for _, tool in ipairs(player.Backpack:GetChildren()) do
            if tool:IsA('Tool') and tool:GetAttribute('b') == targetAttr then
                tool.Parent = player.Character
                print('🍽️ Auto equip:', tool.Name, '| Loại:', foodType)
                return tool
            end
        end
    end
end

local function equipRandomFood()
    local t = getCurrentFoodType()
    if t then
        return
    end
    local pick = math.random(1, 2) == 1 and 'Fruit' or 'PetFood'
    return equipOnlyFood(pick)
end

local function GetEquippedPets()
    if not ActivePetStates or not PlayerPetData then
        return {}
    end
    local playerName = player.Name
    local myPetData = PlayerPetData[playerName]
    local activePets = ActivePetStates[playerName] or {}
    if not myPetData then
        return {}
    end

    local equippedPets = {}
    for uuid, _ in pairs(activePets) do
        local petData = myPetData.PetInventory.Data[uuid]
        if petData then
            table.insert(equippedPets, {
                UUID = uuid,
                PetType = petData.PetType,
                Level = petData.PetData and petData.PetData.Level or 'N/A',
                Hunger = petData.PetData and petData.PetData.Hunger or 'N/A',
            })
        end
    end
    return equippedPets
end

function DoFeedPets()
    if not ActivePetRE then
        return
    end
    local pets = GetEquippedPets()
    local hungry = {}
    for _, pet in ipairs(pets) do
        if
            type(pet.Hunger) == 'number'
            and pet.Hunger < (getgenv().Config.HungerThreshold or 20)
        then
            table.insert(hungry, pet)
        end
    end
    if #hungry > 0 then
        local _ = equipRandomFood()
        for _, pet in ipairs(hungry) do
            print(
                '⚠️ Pet đói:',
                pet.UUID,
                pet.PetType,
                '| Hunger:',
                pet.Hunger
            )
            ActivePetRE:FireServer('Feed', pet.UUID)
        end
    else
        local currentType, tool = getCurrentFoodType()
        if tool then
            tool.Parent = player.Backpack
            print('✅ Không có pet đói, đã cất:', tool.Name)
        end
    end
end

-- ===============================
-- 🧩 EQUIP PETS (from trang bị pet phiên bản hoàn chỉnh) - single pass
-- ===============================
local function getPetUUIDByType(petType)
    local backpack = player:FindFirstChild('Backpack')
    if not backpack then
        return nil
    end
    for _, tool in ipairs(backpack:GetChildren()) do
        local uuid = tool:GetAttribute('PET_UUID')
        if uuid and tool.Name:lower():find(petType:lower()) then
            return uuid
        end
    end
    return nil
end

local function GetActivePets()
    if not ReplicatorClass then
        return {}
    end
    local pets = {}
    local ok, dataObj = pcall(function()
        return ReplicatorClass.new('ActivePetsService_Replicator')
            :YieldUntilData().Table
    end)
    if not ok or not dataObj then
        return {}
    end
    local activeStates = dataObj.ActivePetStates
    local playerData = dataObj.PlayerPetData
    for pid, states in pairs(activeStates) do
        local pdata = playerData[pid] or playerData[tonumber(pid)]
        if pdata then
            for uuid, _ in pairs(states) do
                local pinfo = pdata.PetInventory.Data[uuid]
                if pinfo then
                    table.insert(pets, { UUID = uuid, PetType = pinfo.PetType })
                end
            end
        end
    end
    return pets
end

local function ForceEquip(petType, target, counts, numEquipped, maxSlots, label)
    local current = counts[petType] or 0
    while current < target and numEquipped < maxSlots do
        local uuid = getPetUUIDByType(petType)
        if not uuid then
            warn('⚠️ Không tìm thấy trong backpack:', petType)
            break
        end
        if PetsServiceRE then
            PetsServiceRE:FireServer('EquipPet', uuid, CFrame.new(40, 0, -74))
        end
        current += 1
        numEquipped += 1
        counts[petType] = current
        print('✅ Equip', label, petType, '(', current, '/', target, ')')
        task.wait(0.2)
    end
    return current, numEquipped
end

local function inUpLv(t)
    return (getgenv().Config.PetUpLv or {})[t] ~= nil
end
local function inPrioritize(t)
    return (getgenv().Config.PetPrioritize or {})[t] ~= nil
end
local function inRandom(t)
    return (getgenv().Config.PetRandom or {})[t] ~= nil
end

local function CategorizeEquipped(equipped)
    local listRandom, listPrior, listOthers = {}, {}, {}
    for _, pet in ipairs(equipped) do
        local t = pet.PetType
        if inRandom(t) then
            table.insert(listRandom, pet)
        elseif inPrioritize(t) then
            table.insert(listPrior, pet)
        elseif not inUpLv(t) then
            table.insert(listOthers, pet)
        end
    end
    return listRandom, listPrior, listOthers
end

local function UnequipLast(list, counts)
    local idx = #list
    if idx == 0 then
        return false
    end
    local pet = list[idx]
    if PetsServiceRE then
        PetsServiceRE:FireServer('UnequipPet', pet.UUID)
    end
    counts[pet.PetType] = (counts[pet.PetType] or 1) - 1
    table.remove(list, idx)
    print('❌ Unequip', pet.PetType, pet.UUID)
    task.wait(0.15)
    return true
end

local function MakeRoom(needSlots, listA, listB, counts, numEquipped)
    local freed = 0
    while freed < needSlots do
        local ok = false
        if listA and #listA > 0 then
            ok = UnequipLast(listA, counts)
        elseif listB and #listB > 0 then
            ok = UnequipLast(listB, counts)
        else
            break
        end
        if ok then
            freed += 1
            numEquipped -= 1
        end
    end
    return freed, numEquipped
end

function DoEquipPets()
    if not DataService then
        return
    end
    local equipped = GetActivePets()
    local counts, numEquipped = {}, 0
    for _, pet in ipairs(equipped) do
        counts[pet.PetType] = (counts[pet.PetType] or 0) + 1
        numEquipped += 1
    end

    local pdata = DataService:GetData()
    local maxSlots = pdata
            and pdata.PetsData
            and pdata.PetsData.MutableStats
            and pdata.PetsData.MutableStats.MaxEquippedPets
        or 5
    print('📊 Slot:', numEquipped .. '/' .. maxSlots)

    local listRandom, listPrior, listOthers = CategorizeEquipped(equipped)
    while #listOthers > 0 do
        UnequipLast(listOthers, counts)
        numEquipped -= 1
    end

    local function freeSlots()
        return math.max(0, maxSlots - numEquipped)
    end

    if maxSlots < 8 then
        local needUp = 0
        for petType, target in pairs(getgenv().Config.PetUpLv or {}) do
            local cur = counts[petType] or 0
            if target > cur then
                needUp += (target - cur)
            end
        end
        if needUp > freeSlots() then
            local toFree = needUp - freeSlots()
            local freed
            freed, numEquipped =
                MakeRoom(toFree, listRandom, listPrior, counts, numEquipped)
            if freed < toFree then
                warn(
                    '⚠️ Không đủ slot để đảm bảo PetUpLv tối thiểu.'
                )
            end
        end
        for petType, target in pairs(getgenv().Config.PetUpLv or {}) do
            counts[petType], numEquipped = ForceEquip(
                petType,
                target,
                counts,
                numEquipped,
                maxSlots,
                'PetUpLv'
            )
        end
    end

    do
        local needPrior = 0
        for petType, target in pairs(getgenv().Config.PetPrioritize or {}) do
            local cur = counts[petType] or 0
            if target > cur then
                needPrior += (target - cur)
            end
        end
        if needPrior > 0 and needPrior > freeSlots() then
            local toFree = needPrior - freeSlots()
            local freed
            freed, numEquipped =
                MakeRoom(toFree, listRandom, nil, counts, numEquipped)
            if freed < toFree then
                warn(
                    '⚠️ Không đủ slot để đảm bảo PetPrioritize theo cấu hình.'
                )
            end
        end
        for petType, target in pairs(getgenv().Config.PetPrioritize or {}) do
            counts[petType], numEquipped = ForceEquip(
                petType,
                target,
                counts,
                numEquipped,
                maxSlots,
                'PetPrioritize'
            )
        end
    end

    for petType, target in pairs(getgenv().Config.PetRandom or {}) do
        local current = counts[petType] or 0
        while current < target and numEquipped < maxSlots do
            local uuid = getPetUUIDByType(petType)
            if not uuid then
                warn('⚠️ Không tìm thấy trong backpack:', petType)
                break
            end
            if PetsServiceRE then
                PetsServiceRE:FireServer(
                    'EquipPet',
                    uuid,
                    CFrame.new(40, 0, -74)
                )
            end
            current += 1
            numEquipped += 1
            counts[petType] = current
            print(
                '✅ Equip PetRandom',
                petType,
                '(',
                current,
                '/',
                target,
                ')'
            )
            task.wait(0.15)
        end
    end
end

-- ===============================
-- 🛒 AUTO BUY (from mua đồ all) - single pass
-- ===============================
local ShopIndexMap = {
    ['Turnip'] = 1,
    ['Fall Seed Pack'] = 1,
    ['Parsley'] = 1,
    ['Meyer Lemon'] = 1,
    ['Carnival Pumpkin'] = 1,
    ['Kniphofia'] = 1,
    ['Golden Peach'] = 1,
    ['Maple Resin'] = 1,

    ['Firefly Jar'] = 2,
    ['Sky Lantern'] = 2,
    ['Maple Leaf Kite'] = 2,
    ['Leaf Blower'] = 2,
    ['Maple Syrup'] = 2,
    ['Maple Sprinkler'] = 2,
    ['Bonfire'] = 2,
    ['Harvest Basket'] = 2,
    ['Maple Leaf Charm'] = 2,
    ['Golden Acorn'] = 2,
    ['Rake'] = 2,
    ['Acorn Bell'] = 2,
    ['Acorn Lollipop'] = 2,
    ['Super Leaf Blower'] = 2,

    ['Fall Egg'] = 3,
    ['Chipmunk'] = 3,
    ['Red Squirrel'] = 3,
    ['Salmon'] = 3,
    ['Marmot'] = 3,
    ['Sugar Glider'] = 3,
    ['Woodpecker'] = 3,
    ['Space Squirrel'] = 3,
    ['Mallard'] = 3,
    ['Red Panda'] = 3,

    ['Fall Crate'] = 4,
    ['Maple Crate'] = 4,
    ['Fall Leaf Chair'] = 4,
    ['Maple Flag'] = 4,
    ['Fall Wreath'] = 4,
    ['Fall Hay Bale'] = 4,
    ['Pile Of Leaves'] = 4,
    ['Flying Kite'] = 4,
    ['Fall Fountain'] = 4,
}

local function countInBackpack(itemName)
    local function getCount(tool)
        local attrs = tool:GetAttributes()
        if attrs.Quantity then
            return attrs.Quantity
        end
        if attrs.Uses then
            return attrs.Uses
        end
        if attrs.e then
            return attrs.e
        end
        return 1
    end
    local count = 0
    for _, obj in ipairs(player.Backpack:GetChildren()) do
        if string.find(obj.Name, itemName) then
            count += getCount(obj)
        end
    end
    for _, obj in
        ipairs(player.Character and player.Character:GetChildren() or {})
    do
        if string.find(obj.Name, itemName) then
            count += getCount(obj)
        end
    end
    return count
end

local function buySeed(itemName, target)
    if not BuySeed then
        return
    end
    local current = countInBackpack(itemName)
    if type(target) == 'number' and current >= target then
        print(('✅ Seed %s đủ (%d/%d)'):format(itemName, current, target))
        return
    end
    BuySeed:FireServer('Tier 1', itemName)
    print(
        ('🌱 Mua Seed %s | Hiện có %d/%s'):format(
            itemName,
            current,
            target or '∞'
        )
    )
end

local function buyGear(itemName, target)
    if not BuyGear then
        return
    end
    local current = countInBackpack(itemName)
    if type(target) == 'number' and current >= target then
        print(('✅ Gear %s đủ (%d/%d)'):format(itemName, current, target))
        return
    end
    BuyGear:FireServer(itemName)
    print(
        ('🛠️ Mua Gear %s | Hiện có %d/%s'):format(
            itemName,
            current,
            target or '∞'
        )
    )
end

local function buyEgg(itemName, target)
    if not BuyEgg then
        return
    end
    local current = countInBackpack(itemName)
    if type(target) == 'number' and current >= target then
        print(('✅ Egg %s đủ (%d/%d)'):format(itemName, current, target))
        return
    end
    BuyEgg:FireServer(itemName)
    print(
        ('🥚 Mua Egg %s | Hiện có %d/%s'):format(
            itemName,
            current,
            target or '∞'
        )
    )
end

local function buyEventItem(itemName, target, shopIndex)
    if not BuyEventShop then
        return
    end
    local current = countInBackpack(itemName)
    if type(target) == 'number' and current >= target then
        print(('✅ Event %s đủ (%d/%d)'):format(itemName, current, target))
        return
    end
    BuyEventShop:FireServer(itemName, shopIndex)
    print(
        ('🍁 Mua Event %s | Hiện có %d/%s'):format(
            itemName,
            current,
            target or '∞'
        )
    )
end

function DoAutoBuy()
    local cfg = getgenv().Config.AutoBuy or {}
    for key, val in pairs(cfg.Seeds or {}) do
        if type(key) == 'string' then
            buySeed(key, val)
        elseif type(val) == 'string' then
            buySeed(val, nil)
        end
    end
    for key, val in pairs(cfg.Gears or {}) do
        if type(key) == 'string' then
            buyGear(key, val)
        elseif type(val) == 'string' then
            buyGear(val, nil)
        end
    end
    for key, val in pairs(cfg.Eggs or {}) do
        if type(key) == 'string' then
            buyEgg(key, val)
        elseif type(val) == 'string' then
            buyEgg(val, nil)
        end
    end
    for name, target in pairs(cfg.EventShop or {}) do
        local shopIndex = ShopIndexMap[name]
        if shopIndex then
            buyEventItem(name, target, shopIndex)
        end
    end
end

-- ===============================
-- 🪓 BREAK PLANTS (from phá cây) - single pass
-- ===============================
local function countAllPlants(myFarm)
    if not myFarm then
        return 0
    end
    local folder = myFarm.Important:FindFirstChild('Plants_Physical')
    if not folder then
        return 0
    end
    return #folder:GetChildren()
end

local function breakPlants(myFarm, breakList)
    if not RemoveItemRE then
        return
    end
    local folder = myFarm.Important:FindFirstChild('Plants_Physical')
    if not folder then
        return
    end
    equipOnly('Shovel')
    for _, plant in ipairs(folder:GetChildren()) do
        for _, name in ipairs(breakList or {}) do
            if plant.Name == name then
                for _, slot in ipairs(plant:GetChildren()) do
                    RemoveItemRE:FireServer(slot)
                    print('❌ Đã phá cây:', plant.Name, 'ID:', slot.Name)
                    task.wait(0.15)
                end
            end
        end
    end
end

function DoBreakPlants()
    local myFarm = getMyFarm()
    if not myFarm then
        warn('❌ Không tìm thấy farm của bạn!')
        return
    end
    local total = countAllPlants(myFarm)
    print('📊 Tổng số cây trong farm:', total)
    if total > (getgenv().Config.MaxPlants or 300) then
        print(
            '⚠️ Vượt quá giới hạn, phá:',
            table.concat(getgenv().Config.BreakList or {}, ', ')
        )
        breakPlants(myFarm, getgenv().Config.BreakList)
    else
        print('✅ Số cây hợp lệ, không cần phá.')
    end
end

-- ===============================
-- 🚀 MAIN LOOP (tuần tự: cái này xong mới đến cái kia)
-- ===============================
task.spawn(function()
    while getgenv().RunningFarm and task.wait(getgenv().Config.LoopInterval) do
        print('===== 🔄 Bắt đầu vòng farm mới =====')
        pcall(DoEggs)
        pcall(DoPlanting)
        pcall(DoSprinklers)
        pcall(DoSellPets)
        pcall(DoFeedPets)
        pcall(DoEquipPets)
        pcall(DoAutoBuy)
        pcall(DoHarvest)
        pcall(DoSellFruits)
        pcall(DoBreakPlants)
        print('===== ✅ Kết thúc vòng farm =====')
    end
end)
-- ===============================
-- 🛒 AUTO BUY EVENT SHOP (gốc, cố định Evo Seeds)
-- ===============================
local RS = game:GetService('ReplicatedStorage')
local BuyEventShop = RS.GameEvents:FindFirstChild('BuyEventShopStock')

local function DoBuyShopEvent()
    if not BuyEventShop then
        warn('❌ Không tìm thấy remote BuyEventShopStock')
        return
    end

    -- danh sách cố định
    BuyEventShop:FireServer('Evo Beetroot I', 5)
    BuyEventShop:FireServer('Evo Blueberry I', 5)
    BuyEventShop:FireServer('Evo Pumpkin I', 5)
    BuyEventShop:FireServer('Evo Mushroom I', 5)

    print('✅ Đã gửi request mua tất cả Evo Seeds')
end

-- 🔄 Auto loop mỗi 60 giây
task.spawn(function()
    while task.wait(60) do
        DoBuyShopEvent()
    end
end)

-- ===============================
-- 🌟 FIXED SETTINGS (không cần config)
-- ===============================
local Players = game:GetService('Players')
local Rep = game:GetService('ReplicatedStorage')
local ColServ = game:GetService('CollectionService')
local localPlayer = Players.LocalPlayer
local CollectRemote = Rep.GameEvents.Crops.Collect
local SubmitRemote = Rep.GameEvents.TieredPlants.Submit

local INTERVAL = 10 -- giãn cách check thu hoạch (giây)
local FIRE_DELAY = 0.25 -- delay giữa mỗi lần FireServer
local LIMIT = 200 -- số crop tối đa mỗi vòng
local DEBUG = true -- in log

-- ===============================
-- 🔎 Tìm farm
-- ===============================
local function getMyFarm()
    for _, farm in ipairs(workspace:GetChildren()) do
        if farm.Name == 'Farm' then
            for _, subFarm in ipairs(farm:GetChildren()) do
                if
                    subFarm.Name == 'Farm'
                    and subFarm:FindFirstChild('Important')
                    and subFarm.Important:FindFirstChild('Data')
                    and subFarm.Important.Data:FindFirstChild('Owner')
                    and subFarm.Important.Data.Owner.Value
                        == localPlayer.Name
                then
                    return subFarm
                end
            end
        end
    end
    return nil
end

-- 🔍 Check tag collect
local function hasCollectTag(obj)
    if type(obj.HasTag) == 'function' then
        local ok, res = pcall(function()
            return obj:HasTag('CollectPrompt')
        end)
        if ok then
            return res
        end
    end
    return ColServ:HasTag(obj, 'CollectPrompt')
end

-- 📜 Danh sách trái Evo hợp lệ
local evoFruits = {
    'Evo Beetroot I',
    'Evo Blueberry I',
    'Evo Pumpkin I',
    'Evo Mushroom I',
    'Evo Beetroot II',
    'Evo Blueberry II',
    'Evo Pumpkin II',
    'Evo Mushroom II',
    'Evo Beetroot III',
    'Evo Blueberry III',
    'Evo Pumpkin III',
    'Evo Mushroom III',
}

local function isEvoFruit(name)
    for _, fname in ipairs(evoFruits) do
        if string.find(name, fname) then
            return true
        end
    end
    return false
end

-- 🌻 Thu hoạch cây Evo
local function harvestEvo(limit)
    local collected = 0
    local myFarm = getMyFarm()
    if not myFarm then
        warn('❌ Không tìm thấy farm của bạn!')
        return
    end

    for _, inst in ipairs(myFarm:GetDescendants()) do
        if inst:IsA('ProximityPrompt') and hasCollectTag(inst) then
            local crop = inst.Parent and inst.Parent.Parent
            if crop and isEvoFruit(crop.Name) then
                CollectRemote:FireServer({ crop })
                if DEBUG then
                    print('✅ Thu hoạch:', crop.Name)
                end
                collected += 1
                task.wait(FIRE_DELAY)
                if collected >= limit then
                    return
                end
            else
                if DEBUG and crop then
                    print('⏭️ Bỏ qua:', crop.Name)
                end
            end
        end
    end
end

-- 🧰 Equip đúng fruit có b=j
local function equipCorrectFruit()
    -- đang cầm
    for _, tool in ipairs(localPlayer.Character:GetChildren()) do
        if tool:IsA('Tool') and isEvoFruit(tool.Name) then
            local attrs = tool:GetAttributes()
            if attrs and attrs.b == 'j' then
                return tool
            end
        end
    end
    -- trong backpack
    for _, tool in ipairs(localPlayer.Backpack:GetChildren()) do
        if tool:IsA('Tool') and isEvoFruit(tool.Name) then
            local attrs = tool:GetAttributes()
            if attrs and attrs.b == 'j' then
                tool.Parent = localPlayer.Character
                if DEBUG then
                    print('📦 Auto cầm:', tool.Name)
                end
                return tool
            end
        end
    end
    return nil
end

-- 🧾 Nộp fruit
local function submitFruit(tool)
    if tool and tool:IsA('Tool') then
        SubmitRemote:FireServer('Held')
        if DEBUG then
            print('✅ Đã nộp:', tool.Name)
        end
    end
end

-- ===============================
-- 🚀 Main loops
-- ===============================
task.spawn(function()
    while task.wait(INTERVAL) do
        harvestEvo(LIMIT)
    end
end)

task.spawn(function()
    while task.wait(1) do
        local fruit = equipCorrectFruit()
        if fruit then
            task.wait(0.5)
            submitFruit(fruit)
        end
    end
end)
local player = game.Players.LocalPlayer

-- 📜 Danh sách cây/quả Evo cần giữ nguyên
local KeepEvo = {
    ['Evo Beetroot I'] = true,
    ['Evo Blueberry I'] = true,
    ['Evo Pumpkin I'] = true,
    ['Evo Mushroom I'] = true,
    ['Evo Beetroot II'] = true,
    ['Evo Blueberry II'] = true,
    ['Evo Pumpkin II'] = true,
    ['Evo Mushroom II'] = true,
    ['Evo Beetroot III'] = true,
    ['Evo Blueberry III'] = true,
    ['Evo Pumpkin III'] = true,
    ['Evo Mushroom III'] = true,
}

-- 🔧 Hàm xoá visual an toàn, giữ lại PrimaryPart và cây Evo
local function clearPlantAndFruits(plant)
    if KeepEvo[plant.Name] then
        -- ✅ Nếu là cây Evo → giữ nguyên cả model + quả
        return
    end

    for _, obj in ipairs(plant:GetChildren()) do
        if tonumber(obj.Name) and obj.Name ~= 'PrimaryPart' then
            warn('Xóa part cây:', obj:GetFullName())
            obj:Destroy()
        end
        if obj.Name == 'Fruits' then
            for _, fruit in ipairs(obj:GetChildren()) do
                if KeepEvo[fruit.Name] then
                    -- ✅ Nếu là quả Evo → giữ nguyên
                    continue
                end
                for _, fchild in ipairs(fruit:GetChildren()) do
                    if
                        tonumber(fchild.Name)
                        and fchild.Name ~= 'PrimaryPart'
                    then
                        warn('Xóa part quả:', fchild:GetFullName())
                        fchild:Destroy()
                    end
                end
            end
        end
    end
end

-- 🚀 Vòng lặp chính
spawn(function()
    while task.wait(2) do
        pcall(function()
            -- ❌ Xoá toàn bộ con trong Lighting
            for _, obj in ipairs(game:GetService('Lighting'):GetChildren()) do
                warn('Xóa Lighting object:', obj.Name)
                obj:Destroy()
            end

            -- ❌ Xoá toàn bộ con trong workspace.Debris
            if workspace:FindFirstChild('Debris') then
                for _, obj in ipairs(workspace.Debris:GetChildren()) do
                    warn('Xóa Debris object:', obj.Name)
                    obj:Destroy()
                end
            end

            -- ❌ Xoá toàn bộ con trong workspace.Terrain
            if workspace:FindFirstChild('Terrain') then
                for _, obj in ipairs(workspace.Terrain:GetChildren()) do
                    warn('Xóa Terrain object:', obj.Name)
                    obj:Destroy()
                end
            end

            -- 🔄 Clear Farms
            for _, farm in workspace:GetChildren() do
                if farm.Name == 'Farm' then
                    for _, subFarm in ipairs(farm:GetChildren()) do
                        if
                            subFarm.Name == 'Farm'
                            and subFarm:FindFirstChild('Important')
                            and subFarm.Important:FindFirstChild('Data')
                            and subFarm.Important.Data:FindFirstChild('Owner')
                        then
                            local isMine = (
                                subFarm.Important.Data.Owner.Value
                                == player.Name
                            )

                            -- ❌ Xoá farm người khác
                            if not isMine then
                                warn('Xóa farm khác:', subFarm.Name)
                                subFarm:Destroy()
                            end

                            -- ✅ Farm của mình
                            if isMine then
                                if
                                    subFarm.Important:FindFirstChild(
                                        'Plants_Physical'
                                    )
                                then
                                    for _, plant in
                                        ipairs(
                                            subFarm.Important.Plants_Physical:GetChildren()
                                        )
                                    do
                                        clearPlantAndFruits(plant)
                                    end
                                end

                                if
                                    subFarm.Important:FindFirstChild(
                                        'Decorations'
                                    )
                                then
                                    for _, obj in
                                        ipairs(
                                            subFarm.Important.Decorations:GetChildren()
                                        )
                                    do
                                        warn('Xóa deco:', obj.Name)
                                        obj:Destroy()
                                    end
                                end

                                if
                                    subFarm.Important:FindFirstChild('Fences')
                                then
                                    for _, obj in
                                        ipairs(
                                            subFarm.Important.Fences:GetChildren()
                                        )
                                    do
                                        warn('Xóa fence:', obj.Name)
                                        obj:Destroy()
                                    end
                                end

                                if
                                    subFarm.Important:FindFirstChild(
                                        'Cosmetics'
                                    )
                                then
                                    for _, obj in
                                        ipairs(
                                            subFarm.Important.Cosmetics:GetChildren()
                                        )
                                    do
                                        warn('Xóa cosmetic:', obj.Name)
                                        obj:Destroy()
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)
-- 🔧 Services
local Players     = game:GetService("Players")
local RS          = game:GetService("ReplicatedStorage")
local localPlayer = Players.LocalPlayer

local BuyNormal   = RS.GameEvents:WaitForChild("BuyTravelingMerchantShopStock")
local BuyHoney    = RS.GameEvents:WaitForChild("HoneyMerchantSubmit_RE")

-- 📜 Danh sách item cố định
local normalShopItems = {
    "Liberty Lily","Firework Flower","Firework","Bald Eagle","July 4th Crate",

    "Common Gnome Crate","Farmers Gnome Crate","Classic Gnome Crate",
    "Iconic Gnome Crate","Gnome",

    "Night Staff","Star Caller",
    "Mutation Spray Cloudtouched","Mutation Spray Wet",
    "Mutation Spray Windstruck","Mutation Spray Verdant",

    "Tropical Mist Sprinkler","Berry Blusher Sprinkler",
    "Spice Spritzer Sprinkler","Sweet Soaker Sprinkler",
    "Flower Froster Sprinkler","Stalk Sprout Sprinkler",

    "Cauliflower","Rafflesia","Green Apple","Avocado","Banana","Pineapple",
    "Kiwi","Bell Pepper","Prickly Pear","Loquat","Feijoa","Pitcher Plant",

    "Common Summer Egg","Rare Summer Egg","Paradise Egg",
}

local honeyShopItems = {
    "Bee Egg",
}

local CHECK_DELAY = 5 -- giây

-- 📦 Đếm số lượng item trong balo
local function countInBackpack(itemName)
    local count = 0
    for _, obj in ipairs(localPlayer.Backpack:GetChildren()) do
        if string.find(obj.Name, itemName) then
            count += 1
        end
    end
    for _, obj in ipairs(localPlayer.Character:GetChildren()) do
        if string.find(obj.Name, itemName) then
            count += 1
        end
    end
    return count
end

-- 🛒 Mua item bằng tiền thường
local function buyNormal(itemName)
    local current = countInBackpack(itemName)
    BuyNormal:FireServer(itemName)
    print("💰 Mua "..itemName.." | hiện có: "..current)
end

-- 🍯 Mua item bằng Honey
local function buyHoney(itemName)
    local current = countInBackpack(itemName)
    BuyHoney:FireServer(itemName)
    print("🍯 Mua "..itemName.." | hiện có: "..current)
end

-- 🚀 Main loop
task.spawn(function()
    while task.wait(CHECK_DELAY) do
        for _, item in ipairs(normalShopItems) do
            buyNormal(item)
        end
        for _, item in ipairs(honeyShopItems) do
            buyHoney(item)
        end
    end
end)
