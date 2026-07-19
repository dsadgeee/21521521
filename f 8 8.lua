getgenv().AutoSellConfig = {
    -- 1. Cấu hình tự động treo bán vật phẩm (Auto Sell)
    Enabled = true,             -- AUTO SELL
    SellAllHuge = true,         -- Sell all huge u got
    HugePrice = "-10%",         -- -% price for "SellAllHuge"
    HugeExclude = {             -- Keep pet no sale
        -- "Huge Hacked Reaper",
    },
    ItemsToSell = {
        -- -% price on RAP, if not have the RAP, fallback to fallback price
        { name = "Marble Gift", category = "Lootbox", type = "normal", price = -15 },
    },
    ServerHop = false,           -- Bật/Tắt tự động chuyển server (true = bật, false = tắt)
    ServerHopTime = 20,         -- min hop sever if no sales in X minutes (default 20)

    -- 2. Cấu hình tự động nhận Mail (Auto Claim Mail)
    ClaimMail = true,           -- Bật true để tự động nhận quà từ hòm thư mỗi 2 phút

    -- 3. Cấu hình FPS (Khóa FPS thấp giúp giảm tải CPU tối đa)
    LockFPS = 20                -- Khóa FPS để giảm tải CPU (ví dụ 15, 30 hoặc 60)
}

local config = getgenv().AutoSellConfig
local sellConfig = config

-- Các thông số mặc định của hệ thống Auto Claim (Để ẩn trong script, người dùng không cần cấu hình)
local claimEnabled = true
local prioritizeFloor1 = true
local teleportToClaim = true
local checkInterval = 2 -- Tần suất quét quầy trống được đặt thành 2 giây theo yêu cầu

-- Các thông số tối ưu hóa đồ họa chạy mặc định (Luôn bật để nhẹ game nhất, không cần cấu hình)
local optEnabled = true
local hideMap = true
local hidePlayers = true
local removeEffects = true
local removeColors = true

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local GuiService = game:GetService("GuiService")
local localPlayer = Players.LocalPlayer
local targetPlaceId = 15502339080 -- Trading Plaza Place ID

-- Stop older instances of this script
local scriptId = tostring(os.clock() + math.random())
getgenv().AutoSellScriptId = scriptId

-- Bộ nhớ đệm lâu dài (Khóa thời gian) cho các UID đăng bán để tránh bị spam/nghẽn
local sessionListedUids = {}

-- Dọn dẹp tất cả các kết nối cũ của script trước đó để tránh trùng lặp và gây crash Delta
if getgenv().PS99_AutoSell_Connections then
    for name, con in pairs(getgenv().PS99_AutoSell_Connections) do
        pcall(function()
            con:Disconnect()
        end)
    end
end
getgenv().PS99_AutoSell_Connections = {}
local consTable = getgenv().PS99_AutoSell_Connections

-- ================== GRAPHICS OPTIMIZATION MODULE ==================

if optEnabled then
    -- 1. Khóa FPS theo cấu hình của người dùng
    local lockFPSValue = config.LockFPS or 20
    pcall(function()
        setfpscap(lockFPSValue)
    end)

    -- 2. Hàm tối ưu hóa từng Object cụ thể (Xóa màu, làm phẳng xám và ẩn chi tiết)
    local function optimizeObject(v)
        if removeEffects then
            if v:IsA("ParticleEmitter") then
                v.Enabled = false
                v.Lifetime = NumberRange.new(0)
            elseif v:IsA("Trail") then
                v.Enabled = false
                v.Lifetime = 0
            elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") or v:IsA("Light") or v:IsA("PointLight") then
                v.Enabled = false
            end
        end

        if hideMap then
            -- Không xóa màu hoặc ẩn nhân vật của chính mình
            local char = localPlayer.Character
            if char and v:IsDescendantOf(char) then
                return
            end

            if v:IsA("BasePart") and v.Name ~= "Terrain" then
                v.CastShadow = false
                v.Reflectance = 0
                v.Material = Enum.Material.Plastic
                v.Color = Color3.fromRGB(100, 100, 100) -- Xóa màu bản đồ, chuyển thành màu xám đồng bộ
            elseif v:IsA("Decal") or v:IsA("Texture") then
                v.Transparency = 1
            elseif v:IsA("MeshPart") then
                v.Material = Enum.Material.Plastic
                v.Reflectance = 0
                v.TextureID = ""
                v.Color = Color3.fromRGB(100, 100, 100) -- Xóa màu và vân bề mặt của MeshPart
            elseif v:IsA("MeshPart") then
                v.Material = Enum.Material.Plastic
                v.Reflectance = 0
                v.TextureID = ""
                v.Color = Color3.fromRGB(100, 100, 100) -- Xóa màu và vân bề mặt của MeshPart
            elseif v:IsA("SpecialMesh") then
                v.TextureId = ""
            elseif v.Name == "Foilage" and v:IsA("Folder") then
                v:Destroy()
            elseif string.find(v.Name:lower(), "tree") or string.find(v.Name:lower(), "water") or string.find(v.Name:lower(), "bush") or string.find(v.Name:lower(), "grass") then
                task.wait()
                v:Destroy()
            end
        end
    end

    -- 3. Tối ưu hóa Lighting & Terrain
    local function cleanWorkspaceAndLighting()
        pcall(function()
            if removeColors then
                local Lighting = game:GetService("Lighting")
                Lighting.Brightness = 0
                Lighting.GlobalShadows = false
                Lighting.Ambient = Color3.fromRGB(100, 100, 100)
                Lighting.OutdoorAmbient = Color3.fromRGB(100, 100, 100)
                for _, obj in ipairs(Lighting:GetChildren()) do
                    if obj:IsA("Sky") or obj:IsA("Atmosphere") or obj:IsA("BloomEffect") or obj:IsA("ColorCorrectionEffect") or obj:IsA("SunRaysEffect") then
                        obj:Destroy()
                    end
                end
            end

            if hideMap then
                local Terrain = workspace:FindFirstChild("Terrain")
                if Terrain then
                    Terrain.WaterReflectance = 0
                    Terrain.WaterTransparency = 1
                    Terrain.WaterWaveSize = 0
                    Terrain.WaterWaveSpeed = 0
                    pcall(function() sethiddenproperty(Terrain, "Decoration", false) end)
                end
            end
        end)
    end

    -- 4. Ẩn người chơi khác
    local function removeOtherPlayers()
        if not hidePlayers then return end
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= localPlayer and plr.Character then
                pcall(function()
                    plr.Character:Destroy()
                end)
            end
        end
    end

    -- 5. Ẩn nhân vật của mình
    local function hideLocalCharacter()
        if not hidePlayers then return end
        local char = localPlayer.Character
        if char then
            for _, v in ipairs(char:GetDescendants()) do
                if v:IsA("BasePart") or v:IsA("Decal") then
                    v.Transparency = 1
                end
            end
        end
    end

    -- Khởi chạy dọn dẹp ban đầu
    cleanWorkspaceAndLighting()
    removeOtherPlayers()

    for _, v in ipairs(workspace:GetDescendants()) do
        pcall(optimizeObject, v)
    end

    -- Lắng nghe đối tượng mới xuất hiện để tối ưu hóa liên tục
    workspace.DescendantAdded:Connect(function(v)
        pcall(optimizeObject, v)
    end)

    Players.PlayerAdded:Connect(function(plr)
        if hidePlayers and plr ~= localPlayer then
            plr.CharacterAdded:Connect(function(char)
                task.wait(0.1)
                pcall(function() char:Destroy() end)
            end)
        end
    end)

    localPlayer.CharacterAdded:Connect(function(char)
        task.wait(0.5)
        pcall(hideLocalCharacter)
    end)

    task.spawn(function()
        pcall(hideLocalCharacter)
    end)

    -- Vòng lặp dọn dẹp nền định kỳ chống trôi rác đồ họa
    task.spawn(function()
        while getgenv().AutoSellScriptId == scriptId do
            task.wait(5)
            pcall(cleanWorkspaceAndLighting)
            pcall(removeOtherPlayers)
            pcall(hideLocalCharacter)

            -- Tối giản màu sắc UI
            if removeColors then
                pcall(function()
                    local playerGui = localPlayer:FindFirstChild("PlayerGui")
                    if playerGui then
                        for _, gui in ipairs(playerGui:GetDescendants()) do
                            if gui:IsA("GuiObject") and gui.Name ~= "StatsTrackerUI" then
                                if gui:IsA("Frame") or gui:IsA("ScrollingFrame") then
                                    gui.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                                    gui.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                elseif gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox") then
                                    gui.TextColor3 = Color3.fromRGB(180, 180, 180)
                                    gui.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                                    if gui:IsA("TextLabel") then
                                        gui.TextStrokeTransparency = 1
                                    end
                                elseif gui:IsA("ImageLabel") or gui:IsA("ImageButton") then
                                    gui.ImageColor3 = Color3.fromRGB(220, 220, 220)
                                    gui.ImageTransparency = 0.5
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)
end

-- ================== SERVER HOP MODULE ==================

local function serverHop()
    local HttpService = game:GetService("HttpService")

    local success, response = pcall(function()
        return game:HttpGet("https://games.roblox.com/v1/games/" .. tostring(targetPlaceId) .. "/servers/Public?sortOrder=Desc&limit=100")
    end)

    if success and response and response ~= "" then
        local data = HttpService:JSONDecode(response)
        if data and data.data then
            local servers = {}
            for _, s in ipairs(data.data) do
                if type(s) == "table" and s.id and s.playing and s.maxPlayers and s.playing < s.maxPlayers - 2 and s.id ~= game.JobId then
                    table.insert(servers, s.id)
                end
            end

            if #servers > 0 then
                local randomJobId = servers[math.random(1, #servers)]
                pcall(function()
                    TeleportService:TeleportToPlaceInstance(targetPlaceId, randomJobId, localPlayer)
                end)
                task.wait(10)
                return
            end
        end
    end

    pcall(function()
        TeleportService:Teleport(targetPlaceId, localPlayer)
    end)
end

-- ================== ANTI-AFK MODULE ==================

pcall(function()
    local VirtualUser = game:GetService("VirtualUser")
    localPlayer.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
end)

task.spawn(function()
    local VirtualUser = game:GetService("VirtualUser")
    while getgenv().AutoSellScriptId == scriptId do
        task.wait(180) -- Thực hiện nhấn phím Space ảo mỗi 3 phút
        pcall(function()
            VirtualUser:CaptureController()
            VirtualUser:SetKeyDown('0x20') -- Phím Space
            task.wait(0.5)
            VirtualUser:SetKeyUp('0x20')
        end)
    end
end)

-- Vô hiệu hóa hệ thống theo dõi Idle nội bộ của game Pet Simulator 99
pcall(function()
    local stopTimerRemote = ReplicatedStorage:WaitForChild("Network"):WaitForChild("Idle Tracking: Stop Timer")
    if stopTimerRemote then
        stopTimerRemote:FireServer()
    end
    local coreScripts = localPlayer:WaitForChild("PlayerScripts"):WaitForChild("Scripts"):WaitForChild("Core")
    if coreScripts then
        local idleTracking = coreScripts:FindFirstChild("Idle Tracking")
        if idleTracking then
            idleTracking.Enabled = false
        end
        local serverClosing = coreScripts:FindFirstChild("Server Closing")
        if serverClosing then
            serverClosing.Enabled = false
        end
    end
end)

-- ================== AUTO JOIN / REJOIN MODULE ==================

local function checkAndTeleport()
    if game.PlaceId ~= targetPlaceId then
        pcall(function()
            TeleportService:Teleport(targetPlaceId, localPlayer)
        end)
        task.wait(15) -- Tránh spam lệnh dịch chuyển liên tục
    end
end

-- ================== HELPER FUNCTIONS ==================

-- Check if player owns a booth
local function hasBooth()
    local boothsFolder = workspace:FindFirstChild("__THINGS") and workspace.__THINGS:FindFirstChild("Booths")
    if boothsFolder then
        for _, booth in ipairs(boothsFolder:GetChildren()) do
            if booth:GetAttribute("Owner") == localPlayer.UserId then
                return true, booth
            end
        end
    end
    return false, nil
end

-- Get average crowd position
local function getCrowdCenter()
    local playerPositions = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= localPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            table.insert(playerPositions, plr.Character.HumanoidRootPart.Position)
        end
    end

    if #playerPositions > 0 then
        local sum = Vector3.new(0, 0, 0)
        for _, pos in ipairs(playerPositions) do
            sum = sum + pos
        end
        return sum / #playerPositions
    end

    -- Fallback to SpawnLocation
    local plaza = workspace:FindFirstChild("TradingPlaza")
    if plaza then
        for _, child in ipairs(plaza:GetDescendants()) do
            if child:IsA("SpawnLocation") then
                return child.Position
            end
        end
    end

    local char = localPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    return root and root.Position or Vector3.new(0, 0, 0)
end

-- Find best empty booth spawn
local function findBestEmptyBooth()
    local plaza = workspace:FindFirstChild("TradingPlaza")
    local boothSpawns = plaza and plaza:FindFirstChild("BoothSpawns")
    local activeBooths = workspace:FindFirstChild("__THINGS") and workspace.__THINGS:FindFirstChild("Booths")

    if not boothSpawns or not activeBooths then
        warn("[Auto Booth] BoothSpawns or active Booths folder not found!")
        return nil
    end

    local claimedPositions = {}
    for _, boothModel in ipairs(activeBooths:GetChildren()) do
        if boothModel:IsA("Model") then
            table.insert(claimedPositions, boothModel:GetPivot().Position)
        end
    end

    local crowdCenter = getCrowdCenter()
    local candidates = {}

    for _, spawnPart in ipairs(boothSpawns:GetChildren()) do
        local spawnPos = spawnPart:GetPivot().Position

        local isClaimed = false
        for _, activePos in ipairs(claimedPositions) do
            if (activePos - spawnPos).Magnitude < 2 then
                isClaimed = true
                break
            end
        end

        if not isClaimed then
            local boothId = spawnPart:GetAttribute("ID")
            local y = spawnPos.Y

            local floor = 3
            if y < 285 then
                floor = 1
            elseif y >= 285 and y < 295 then
                floor = 2
            end

            local distToCrowd = (spawnPos - crowdCenter).Magnitude
            table.insert(candidates, {
                ID = boothId,
                Part = spawnPart,
                Position = spawnPos,
                Floor = floor,
                DistanceToCrowd = distToCrowd
            })
        end
    end

    if #candidates == 0 then
        return nil
    end

    table.sort(candidates, function(a, b)
        if prioritizeFloor1 then
            if a.Floor ~= b.Floor then
                return a.Floor < b.Floor
            end
        end
        return a.DistanceToCrowd < b.DistanceToCrowd
    end)

    return candidates[1]
end

-- Get our current listings from the client GC (Optimized with caching to prevent lag)
local lastGcScan = 0
local function getMyBoothListings()
    local u5 = getgenv().PS99_Booths_u5
    local owned = hasBooth()

    if u5 then
        if u5[localPlayer] then
            return u5[localPlayer].Listings or {}, u5[localPlayer]
        end
        -- Nếu game báo ta có quầy nhưng bảng cache lại trống, nghĩa là cache bị lỗi thời do đổi server/quầy.
        -- Ta xóa cache để quét lại GC tìm bảng mới.
        if owned then
            getgenv().PS99_Booths_u5 = nil
            u5 = nil
        else
            return {}, nil
        end
    end

    -- Khống chế tần suất quét GC: Chỉ quét tối đa 1 lần mỗi 30 giây nếu chưa tìm thấy u5
    local now = os.clock()
    if not u5 and (now - lastGcScan >= 30) then
        lastGcScan = now
        local success, gc = pcall(getgc, true)
        if success and gc then
            for _, obj in ipairs(gc) do
                if type(obj) == "table" then
                    local matches = 0
                    local total = 0
                    for k, v in pairs(obj) do
                        total = total + 1
                        if typeof(k) == "Instance" and k:IsA("Player") and type(v) == "table" and v.BoothID then
                            matches = matches + 1
                        end
                    end
                    if matches > 0 and matches == total then
                        u5 = obj
                        getgenv().PS99_Booths_u5 = u5
                        break
                    end
                end
            end
        end
    end

    if u5 and u5[localPlayer] then
        return u5[localPlayer].Listings or {}, u5[localPlayer]
    end
    return {}, nil
end

-- Pre-populate booths table in main thread on startup
pcall(getMyBoothListings)

-- Helper to check if item matches user config
local function itemMatchesConfig(itemData, displayName, configItem)
    -- Match name (Sử dụng tìm kiếm chuỗi thuần túy 'plain text' 1, true để tránh lỗi kí tự đặc biệt như -, *, ', (, ))
    if not displayName:lower():find(configItem.name:lower(), 1, true) then
        return false
    end

    -- Safety check: NEVER auto-sell Titanics
    if displayName:lower():find("titanic", 1, true) then
        return false
    end

    -- Đọc pt và sh hỗ trợ cả định dạng rương (inventory) và định dạng quầy bán hàng (_uq)
    local pt = itemData.pt or (itemData._uq and itemData._uq.pt) or 0
    local sh = itemData.sh or (itemData._uq and itemData._uq.sh) or false

    local isShiny = sh == true
    local isGold = pt == 1
    local isRainbow = pt == 2
    local isNormal = (not isShiny) and (not isGold) and (not isRainbow)

    local cType = configItem.type and configItem.type:lower() or "all"
    if cType == "normal" and not isNormal then return false end
    if cType == "gold" and not isGold then return false end
    if (cType == "rb" or cType == "rainbow") and not isRainbow then return false end
    if cType == "shiny" and not isShiny then return false end

    return true
end

-- ================== RAP API MODULE ==================

local function fetchRapData()
    if getgenv().PS99_RAP_Cache and (os.time() - getgenv().PS99_RAP_CacheTime < 1800) then
        return getgenv().PS99_RAP_Cache
    end

    local success, response = pcall(function()
        return game:HttpGet("https://ps99.biggamesapi.io/api/rap")
    end)

    if success and response and response ~= "" then
        local HttpService = game:GetService("HttpService")
        local data = HttpService:JSONDecode(response)
        if data and data.status == "success" and data.data then
            getgenv().PS99_RAP_Cache = data.data
            getgenv().PS99_RAP_CacheTime = os.time()
            return data.data
        end
    end

    warn("[Auto Sell] Tải giá RAP từ API thất bại!")
    return getgenv().PS99_RAP_Cache
end

local function buildLookup(rapData)
    if not rapData then return end
    local lookup = {}
    for _, item in ipairs(rapData) do
        local cat = item.category
        local cData = item.configData
        local val = item.value
        if cData and cData.id then
            local key = ""
            if cat == "Pet" then
                local pt = cData.pt or 0
                local sh = cData.sh or false
                key = "Pet_" .. cData.id .. "_" .. tostring(pt) .. "_" .. tostring(sh)
            else
                if cData.tn then
                    key = cat .. "_" .. cData.id .. "_" .. tostring(cData.tn)
                else
                    key = cat .. "_" .. cData.id
                end
            end
            lookup[key] = val
        end
    end
    getgenv().PS99_RAP_Lookup = lookup
end

local function getRapFromAPI(itemData, category)
    local lookup = getgenv().PS99_RAP_Lookup
    if not lookup then
        local rap = fetchRapData()
        if rap then
            buildLookup(rap)
            lookup = getgenv().PS99_RAP_Lookup
        end
    end

    if lookup then
        local id = itemData.id or category
        local key = ""
        if category == "Pet" then
            -- Hỗ trợ đọc cả trong _uq của quầy
            local pt = itemData.pt or (itemData._uq and itemData._uq.pt) or 0
            local sh = itemData.sh or (itemData._uq and itemData._uq.sh) or false
            key = "Pet_" .. id .. "_" .. tostring(pt) .. "_" .. tostring(sh)
        else
            local tn = tonumber(itemData.tn)
            if tn then
                key = category .. "_" .. id .. "_" .. tostring(tn)
            else
                key = category .. "_" .. id
            end
        end
        return lookup[key]
    end
    return nil
end

-- ================== AUTO SELL & UPDATE MODULE ==================

-- Calculate price based on item config, local RAP, or Web API RAP
local function calculateTargetPrice(itemObj, itemData, category, configItem)
    local rapVal = nil
    pcall(function()
        rapVal = itemObj:GetRAP()
    end)

    if not rapVal or rapVal <= 0 then
        local apiRap = getRapFromAPI(itemData, category)
        if apiRap and apiRap > 0 then
            rapVal = apiRap
        end
    end

    local price = 0
    local priceCfg = configItem.price
    local fallbackCfg = configItem.fallback

    if type(priceCfg) == "string" and priceCfg:find("%%") then
        local pct = tonumber(priceCfg:match("([%-%d%.]+)%%")) or -10
        local pctAbs = math.abs(pct)

        if rapVal and rapVal > 0 then
            price = math.floor(rapVal * (1 - pctAbs / 100) + 0.5)
        elseif fallbackCfg and fallbackCfg > 0 then
            price = fallbackCfg
        end
    elseif type(priceCfg) == "number" and priceCfg < 0 then
        local pctAbs = math.abs(priceCfg)

        if rapVal and rapVal > 0 then
            price = math.floor(rapVal * (1 - pctAbs / 100) + 0.5)
        elseif fallbackCfg and fallbackCfg > 0 then
            price = fallbackCfg
        end
    elseif type(priceCfg) == "number" and priceCfg > 0 then
        price = priceCfg
    else
        if rapVal and rapVal > 0 then
            price = math.floor(rapVal * 0.9 + 0.5)
        elseif fallbackCfg and fallbackCfg > 0 then
            price = fallbackCfg
        end
    end

    return price, rapVal
end

-- Check if a UID is currently locked in session (success or failure)
local function isUidLocked(uid)
    local expireTime = sessionListedUids[uid]
    if expireTime and os.time() < expireTime then
        return true
    end
    return false
end

-- Thêm biến lastPriceCheck để theo dõi thời gian kiểm tra giá cuối cùng
local lastPriceCheck = 0

local function runAutoSell(myBooth, forcePriceCheck)
    if not config.Enabled then
        return
    end

    local Save = require(ReplicatedStorage:WaitForChild("Library"):WaitForChild("Client"):WaitForChild("Save"))
    local Items = require(ReplicatedStorage:WaitForChild("Library"):WaitForChild("Items"))
    local save = Save.Get()

    if not save or not save.Inventory then return end

    -- Check current listings to prevent posting already listed items and to check for price updates
    local myListings, boothData = getMyBoothListings()
    local currentListingCount = 0
    local listedUids = {}

    -- Chỉ chạy kiểm tra giá và số lượng sau mỗi 300 giây (5 phút) để tránh spam gỡ/đăng liên tục gây lỗi (ngáo)
    local now = os.clock()
    local shouldUpdatePrice = forcePriceCheck or (now - lastPriceCheck >= 300)
    if shouldUpdatePrice then
        lastPriceCheck = now
    end

    -- Dọn dẹp session cache quá hạn
    local timeNow = os.time()
    for uid, t in pairs(sessionListedUids) do
        if timeNow >= t then
            sessionListedUids[uid] = nil
        end
    end

    -- 1. Check existing listings for price/quantity updates
    for listingId, listing in pairs(myListings or {}) do
        currentListingCount = currentListingCount + 1
        local itemObj = listing.Item
        if itemObj then
            local uid = itemObj:GetUID() or itemObj._uid
            if uid then
                listedUids[uid] = true
            end

            local displayName = itemObj:GetName()
            local currentPrice = listing.DiamondCost
            local updated = false

            -- 1a. Check if this Huge is explicitly configured in ItemsToSell first
            local isHuge = displayName:lower():find("huge", 1, true)
            local isTitanic = displayName:lower():find("titanic", 1, true)
            local explicitlyConfigured = false

            if isHuge and not isTitanic and config.ItemsToSell then
                for _, configItem in ipairs(config.ItemsToSell) do
                    local category = configItem.category
                    if category == "Pet" and itemMatchesConfig(itemObj._data or {}, displayName, configItem) then
                        explicitlyConfigured = true
                        break
                    end
                end
            end

            -- 1b. If it is a Huge but NOT explicitly configured, apply SellAllHuge update logic (Chỉ quét giá mỗi 5 phút và khi không bị khóa)
            local locked = isUidLocked(uid)
            if not locked and shouldUpdatePrice and config.SellAllHuge and isHuge and not isTitanic and not explicitlyConfigured then
                local pt = itemObj._data and (itemObj._data.pt or (itemObj._data._uq and itemObj._data._uq.pt)) or 0
                local sh = itemObj._data and (itemObj._data.sh or (itemObj._data._uq and itemObj._data._uq.sh)) or false
                local excluded = false
                for _, exName in ipairs(config.HugeExclude or {}) do
                    if displayName:lower():find(exName:lower(), 1, true) then
                        excluded = true
                        break
                    end
                end

                if not excluded then
                    local fakeConfig = {
                        price = config.HugePrice or "-10%",
                        fallback = nil
                    }
                    local targetPrice, rapVal = calculateTargetPrice(itemObj, itemObj._data or {}, "Pet", fakeConfig)
                    if targetPrice > 0 and targetPrice ~= currentPrice then
                        local removeRemote = ReplicatedStorage.Network:FindFirstChild("Booths_RemoveListing")
                        if removeRemote and removeRemote:InvokeServer(listingId) then
                            task.wait(0.2)
                            local createRemote = ReplicatedStorage.Network:FindFirstChild("Booths_CreateListing")
                            if createRemote then
                                pcall(function() return createRemote:InvokeServer(uid, targetPrice, 1) end)
                            end
                        end
                        task.wait(0.2)
                        updated = true
                    end
                end
            end

            -- 1c. Check against ItemsToSell config (Cập nhật số lượng & giá chỉ chạy mỗi 5 phút - Chỉ chạy khi không bị khóa)
            if not locked and not updated and shouldUpdatePrice and config.ItemsToSell then
                for _, configItem in ipairs(config.ItemsToSell) do
                    local category = configItem.category
                    local itemData = save.Inventory[category] and save.Inventory[category][uid]

                    if itemData and itemMatchesConfig(itemData, displayName, configItem) then
                        local targetPrice, rapVal = calculateTargetPrice(itemObj, itemData, category, configItem)

                        local currentAmount = itemObj:GetAmount() or 1
                        local amountAvailable = itemData._am or 0
                        local targetAmount = math.min(currentAmount + amountAvailable, 50000)

                        -- Kiểm tra nâng số lượng hoặc cập nhật giá (chạy mỗi 5 phút)
                        local needQuantityUpdate = targetAmount > currentAmount
                        local needPriceUpdate = targetPrice > 0 and targetPrice ~= currentPrice

                        if needPriceUpdate or needQuantityUpdate then
                            -- Nếu chỉ nâng số lượng, giữ nguyên giá hiện tại
                            local finalPrice = currentPrice
                            if needPriceUpdate then
                                finalPrice = targetPrice
                            end

                            local removeRemote = ReplicatedStorage.Network:FindFirstChild("Booths_RemoveListing")
                            if removeRemote and removeRemote:InvokeServer(listingId) then
                                task.wait(0.2)
                                local createRemote = ReplicatedStorage.Network:FindFirstChild("Booths_CreateListing")
                                if createRemote then
                                    pcall(function() return createRemote:InvokeServer(uid, finalPrice, targetAmount) end)
                                end
                            end
                            task.wait(0.2)
                        end
                        break
                    end
                end
            end
        end
    end

    local maxSlots = save.BoothSlots or 20

    -- Kiểm tra giải phóng slot cho từng loại quà tặng (Lootbox/gifts) cụ thể nếu quầy đầy và có quà cần bán
    if config.ItemsToSell then
        for _, configItem in ipairs(config.ItemsToSell) do
            local category = configItem.category
            if category == "Lootbox" then
                -- 1. Kiểm tra xem loại quà này đã được treo bán trên quầy chưa
                local isThisGiftListed = false
                for listingId, listing in pairs(myListings or {}) do
                    local itemObj = listing.Item
                    if itemObj then
                        local displayName = itemObj:GetName()
                        local class = itemObj._class or (itemObj._data and itemObj._data.class) or (itemObj.ClassName) or ""
                        if (class == "Lootbox" or class == "Gift") and displayName:lower():find(configItem.name:lower(), 1, true) then
                            isThisGiftListed = true
                            break
                        end
                    end
                end

                -- 2. Kiểm tra xem trong rương có loại quà này không
                local hasThisGiftInInventory = false
                local categoryItems = save.Inventory[category]
                if categoryItems then
                    for uid, itemData in pairs(categoryItems) do
                        if not listedUids[uid] and not isUidLocked(uid) then
                            local itemObj = Items.From(category, itemData)
                            local displayName = itemObj and itemObj:GetName() or itemData.id
                            if displayName and itemMatchesConfig(itemData, displayName, configItem) then
                                local amountAvailable = itemData._am or 1
                                if amountAvailable > 0 then
                                    hasThisGiftInInventory = true
                                    break
                                end
                            end
                        end
                    end
                end

                -- 3. Nếu có trong rương nhưng chưa treo bán, và quầy đầy -> Gỡ 1 món không phải quà để lấy slot
                if hasThisGiftInInventory and not isThisGiftListed and currentListingCount >= maxSlots then
                    local nonGiftListingId = nil
                    for listingId, listing in pairs(myListings or {}) do
                        local itemObj = listing.Item
                        if itemObj then
                            local class = itemObj._class or (itemObj._data and itemObj._data.class) or (itemObj.ClassName) or ""
                            if class ~= "Lootbox" and class ~= "Gift" then
                                nonGiftListingId = listingId
                                break
                            end
                        end
                    end

                    if nonGiftListingId then
                        print(string.format("🔄 [Auto Sell] Phát hiện có quà '%s' trong rương nhưng chưa treo và quầy đầy. Đang giải phóng 1 slot...", configItem.name))
                        local removeRemote = ReplicatedStorage.Network:FindFirstChild("Booths_RemoveListing")
                        if removeRemote then
                            local success, removed = pcall(function() return removeRemote:InvokeServer(nonGiftListingId) end)
                            if success and removed then
                                task.wait(0.2) -- Giảm trễ xuống 0.2s cho nhanh
                                currentListingCount = currentListingCount - 1
                                local removedListingObj = myListings[nonGiftListingId]
                                if removedListingObj and removedListingObj.Item then
                                    local rUid = removedListingObj.Item:GetUID() or removedListingObj.Item._uid
                                    if rUid then
                                        listedUids[rUid] = nil
                                    end
                                end
                                myListings[nonGiftListingId] = nil
                            end
                        end
                    end
                end
            end
        end
    end

    if currentListingCount >= maxSlots then
        return
    end

    -- Khởi tạo danh sách tạm thời cho vòng quét này để chống kẹt ở cùng 1 UID
    local attemptedThisCycle = {}

    -- 2. Tự động treo bán Huge ngẫu nhiên (nếu bật SellAllHuge)
    if config.SellAllHuge and save.Inventory.Pet then
        local hugeCandidates = {}
        for uid, petData in pairs(save.Inventory.Pet) do
            local id = petData.id or "Unknown"
            local isHuge = id:lower():find("huge", 1, true)
            local isTitanic = id:lower():find("titanic", 1, true)

            if isHuge and not isTitanic and not listedUids[uid] and not isUidLocked(uid) and not attemptedThisCycle[uid] then
                -- Check if this Huge is explicitly configured in ItemsToSell
                local explicitlyConfigured = false
                if config.ItemsToSell then
                    for _, configItem in ipairs(config.ItemsToSell) do
                        local category = configItem.category
                        if category == "Pet" then
                            local itemObj = Items.From("Pet", petData)
                            local displayName = itemObj and itemObj:GetName() or petData.id
                            if displayName and itemMatchesConfig(petData, displayName, configItem) then
                                explicitlyConfigured = true
                                break
                            end
                        end
                    end
                end

                if not explicitlyConfigured then
                    local excluded = false
                    for _, exName in ipairs(config.HugeExclude or {}) do
                        if id:lower():find(exName:lower(), 1, true) then
                            excluded = true
                            break
                        end
                    end

                    if not excluded then
                        table.insert(hugeCandidates, {uid = uid, data = petData, id = id})
                    end
                end
            end
        end

        if #hugeCandidates > 0 then
            -- Fisher-Yates Shuffle
            for i = #hugeCandidates, 2, -1 do
                local j = math.random(1, i)
                hugeCandidates[i], hugeCandidates[j] = hugeCandidates[j], hugeCandidates[i]
            end

            for _, candidate in ipairs(hugeCandidates) do
                -- Luôn chừa ít nhất 1 slot trống cho các gói quà (Lootbox/gifts)
                if currentListingCount >= (maxSlots - 1) then break end

                local uid = candidate.uid
                local petData = candidate.data
                local id = candidate.id
                local itemObj = Items.From("Pet", petData)

                local fakeConfig = {
                    price = config.HugePrice or "-10%",
                    fallback = nil
                }
                local price, rapVal = calculateTargetPrice(itemObj, petData, "Pet", fakeConfig)

                if price > 0 then
                    attemptedThisCycle[uid] = true
                    local success, err = pcall(function()
                        return ReplicatedStorage.Network.Booths_CreateListing:InvokeServer(uid, price, 1)
                    end)

                    if success and err == true then
                        sessionListedUids[uid] = os.time() + 30 -- Thành công khóa 30s để đồng bộ
                        listedUids[uid] = true
                        currentListingCount = currentListingCount + 1
                    else
                        sessionListedUids[uid] = os.time() + 3 -- Thất bại (rate limit) chỉ khóa 3s để thử con khác
                        warn("❌ [Auto Sell Huge] Treo bán Huge thất bại cho UID: " .. tostring(uid) .. " (Error: " .. tostring(err) .. ")")
                    end
                    task.wait(0.2) -- Giảm trễ xuống 0.2s cho nhanh
                end
            end
        end
    end

    -- 3. Treo bán các vật phẩm thường khác trong ItemsToSell
    if config.ItemsToSell then
        for _, configItem in ipairs(config.ItemsToSell) do
            local category = configItem.category
            if not category then continue end

            -- Luôn chừa lại 1 slot trống cho quà tặng (Lootbox/gifts)
            local limit = (category == "Lootbox") and maxSlots or (maxSlots - 1)
            if currentListingCount >= limit then continue end

            local categoryItems = save.Inventory[category]
            if not categoryItems then continue end

            for uid, itemData in pairs(categoryItems) do
                if currentListingCount >= limit then break end
                if not listedUids[uid] and not isUidLocked(uid) and not attemptedThisCycle[uid] then
                    local itemObj = Items.From(category, itemData)
                    local displayName = itemObj and itemObj:GetName() or itemData.id

                    if displayName and itemMatchesConfig(itemData, displayName, configItem) then
                        local amountAvailable = itemData._am or 1
                        local amountToSell = math.min(amountAvailable, 50000)

                        if amountToSell > 0 then
                            local price, rapVal = calculateTargetPrice(itemObj, itemData, category, configItem)

                            if price > 0 then
                                attemptedThisCycle[uid] = true
                                local success, err = pcall(function()
                                    return ReplicatedStorage.Network.Booths_CreateListing:InvokeServer(uid, price, amountToSell)
                                end)

                                if success and err == true then
                                    sessionListedUids[uid] = os.time() + 30 -- Thành công khóa 30s để đồng bộ
                                    listedUids[uid] = true
                                    currentListingCount = currentListingCount + 1
                                else
                                    sessionListedUids[uid] = os.time() + 3 -- Thất bại (rate limit) chỉ khóa 3s để thử con khác
                                    warn("❌ [Auto Sell] Treo bán thất bại cho UID: " .. tostring(uid) .. " (Error: " .. tostring(err) .. ")")
                                end
                                task.wait(0.2) -- Giảm trễ xuống 0.2s cho nhanh
                            end
                        end
                    end
                end
            end
        end
    end
end

-- ================== REAL-TIME EVENT CONNECTORS ==================

-- Kích hoạt treo bán tức thì thời gian thực (0ms delay) ngay khi có người mua hàng
pcall(function()
    local con = ReplicatedStorage.Network["Booths: Add History"].OnClientEvent:Connect(function()
        task.wait(0.3) -- Chờ game cập nhật rương và quầy hàng sạch sẽ
        local owned = hasBooth()
        if owned and config.Enabled then
            task.spawn(runAutoSell)
        end
    end)
    consTable["History"] = con
end)

pcall(function()
    local con = ReplicatedStorage.Network["Booths_AnimatePurchase"].OnClientEvent:Connect(function(p1, p2, sellerId)
        if sellerId == localPlayer.UserId then
            task.wait(0.3)
            local owned = hasBooth()
            if owned and config.Enabled then
                task.spawn(runAutoSell)
            end
        end
    end)
    consTable["Animate"] = con
end)

-- ================== UNIFIED RUNSERVICE.HEARTBEAT LOOP ==================

local RunService = game:GetService("RunService")
local lastClaimCheck = 0
local lastSellCheck = 0
local lastMailCheck = 0
local lastHopCheck = 0

-- Lắng nghe các sự kiện bán hàng để cập nhật LastSaleTime cho Server Hop (chỉ khi bật ServerHop)
if config.ServerHop then
    pcall(function()
        local con = ReplicatedStorage.Network["Booths: Add History"].OnClientEvent:Connect(function()
            getgenv().PS99_LastSaleTime = os.time()
            print("💰 [Server Hop] Đã bán được hàng! Đặt lại đồng hồ đếm ngược server hop.")
        end)
        consTable["HistoryHop"] = con
    end)

    pcall(function()
        local con = ReplicatedStorage.Network["Booths_AnimatePurchase"].OnClientEvent:Connect(function(p1, p2, sellerId)
            if sellerId == localPlayer.UserId then
                getgenv().PS99_LastSaleTime = os.time()
                print("💰 [Server Hop] Đã bán được hàng (Animate)! Đặt lại đồng hồ đếm ngược server hop.")
            end
        end)
        consTable["AnimateHop"] = con
    end)
end

local hbCon = RunService.Heartbeat:Connect(function()
    if getgenv().AutoSellScriptId ~= scriptId then return end

    local now = os.clock()

    -- 1. Auto Claim Booths (Mỗi 2 giây)
    if now - lastClaimCheck >= checkInterval then
        lastClaimCheck = now
        if claimEnabled then
            task.spawn(function()
                local owned, boothModel = hasBooth()
                if not owned then
                    local bestBooth = findBestEmptyBooth()
                    if bestBooth then
                        local char = localPlayer.Character
                        local rootPart = char and char:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            local oldCFrame = rootPart.CFrame
                            if teleportToClaim then
                                rootPart.CFrame = CFrame.new(bestBooth.Position + Vector3.new(0, 3, 0))
                                task.wait(0.4)
                            end
                            local claimRemote = ReplicatedStorage.Network:FindFirstChild("Booths_ClaimBooth")
                            if claimRemote then
                                local success, result = pcall(function()
                                    return claimRemote:InvokeServer(bestBooth.ID)
                                end)
                                if success and result == true then
                                    task.wait(0.5)
                                    if teleportToClaim and oldCFrame then
                                        rootPart.CFrame = oldCFrame
                                    end
                                    task.spawn(function()
                                        -- Force chạy full check giá/số lượng lập tức khi vừa claim quầy
                                        pcall(runAutoSell, nil, true)
                                    end)
                                end
                            end
                        end
                    end
                end
            end)
        end
    end

    -- 2. Auto Sell & Price/Quantity Update (Mỗi 3 giây để đồng bộ rương và quầy siêu tốc)
    if now - lastSellCheck >= 3 then
        lastSellCheck = now
        task.spawn(function()
            local owned, boothModel = hasBooth()
            if owned and config.Enabled then
                pcall(runAutoSell, boothModel)
            end
        end)
    end

    -- 3. Auto Claim Mail (Mỗi 120 giây)
    if now - lastMailCheck >= 120 then
        lastMailCheck = now
        if config.ClaimMail then
            task.spawn(function()
                local claimMailRemote = ReplicatedStorage.Network:FindFirstChild("Mailbox: Claim All")
                if claimMailRemote then
                    pcall(function() claimMailRemote:InvokeServer() end)
                end
            end)
        end
    end

    -- 4. Server Hop check (Mỗi 30 giây) - Chỉ chạy khi bật ServerHop
    if config.ServerHop and now - lastHopCheck >= 30 then
        lastHopCheck = now
        task.spawn(function()
            local owned = hasBooth()
            if owned then
                if not getgenv().PS99_LastSaleTime then
                    getgenv().PS99_LastSaleTime = os.time()
                end
                local timeElapsed = os.time() - getgenv().PS99_LastSaleTime
                local hopThreshold = (config.ServerHopTime or 20) * 60

                if timeElapsed >= hopThreshold then
                    print(string.format("🚀 [Server Hop] Đã quá %d phút không bán được hàng. Đang tiến hành chuyển server...", math.floor(hopThreshold / 60)))
                    pcall(serverHop)
                else
                    local timeRemaining = hopThreshold - timeElapsed
                    print(string.format("[Server Hop Check] Còn %.1f phút trước khi hop server khác.", timeRemaining / 60))
                end
            else
                if getgenv().PS99_LastSaleTime then
                    getgenv().PS99_LastSaleTime = getgenv().PS99_LastSaleTime + 30
                end
            end
        end)
    end
end)
consTable["Heartbeat"] = hbCon

-- Thêm kết nối Rejoin vào consTable
pcall(function()
    local errCon = GuiService.ErrorMessageChanged:Connect(function()
        task.wait(5)
        pcall(function()
            TeleportService:Teleport(targetPlaceId, localPlayer)
        end)
    end)
    consTable["ErrorMessage"] = errCon
end)

-- Expose functions globally for debugging/testing
getgenv().runAutoSell = runAutoSell
getgenv().getMyBoothListings = getMyBoothListings
getgenv().hasBooth = hasBooth
