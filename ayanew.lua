-- log2

--============= UTIL: LOG & SAFE INVOKES =====================
local LOG = { verbose = false } -- set true to see logs
local function log(...)
    if LOG.verbose then
        print(...)
    end
end
local function warnlog(...)
    -- always keep warnings visible (rare)
    warn(...)
end

local function SafeCall(fn, ...)
    local args = { ... }
    local ok, res = pcall(function()
        return fn(table.unpack(args))
    end)
    return ok, res
end

local function SafeInvoke(obj, method, ...)
    local args = { ... }
    for attempt = 1, 5 do
        local ok, result = pcall(function()
            return obj[method](obj, table.unpack(args))
        end)
        if ok then
            return true, result
        end
        task.wait(math.min(0.25 * (2 ^ (attempt - 1)), 2))
    end
    return false, nil
end

local function RF(obj, ...)
    return SafeInvoke(obj, 'InvokeServer', ...)
end
local function EV(obj, ...)
    return SafeInvoke(obj, 'FireServer', ...)
end
--============= ANTI-AFK (Full Safe + Jump Simulation) =======================
local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer
local VirtualUser = game:GetService('VirtualUser')
local VirtualInputManager = game:GetService('VirtualInputManager')

-- 🛡️ Chống AFK cơ bản bằng VirtualUser
LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

-- 🧠 Hàm tạo khoảng thời gian ngẫu nhiên (±30 giây)
local function randomWait(base)
    local variation = math.random(-30, 30)
    return math.max(60, base + variation)
end

-- 🤸 Nhảy mô phỏng mỗi 5 phút ±30s
task.spawn(function()
    while task.wait(randomWait(300)) do
        VirtualUser:CaptureController()
        VirtualUser:SetKeyDown('0x20') -- phím Space
        task.wait(0.5)
        VirtualUser:SetKeyUp('0x20')
    end
end)

-- 💨 Mô phỏng nhấn Space thực bằng VirtualInputManager (song song)
function AFK()
    while task.wait(randomWait(300)) do
        VirtualInputManager:SendKeyEvent(true, 'Space', false, game)
        task.wait(0.5)
        VirtualInputManager:SendKeyEvent(false, 'Space', false, game)
        print('[Anti-AFK] Jumped using VirtualInputManager.')
    end
end

spawn(AFK)

-- 🧩 Tắt Idle Tracking gốc của game
pcall(function()
    game.ReplicatedStorage.Network['Idle Tracking: Stop Timer']:FireServer()
    local scripts = LocalPlayer.PlayerScripts.Scripts.Core
    scripts['Idle Tracking'].Enabled = false
    scripts['Server Closing'].Enabled = false
end)
local Players = game:GetService('Players')
local player = Players.LocalPlayer

-- ⚙️ Cấu hình: Bật/Tắt tính năng xoá player khác
local KEEP_ONLY_LOCALPLAYER = true

-- 🧍‍♂️ Hàm xoá tất cả player khác
local function removeOtherPlayers()
    if not KEEP_ONLY_LOCALPLAYER then
        return
    end
    for _, plr in ipairs(Players:GetChildren()) do
        if plr ~= player then
            pcall(function()
                plr:Destroy()
            end)
        end
    end
end

-- 🚫 Khi có player mới join -> xoá ngay và quét lại toàn bộ
Players.PlayerAdded:Connect(function(plr)
    if not KEEP_ONLY_LOCALPLAYER then
        return
    end
    if plr ~= player then
        pcall(function()
            plr:Destroy()
        end)
    end
    removeOtherPlayers()
end)

-- 🧹 Khi có player rời -> đảm bảo danh sách sạch
Players.PlayerRemoving:Connect(function(_)
    task.defer(removeOtherPlayers)
end)

-- ⏳ Vòng kiểm tra liên tục để đảm bảo không lọt player ẩn
task.spawn(function()
    while task.wait(3) do
        removeOtherPlayers()
    end
end)

-- Chạy lần đầu tiên
removeOtherPlayers()

-- 📝 Danh sách đường dẫn thủ công muốn xoá
local ManualPathsToDelete = {
    'workspace.GardenCoinShop',
    'workspace.Debris',
    'workspace.Interaction.UpdateItems.WitchesBrewEvent.PotionShelf',
    'workspace.Interaction.UpdateItems.WitchesBrewEvent.WitchesBrewLeaderboard',
    'workspace.Interaction.UpdateItems.WitchesBrewEvent.WitchesBrewPlate',
    'workspace.Interaction.UpdateItems.WitchesBrewEvent.Witch.Broom',
    'workspace.Interaction.UpdateItems.HalloweenMarketEvent.Casket',
    "workspace.Interaction.UpdateItems.HalloweenMarketEvent['Devious Pumpkin']",
    'workspace.Interaction.UpdateItems.HalloweenMarketEvent.HalloweenEloise',
    'workspace.Interaction.UpdateItems.HalloweenMarketEvent.HalloweenLights',
    'workspace.Interaction.UpdateItems.HalloweenMarketEvent.HalloweenPlate',
    'workspace.Interaction.UpdateItems.HalloweenMarketEvent.HalloweenSteven',
    'workspace.Interaction.UpdateItems.HalloweenMarketEvent.Model1',
    'workspace.Interaction.UpdateItems.HalloweenMarketEvent.Model2',
    'workspace.Interaction.UpdateItems.HalloweenMarketEvent.PumpkinLight',
    'workspace.Interaction.UpdateItems.HalloweenMarketEvent.CandyCornSpecialCurrencyUIOverlap',
    'workspace.HalloweenOuter',
    'workspace.FlyBorder',
    'workspace.BlockPartyOuter',
}

-- 🌟 Ẩn phần hiển thị của Part nhưng giữ nguyên Prompt + thư mục con
local function hidePartVisualButKeepContents(part)
    part.Transparency = 1
    part.CastShadow = false
    part.CanCollide = false
    part.CanTouch = false
    part.CanQuery = false

    for _, child in ipairs(part:GetChildren()) do
        if
            child:IsA('SpecialMesh')
            or child:IsA('Decal')
            or child:IsA('MeshPart')
            or child:IsA('UnionOperation')
        then
            child:Destroy()
        end
    end
end

-- 🧹 Xoá phần hiển thị folder nhưng giữ Prompt
local function clearFolderVisualButKeepPrompt(folder)
    for _, desc in ipairs(folder:GetDescendants()) do
        if desc:IsA('BasePart') then
            local prompt = desc:FindFirstChildWhichIsA('ProximityPrompt')
            if prompt then
                hidePartVisualButKeepContents(desc)
            else
                desc:Destroy()
            end
        elseif
            desc:IsA('MeshPart')
            or desc:IsA('UnionOperation')
            or desc:IsA('Decal')
        then
            desc:Destroy()
        end
    end
end

-- 🌳 Xoá cây & quả
local function clearPlantAndFruits(plant)
    clearFolderVisualButKeepPrompt(plant)
    local fruits = plant:FindFirstChild('Fruits')
    if fruits then
        for _, fruit in ipairs(fruits:GetChildren()) do
            clearFolderVisualButKeepPrompt(fruit)
        end
    end
end

-- 🧼 Xoá đường dẫn thủ công
local function deleteManualPaths()
    for _, path in ipairs(ManualPathsToDelete) do
        local success, target = pcall(function()
            return loadstring('return ' .. path)()
        end)
        if success and target then
            target:Destroy()
        end
    end
end

-- 🧹 Xoá plot người chơi khác
local function deleteOtherPlayerPlots()
    local plots = workspace:FindFirstChild('__THINGS')
        and workspace.__THINGS:FindFirstChild('Plots')
    if plots then
        for _, plot in ipairs(plots:GetChildren()) do
            local sign = plot:FindFirstChild('Build')
                and plot.Build:FindFirstChild('Sign')
            local isMine = false
            if sign then
                for _, gui in ipairs(sign:GetDescendants()) do
                    if gui:IsA('TextLabel') and gui.Text:find(player.Name) then
                        isMine = true
                        break
                    end
                end
            end
            if not isMine then
                plot:Destroy()
            end
        end
    end
end

-- 🧼 Vòng lặp dọn map cũ liên tục
task.spawn(function()
    while task.wait(2) do
        pcall(function()
            for _, obj in ipairs(game:GetService('Lighting'):GetChildren()) do
                obj:Destroy()
            end
            if workspace:FindFirstChild('Debris') then
                for _, obj in ipairs(workspace.Debris:GetChildren()) do
                    obj:Destroy()
                end
            end
            if workspace:FindFirstChild('Terrain') then
                workspace.Terrain:Clear()
            end
            deleteManualPaths()
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
                            if not isMine then
                                subFarm:Destroy()
                            else
                                local important = subFarm.Important
                                if
                                    important:FindFirstChild('Plants_Physical')
                                then
                                    for _, plant in
                                        ipairs(
                                            important.Plants_Physical:GetChildren()
                                        )
                                    do
                                        clearPlantAndFruits(plant)
                                    end
                                end
                                for _, folderName in ipairs({
                                    'Decorations',
                                    'Fences',
                                    'Cosmetics',
                                }) do
                                    if important:FindFirstChild(folderName) then
                                        for _, obj in
                                            ipairs(
                                                important[folderName]:GetChildren()
                                            )
                                        do
                                            obj:Destroy()
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            deleteOtherPlayerPlots()
            removeOtherPlayers()
        end)
    end
end)

--============= HALLOWEEN DASHBOARD ==========================
local Rep = game:GetService('ReplicatedStorage')
local Network = Rep:WaitForChild('Network')
local Save = require(Rep.Library.Client.Save)
local PURCHASE = Network:FindFirstChild('EventUpgrades: Purchase')

local gui = Instance.new('ScreenGui', LocalPlayer:WaitForChild('PlayerGui'))
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.DisplayOrder = 999
gui.Name = 'HalloweenDashboard'

local function formatNumber(n)
    if not n then
        return '0'
    end
    if n >= 1e9 then
        return string.format('%.2fB', n / 1e9)
    elseif n >= 1e6 then
        return string.format('%.2fM', n / 1e6)
    elseif n >= 1e3 then
        return string.format('%.1fK', n / 1e3)
    else
        return tostring(math.floor(n))
    end
end

local function getData()
    return Save.Get() or {}
end
local function getUpgradeLevel(name)
    return (getData().EventUpgrades or {})[name] or 0
end
local function getCurrencies()
    local cur = (getData().Inventory and getData().Inventory.Currency) or {}
    local result = {}
    for _, info in pairs(cur) do
        result[info.id] = info._am or 0
    end
    return result
end

local overlay = Instance.new('Frame', gui)
overlay.Size = UDim2.new(1, 0, 1, 0)
overlay.BackgroundColor3 = Color3.new(0, 0, 0)
overlay.BackgroundTransparency = 0.4
overlay.BorderSizePixel = 0

local toggleButton = Instance.new('TextButton', gui)
toggleButton.Size = UDim2.new(0, 50, 0, 50)
toggleButton.Position = UDim2.new(0, 10, 0.5, -25)
toggleButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
toggleButton.Text = 'MT'
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.Font = Enum.Font.GothamBold
toggleButton.TextSize = 20
toggleButton.ZIndex = 1000
toggleButton.MouseButton1Click:Connect(function()
    overlay.Visible = not overlay.Visible
end)

local main = Instance.new('Frame', overlay)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.Size = UDim2.new(0, 520, 0, 420)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
main.BackgroundTransparency = 0.3
main.BorderSizePixel = 0
main.ZIndex = 999

local title = Instance.new('TextLabel', main)
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = '🎃 HALLOWEEN DASHBOARD'
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255, 170, 0)
title.TextSize = 28
title.ZIndex = 1000

-- ⏱️ Uptime label
local uptimeLabel = Instance.new('TextLabel', main)
uptimeLabel.Size = UDim2.new(1, 0, 0, 28)
uptimeLabel.Position = UDim2.new(0, 0, 0, 60)
uptimeLabel.BackgroundTransparency = 1
uptimeLabel.Font = Enum.Font.Gotham
uptimeLabel.TextSize = 22
uptimeLabel.TextColor3 = Color3.fromRGB(255, 255, 120)
uptimeLabel.Text = '⏱️ Uptime: 00:00:00'
uptimeLabel.ZIndex = 1000

local scroll = Instance.new('ScrollingFrame', main)
scroll.Size = UDim2.new(1, -20, 1, -60)
scroll.Position = UDim2.new(0, 10, 0, 90)
scroll.BackgroundTransparency = 1
scroll.CanvasSize = UDim2.new(0, 0, 0, 600)
scroll.ScrollBarThickness = 6
scroll.ZIndex = 999

local labels = { currencies = {}, upgrades = {} }
local currencyList = { 'Diamonds', 'HalloweenCoins', 'Coins' }
local y = 0

local header1 = Instance.new('TextLabel', scroll)
header1.Text = '💰 [CURRENCY]'
header1.Size = UDim2.new(1, 0, 0, 30)
header1.BackgroundTransparency = 1
header1.TextColor3 = Color3.fromRGB(0, 255, 150)
header1.Font = Enum.Font.GothamBold
header1.TextSize = 28
header1.ZIndex = 999
y = 40

for _, name in ipairs(currencyList) do
    local lbl = Instance.new('TextLabel', scroll)
    lbl.Position = UDim2.new(0, 10, 0, y)
    lbl.Size = UDim2.new(1, -20, 0, 28)
    lbl.BackgroundTransparency = 1
    lbl.TextColor3 = Color3.new(1, 1, 1)
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 28
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Text = '• ' .. name .. ' = 0'
    lbl.ZIndex = 999
    labels.currencies[name] = lbl
    y += 32
end

local header2 = Instance.new('TextLabel', scroll)
header2.Text = '⚙️ [UPGRADES]'
header2.Position = UDim2.new(0, 0, 0, y + 10)
header2.Size = UDim2.new(1, 0, 0, 30)
header2.BackgroundTransparency = 1
header2.TextColor3 = Color3.fromRGB(255, 200, 0)
header2.Font = Enum.Font.GothamBold
header2.TextSize = 28
header2.ZIndex = 999
y += 50

local AllUpgrades = {
    'HalloweenCandyMultiplier',
    'HalloweenTrickOrTreatLuck',
    'HalloweenHugeLuck',
    'HalloweenTitanicLuck',
    'HalloweenMoreDiamonds',
    'HalloweenMoreWitchHats',
    'HalloweenEggLuck',
}
for _, name in ipairs(AllUpgrades) do
    local lbl = Instance.new('TextLabel', scroll)
    lbl.Position = UDim2.new(0, 10, 0, y)
    lbl.Size = UDim2.new(1, -20, 0, 28)
    lbl.BackgroundTransparency = 1
    lbl.TextColor3 = Color3.new(1, 1, 1)
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 28
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Text = '• ' .. name .. ' = 0/10'
    lbl.ZIndex = 999
    labels.upgrades[name] = lbl
    y += 32
end
scroll.CanvasSize = UDim2.new(0, 0, 0, y + 50)

-- 🕒 Bộ đếm thời gian hoạt động
local startTime = os.clock()
local function formatTime(seconds)
    local hours = math.floor(seconds / 3600)
    local minutes = math.floor((seconds % 3600) / 60)
    local secs = math.floor(seconds % 60)
    return string.format('%02d:%02d:%02d', hours, minutes, secs)
end

local function updateUI()
    local currencies = getCurrencies()
    for _, name in ipairs(currencyList) do
        local lbl = labels.currencies[name]
        if lbl then
            lbl.Text = string.format(
                '• %-15s = %s',
                name,
                formatNumber(currencies[name] or 0)
            )
        end
    end
    local up = getData().EventUpgrades or {}
    for _, name in ipairs(AllUpgrades) do
        local lvl = up[name] or 0
        local lbl = labels.upgrades[name]
        if lbl then
            lbl.Text = string.format('• %-25s = %d/10', name, lvl)
            lbl.TextColor3 = (lvl >= 10) and Color3.fromRGB(0, 255, 100)
                or Color3.new(1, 1, 1)
        end
    end
    -- ⏱️ Cập nhật thời gian chạy
    local elapsed = os.clock() - startTime
    uptimeLabel.Text = '⏱️ Uptime: ' .. formatTime(elapsed)
end

local Priority = {
    'HalloweenMoreDiamonds',
    'HalloweenMoreWitchHats',
    'HalloweenCandyMultiplier',
}
local DELAY, RUN_AUTO = 5, true
task.spawn(function()
    while task.wait(DELAY) do
        if not RUN_AUTO then
            continue
        end
        local done = true
        for _, n in ipairs(Priority) do
            if getUpgradeLevel(n) < 10 then
                done = false
                RF(PURCHASE, n)
            end
        end
        if done then
            local others = {}
            for _, n in ipairs(AllUpgrades) do
                if not table.find(Priority, n) and getUpgradeLevel(n) < 10 then
                    table.insert(others, n)
                end
            end
            if #others == 0 then
                break
            end
            RF(PURCHASE, others[math.random(1, #others)])
        end
        updateUI()
    end
end)

task.spawn(function()
    while task.wait(2) do
        updateUI()
    end
end)
updateUI()

-- ================== CONFIG ==================
local SIGN_RECHECK_INTERVAL = 10
local EGG_DELAY = 0.5
local MAX_EGG_SLOT = 5

local HOUSE_DELAYS = {
    [1] = 0.2,
    [2] = 0.2,
    [3] = 1,
    [4] = 60,
    [5] = 120,
}

local MAX_FALSE_LIMIT = 60 -- ❗ Số lần false liên tiếp để hop server

-- ================== SERVICES ==================
local Players = game:GetService('Players')
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local PLOTS = workspace:WaitForChild('__THINGS'):WaitForChild('Plots')
local Plots_Invoke = ReplicatedStorage:WaitForChild('Network')
    :WaitForChild('Plots_Invoke')
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService('HttpService')
local TeleportService = game:GetService('TeleportService')

-- ================== SERVER HOP ==================
local function alternateServersRequest()
    local response = request({
        Url = 'https://games.roblox.com/v1/games/'
            .. tostring(game.PlaceId)
            .. '/servers/Public?sortOrder=Asc&limit=100',
        Method = 'GET',
        Headers = { ['Content-Type'] = 'application/json' },
    })
    if response.Success then
        return response.Body
    else
        return nil
    end
end

local function getServer()
    local servers
    local success, _ = pcall(function()
        servers = HttpService:JSONDecode(
            game:HttpGet(
                'https://games.roblox.com/v1/games/'
                    .. tostring(game.PlaceId)
                    .. '/servers/Public?sortOrder=Asc&limit=100'
            )
        ).data
    end)

    if not success then
        print('⚠️ Error getting servers, using backup method')
        servers = HttpService:JSONDecode(alternateServersRequest()).data
    end

    local server = servers[Random.new():NextInteger(5, 100)]
    if server then
        return server
    else
        return getServer()
    end
end

local function hopServer()
    print(
        '🚀 Đủ lỗi false liên tiếp (30 lần)! Đang chuyển server mới...'
    )
    task.wait(2)
    pcall(function()
        TeleportService:TeleportToPlaceInstance(
            game.PlaceId,
            getServer().id,
            LocalPlayer
        )
    end)
end

-- ================== EGG HANDLER ==================
local falseCount = { [1] = 0, [2] = 0 }

local lastPurchaseTimes = {} -- 🕒 thời gian lần mua gần nhất mỗi house

local function purchaseEgg(plotId, slot, qty)
    qty = qty or 1

    local success, result = pcall(function()
        return Plots_Invoke:InvokeServer(plotId, 'PurchaseEgg', slot, qty)
    end)

    -- 🧩 Chỉ kiểm tra lỗi cho nhà 1 và 2
    if slot == 1 or slot == 2 then
        if success then
            if result == false then
                falseCount[slot] += 1
                warn(
                    string.format(
                        '[❌ HOUSE %d FALSE #%d]',
                        slot,
                        falseCount[slot]
                    )
                )
            else
                falseCount[slot] = 0
                print(
                    string.format('[✅ HOUSE %d]: %s', slot, tostring(result))
                )
            end
        else
            warn(
                string.format(
                    '[⚠️ HOUSE %d ERROR]: %s',
                    slot,
                    tostring(result)
                )
            )
        end

        if falseCount[slot] >= MAX_FALSE_LIMIT then
            hopServer()
        end
    else
        -- 🟢 Nhà 3, 4, 5: không in log lỗi
        pcall(function()
            Plots_Invoke:InvokeServer(plotId, 'PurchaseEgg', slot, qty)
        end)
    end

    lastPurchaseTimes[slot] = os.clock()
end

-- ================== THREAD CONTROL ==================
local activeThreads = {}

local function stopAllThreads()
    for _, ctrl in pairs(activeThreads) do
        ctrl.stopFlag = true
    end
    task.wait(0.05)
    activeThreads = {}
end

local function startEggThread(plotId, slot, delay, qty)
    qty = qty or 1
    local ctrl = { stopFlag = false }
    activeThreads[slot] = ctrl
    lastPurchaseTimes[slot] = os.clock()

    task.spawn(function()
        while not ctrl.stopFlag do
            purchaseEgg(plotId, slot, qty)

            local t = 0
            while t < delay and not ctrl.stopFlag do
                local since = os.clock() - lastPurchaseTimes[slot]
                task.wait(1)
                t += 1
                if math.floor(t) % 5 == 0 then
                    print(
                        string.format(
                            '⏱️ HOUSE %d: %.1f / %.1fs',
                            slot,
                            since,
                            delay
                        )
                    )
                end
            end
        end
    end)
end

-- ================== LOGIC DPS ==================
local function decideHousesByDPS(amountPerSec)
    local housesToUnlock = {}
    local eggQtyPerSlot = {}

    -- House 1: luôn mở khi > 0
    if amountPerSec > 0 then
        housesToUnlock[1] = true
        eggQtyPerSlot[1] = 3
    end

    -- House 2: mở khi > 1000
    if amountPerSec > 1000 then
        housesToUnlock[2] = true
        eggQtyPerSlot[2] = 3
    end

    -- House 3: chỉ mở khi 6000 < DPS <= 14000
    if
        (amountPerSec > 6000 and amountPerSec <= 14000)
        or amountPerSec > 25000
    then
        housesToUnlock[3] = true
        eggQtyPerSlot[3] = 1
    end

    -- House 4: chỉ mở khi 14000 < DPS <= 20000
    if amountPerSec > 14000 and amountPerSec <= 20000 then
        housesToUnlock[4] = true
        eggQtyPerSlot[4] = 1
    end

    -- House 5: mở khi DPS > 20000
    if amountPerSec > 20000 then
        housesToUnlock[5] = true
        eggQtyPerSlot[5] = 1
    end

    -- Chuyển từ table key=true sang list và eggQty chuẩn
    local finalHouses, finalEggQty = {}, {}
    for h = 1, MAX_EGG_SLOT do
        if housesToUnlock[h] then
            table.insert(finalHouses, h)
        end
        finalEggQty[h] = eggQtyPerSlot[h] or 0
    end

    return finalHouses, finalEggQty
end

-- ================== FIND MY PLOT ==================
local function findMyPlotAndAmount()
    for _, plot in pairs(PLOTS:GetChildren()) do
        local sign = plot:FindFirstChild('Build')
            and plot.Build:FindFirstChild('Sign')
        if sign then
            for _, gui in pairs(sign:GetDescendants()) do
                if gui:IsA('TextLabel') and gui.Text:find(LocalPlayer.Name) then
                    return plot, 99999 -- Giả lập DPS (bạn có thể thay bằng hàm đọc DPS thật)
                end
            end
        end
    end
    return nil, 0
end

-- ================== MAIN LOOP (Delay fixed + Log) ==================
local lastPlotId, lastHouses = nil, {}

task.spawn(function()
    while true do
        local plot, amount = findMyPlotAndAmount()
        if plot then
            local plotId = tonumber(plot:GetAttribute('ID'))
                or tonumber(plot.Name)
                or 1
            local housesToUnlock, eggQtyPerSlot = decideHousesByDPS(amount)

            local housesJson = HttpService:JSONEncode(housesToUnlock)
            local lastHousesJson = HttpService:JSONEncode(lastHouses)

            if plotId ~= lastPlotId or housesJson ~= lastHousesJson then
                print(
                    '🔁 Cập nhật lại thread, DPS thay đổi hoặc plot khác.'
                )
                stopAllThreads()
                for _, h in ipairs(housesToUnlock) do
                    local qty = eggQtyPerSlot[h] or 0
                    if qty > 0 then
                        local delay = HOUSE_DELAYS[h] or EGG_DELAY
                        print(
                            string.format(
                                '▶️ Bắt đầu HOUSE %d với delay %.1f giây',
                                h,
                                delay
                            )
                        )
                        startEggThread(plotId, h, delay, qty)
                    end
                end
                lastPlotId, lastHouses = plotId, housesToUnlock
            end
        end
        task.wait(SIGN_RECHECK_INTERVAL)
    end
end)

--============= PET & EGG MANAGER + CLAIM ===================
local player = LocalPlayer
local HPillarItems = require(Rep.Library.Directory.HPillarItems)
local EggHalloween = require(Rep.Library.Directory.EggHalloween)
local Rarity = require(Rep.Library.Directory.Rarity)

local PET_SLOTS = { 1, 2, 3, 4, 5, 6, 7, 8, 9 }
local EGG_SLOTS = { 10 }
local UPDATE_INTERVAL = 2.5

local function parseRate(text)
    if not text then
        return 0
    end
    text = text:gsub(',', ''):lower()
    local num, suffix = text:match('([%d%.]+)%s*([kmbtq]*)')
    num = tonumber(num)
    if not num then
        return 0
    end
    local mult = { k = 1e3, m = 1e6, b = 1e9, t = 1e12, q = 1e15 }
    return num * (mult[suffix] or 1)
end

local function getCandyMultiplier()
    local upgrades = (Save.Get().EventUpgrades or {})
    local level = upgrades.HalloweenCandyMultiplier or 0
    return 1 + 0.1 * level
end
local CandyMultiplier = getCandyMultiplier()

local function getInventoryPets()
    local data = Save.Get()
    local inv = data and data.Inventory and data.Inventory.HPillar
    local pets, mapByUid = {}, {}
    if inv then
        for uid, info in pairs(inv) do
            local id = info.id
            local base = HPillarItems[id]
            if base then
                local perSec = base.BaseMoneyPerSecond or 0
                local tier = info.pt or 0
                local shiny = info.sh or (info._uq and info._uq.sh)
                local tierMultiplier = { [0] = 1, [1] = 2, [2] = 4, [3] = 6 }
                local shinyMultiplier, sunnyShinyMultiplier = 2, 8
                perSec = perSec * (tierMultiplier[tier] or 1)
                if tier == 3 and shiny then
                    perSec = perSec * sunnyShinyMultiplier / tierMultiplier[3]
                elseif shiny then
                    perSec = perSec * shinyMultiplier
                end
                perSec = perSec * CandyMultiplier
                local entry = {
                    uid = uid,
                    id = id,
                    name = base.DisplayName or id,
                    power = perSec,
                    amount = info._am or 1,
                    tier = tier,
                    shiny = shiny,
                }
                table.insert(pets, entry)
                mapByUid[uid] = entry
            end
        end
    end
    table.sort(pets, function(a, b)
        return a.power > b.power
    end)
    return pets, mapByUid
end

local function getPlayerPlot()
    for _, plot in pairs(workspace.__THINGS.Plots:GetChildren()) do
        local sign = plot:FindFirstChild('Build')
            and plot.Build:FindFirstChild('Sign')
        if sign then
            for _, gui in pairs(sign:GetDescendants()) do
                if gui:IsA('TextLabel') and gui.Text:find(player.Name) then
                    return plot
                end
            end
        end
    end
    return nil
end

local function getPlacedPets(plot)
    local placed = {}
    local pillars =
        plot:WaitForChild('Interactable'):WaitForChild('Pillars'):GetChildren()
    for i, pillar in ipairs(pillars) do
        local base = pillar:FindFirstChild('Base')
        if base then
            local foundModel
            for _, model in pairs(workspace.__DEBRIS:GetChildren()) do
                local part = model:FindFirstChildWhichIsA('BasePart', true)
                if part and (part.Position - base.Position).Magnitude < 3 then
                    foundModel = model
                    break
                end
            end
            if foundModel then
                local uid = foundModel.Name
                local rate
                local petModel = foundModel:FindFirstChild('HalloweenPet')
                    or foundModel
                for _, obj in pairs(petModel:GetDescendants()) do
                    if
                        obj:IsA('TextLabel')
                        and (
                            obj.Text:find('/s')
                            or obj.Name:lower():find('rate')
                        )
                    then
                        rate = parseRate(
                            obj.Text:match('([%d%a%.]+)%s*/%s*s') or obj.Text
                        )
                        break
                    end
                end
                table.insert(
                    placed,
                    { slot = i, model = foundModel, uid = uid, power = rate }
                )
            end
        end
    end
    return placed
end

local function findWeakestPlaced(placed, invMap)
    local weakest, minPower = nil, math.huge
    for _, p in ipairs(placed) do
        local invEntry = invMap[p.uid]
        local power = invEntry and invEntry.power or p.power or 0
        if power < minPower then
            minPower = power
            weakest = { slot = p.slot, uid = p.uid, power = power }
        end
    end
    return weakest, minPower
end

local function handleHatchedEggs(plot)
    local placed = getPlacedPets(plot)
    for _, p in ipairs(placed) do
        for _, eggSlot in ipairs(EGG_SLOTS) do
            if p.slot == eggSlot then
                local hasEggText = false
                for _, obj in pairs(p.model:GetDescendants()) do
                    if
                        obj:IsA('TextLabel') and obj.Text:lower():find('egg')
                    then
                        hasEggText = true
                        break
                    end
                end
                if not hasEggText then
                    RF(Network.HalloweenWorld_PickUp, eggSlot)
                    task.wait()
                end
            end
        end
    end
end

local EGG_PRIORITY = {
    Mythical = { 'Coffin Egg' },
    Legendary = { 'Reaper Egg', 'Spider Egg' },
    Rare = { 'Bat Egg', 'Grave Egg' },
    Epic = { 'Ghost Egg', 'Cauldron Egg' },
    Basic = { 'Pumpkin Egg' },
}
local EGG_ORDER = { 'Mythical', 'Legendary', 'Rare', 'Epic', 'Basic' }

local function autoPlaceEggs()
    local data = Save.Get()
    local invEggs = data and data.Inventory and data.Inventory.EggHalloween
    if not invEggs then
        return
    end
    local eggs = {}
    for _, eggInfo in pairs(invEggs) do
        eggs[eggInfo.id] = eggInfo._am or 1
    end
    if next(eggs) == nil then
        return
    end
    local plot = getPlayerPlot()
    if not plot then
        return
    end
    local placed = getPlacedPets(plot)
    local occupied = {}
    for _, p in ipairs(placed) do
        occupied[p.slot] = true
    end
    for _, slot in ipairs(EGG_SLOTS) do
        if not occupied[slot] then
            local pick
            for _, rarity in ipairs(EGG_ORDER) do
                for _, eid in ipairs(EGG_PRIORITY[rarity] or {}) do
                    if eggs[eid] and eggs[eid] > 0 then
                        pick = eid
                        eggs[eid] -= 1
                        break
                    end
                end
                if pick then
                    break
                end
            end
            if not pick then
                local remaining = {}
                for rarityName, list in pairs(EGG_PRIORITY) do
                    if
                        rarityName ~= 'Mythical'
                        and rarityName ~= 'Legendary'
                    then
                        for _, eid in ipairs(list) do
                            local amt = eggs[eid] or 0
                            for i = 1, amt do
                                table.insert(remaining, eid)
                            end
                        end
                    end
                end
                if #remaining > 0 then
                    pick = remaining[math.random(1, #remaining)]
                    eggs[pick] -= 1
                end
            end
            if pick then
                RF(Network.HalloweenWorld_PlaceEgg, slot, pick)
                task.wait(0.1)
            end
        end
    end
end

local function autoEquipPets()
    local plot = getPlayerPlot()
    if not plot then
        return
    end
    local invPets, invMap = getInventoryPets()
    local placed = getPlacedPets(plot)
    local placedBySlot = {}
    for _, p in ipairs(placed) do
        placedBySlot[p.slot] = p
    end
    for _, slot in ipairs(PET_SLOTS) do
        if not placedBySlot[slot] then
            local best = invPets[1]
            if best then
                RF(Network.HalloweenWorld_PlacePet, slot, best.uid)
                task.wait()
                return
            end
        end
    end
    local weakest, weakPower = findWeakestPlaced(placed, invMap)
    local best = invPets[1]
    if weakest and best and best.power > weakPower then
        RF(Network.HalloweenWorld_PickUp, weakest.slot)
        task.wait(0.5)
        RF(Network.HalloweenWorld_PlacePet, weakest.slot, best.uid)
        task.wait()
    end
end

task.spawn(function()
    while task.wait(UPDATE_INTERVAL) do
        local ok, err = pcall(function()
            local plot = getPlayerPlot()
            if not plot then
                return
            end
            handleHatchedEggs(plot)
            autoPlaceEggs()
            autoEquipPets()
        end)
        if not ok and LOG.verbose then
            warnlog('Loop error:', err)
        end
    end
end)

task.spawn(function()
    while task.wait(5) do
        for i = 1, 10 do
            task.spawn(function()
                RF(Network.HalloweenWorld_Claim, i)
            end)
        end
    end
end)

--============= UPGRADE PRIORITY (FALLBACK) ==================
task.spawn(function()
    local function upgrade(name)
        local current = getUpgradeLevel(name)
        if current >= 10 then
            return false
        end
        RF(PURCHASE, name)
        task.wait(1.5)
        return true
    end
    while task.wait(1.5) do
        local doneAll = true
        for _, name in ipairs(Priority) do
            if getUpgradeLevel(name) < 10 then
                doneAll = false
                upgrade(name)
            end
        end
        if doneAll then
            local others = {}
            for _, name in ipairs(AllUpgrades) do
                if
                    not table.find(Priority, name)
                    and getUpgradeLevel(name) < 10
                then
                    table.insert(others, name)
                end
            end
            if #others == 0 then
                break
            end
            upgrade(others[math.random(1, #others)])
        end
    end
end)

--============= MAILING DIAMONDS ============================
for i = 1, 10 do
    print()
end

if not LPH_OBFUSCATED then
    getgenv().Settings = {
        Mailing = {
            ['Diamonds'] = {
                Class = 'Currency',
                Amount = 'All', -- gửi toàn bộ khi đạt ngưỡng
                MinDiamonds = 20000000, -- ngưỡng tối thiểu (ví dụ: 1 triệu)
            },
        },
        Users = {
            'DreamSoCow', -- người nhận
        },
        ['Split Items Evenly'] = false,
        ['Only Online Accounts'] = false,
        ['Developer Mode'] = false,
        [[ Thank you for using System Exodus <3! ]],
    }
end

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local M_Players = game:GetService('Players')
local M_ReplicatedStorage = game:GetService('ReplicatedStorage')
local M_HttpService = game:GetService('HttpService')
local M_LocalPlayer = M_Players.LocalPlayer

local M_Library = {}
local M_Client = {}
for _, v in next, M_ReplicatedStorage.Library.Client:GetChildren() do
    if v:IsA('ModuleScript') and not v:GetAttribute('NOLOAD') then
        local ok, mod = pcall(function()
            return require(v)
        end)
        if ok then
            M_Library[v.Name] = mod
            M_Client[v.Name] = mod
        end
    end
end
for _, v in next, M_ReplicatedStorage.Library:GetChildren() do
    if v:IsA('ModuleScript') and not v:GetAttribute('NOLOAD') then
        local ok, mod = pcall(function()
            return require(v)
        end)
        if ok then
            M_Library[v.Name] = mod
        end
    end
end

local M_NormalLibrary = M_ReplicatedStorage.Library
local M_PlayerSave = require(M_NormalLibrary.Client.Save)

local function M_GetDiamonds(ReturnUID)
    for i, v in next, M_PlayerSave.Get()['Inventory'].Currency do
        if v.id == 'Diamonds' then
            return ReturnUID and i or v._am
        end
    end
    return 0
end

local function M_GenerateDescription()
    local AdjectiveList = {
        'Bold',
        'Quick',
        'Happy',
        'Tiny',
        'Brave',
        'Clever',
        'Gentle',
        'Mighty',
        'Calm',
        'Loyal',
        'Bright',
        'Wise',
        'Fearless',
        'Vivid',
    }
    local NounList = {
        'Lion',
        'Castle',
        'Book',
        'Cloud',
        'Tiger',
        'Forest',
        'River',
        'Sword',
        'Galaxy',
        'Phoenix',
        'Knight',
        'Star',
        'Dragon',
    }
    local adj = AdjectiveList[math.random(#AdjectiveList)]
    local noun = NounList[math.random(#NounList)]
    return adj .. ' ' .. noun
end

local function M_SendMail(Username, Class, UID, Amount)
    local success, result = pcall(function()
        return M_Library.Network.Invoke(
            'Mailbox: Send',
            Username,
            M_GenerateDescription(),
            Class,
            UID,
            Amount
        )
    end)
    if result then
        print(
            string.format(
                '[Mailing] 💌 Sent %s %s to %s',
                tostring(Amount),
                Class,
                Username
            )
        )
        Settings.MailCost = 0
        Settings.DiamondsAvailable =
            math.floor(M_GetDiamonds() - Settings.MailCost)
    else
        warn('[Mailing] ❌ Send failed, retrying in 3s...')
        task.wait(3)
        return M_SendMail(Username, Class, UID, Amount)
    end
    return result
end

-- 💠 GỬI GEMS KHI ĐẠT NGƯỠNG
task.spawn(function()
    print(
        '[Mailing] 🚀 Bắt đầu module gửi kim cương tự động…'
    )

    while task.wait(40) do
        local DiamondsNow = M_GetDiamonds()
        local MinDiamonds = (Settings.Mailing.Diamonds.MinDiamonds or 0)
        local UID = M_GetDiamonds(true)

        if DiamondsNow >= MinDiamonds then
            local MailCost = Settings.MailCost or 0
            local Sendable = math.max(0, DiamondsNow - MailCost)

            if Sendable > 0 then
                print(
                    string.format(
                        '[Mailing] 💠 Đạt ngưỡng (%s ≥ %s) — gửi %s gems trừ phí %s',
                        DiamondsNow,
                        MinDiamonds,
                        Sendable,
                        MailCost
                    )
                )

                for _, Username in next, Settings.Users do
                    local ok = M_SendMail(Username, 'Currency', UID, Sendable)
                    if ok then
                        print(
                            string.format(
                                '[Mailing] ✅ Gửi thành công %s gems cho %s',
                                Sendable,
                                Username
                            )
                        )
                    else
                        warn(
                            '[Mailing] ⚠️ Gửi thất bại — thử lại sau'
                        )
                    end
                end
            else
                print(
                    string.format(
                        '[Mailing] 🔹 Có %s gems nhưng không đủ sau khi trừ phí.',
                        DiamondsNow
                    )
                )
            end
        else
            print(
                string.format(
                    '[Mailing] 💤 Chưa đạt ngưỡng tối thiểu (%s/%s)',
                    DiamondsNow,
                    MinDiamonds
                )
            )
        end
    end
end)
-- có cái lồz
task.spawn(function()
    local Rep = game:GetService('ReplicatedStorage')
    local Network = require(Rep.Library.Client.Network)
    local Directory = require(Rep.Library.Directory)
    local Types = require(Rep.Library.Items.Types)
    local InventoryCmds = require(Rep.Library.Client.InventoryCmds)
    local Player = game:GetService('Players').LocalPlayer

    -- Hàm lấy tên item an toàn
    local function getItemName(item)
        if type(item) == 'table' then
            if type(item.GetName) == 'function' then
                return item:GetName()
            elseif item.Name then
                return tostring(item.Name)
            else
                return '[Table]'
            end
        else
            return tostring(item)
        end
    end

    -- Kiểm tra đủ nguyên liệu
    local function hasIngredients(recipe)
        if not recipe.Ingredients or #recipe.Ingredients == 0 then
            return false
        end

        for _, ing in ipairs(recipe.Ingredients) do
            local amountNeeded = ing.Amount or 1
            local itemClone = ing.Item:Clone()
            if itemClone:IsA('Pet') then
                -- applyPetOptions nếu cần
            end
            if itemClone:CountAny() < amountNeeded then
                return false
            end
        end
        return true
    end

    -- Claim craft xong
    local function claimCraft(queuedEntry)
        local success, msg =
            Network.Invoke('HalloweenCraftingMachine_Claim', queuedEntry.UID)
        local resultName = getItemName(queuedEntry.Result)
        if success then
            print('✅ Claimed: ' .. resultName)
        else
            print('❌ Failed to claim: ' .. (msg or 'Unknown'))
        end
    end

    -- Tự động craft
    local function autoCraft(machineId, recipeIndex)
        local args = {
            [1] = machineId,
            [2] = recipeIndex,
            [3] = { ['shiny'] = false, ['pt'] = 0 },
        }
        Network.Invoke('HalloweenCraftingMachine_StartCraft', unpack(args))
        print(
            ('→ Sent craft request for recipe #%d on %s'):format(
                recipeIndex,
                machineId
            )
        )
    end

    -- In trạng thái recipe
    local function printRecipeStatus(recipe, queuedEntry)
        local resultName = getItemName(recipe.Result)
        local status
        if queuedEntry then
            if queuedEntry.Remaining and queuedEntry.Remaining <= 0 then
                status = '✅ Claimable'
            else
                status = '⏳ Crafting... ('
                    .. queuedEntry.Remaining
                    .. 's left)'
            end
        else
            status = hasIngredients(recipe) and '🟢 Ready to craft'
                or '🔴 Missing ingredients'
        end
        print(('  - %s → %s'):format(resultName, status))
    end

    while true do
        for machineId, machineData in pairs(Directory.HalloweenCraftingMachines) do
            print(
                '\n=== Machine: '
                    .. machineData.MachineName
                    .. ' (ID: '
                    .. machineId
                    .. ') ==='
            )

            local recipes = Network.Invoke(
                'HalloweenCraftingMachine_GetCurrentRecipes',
                machineId
            ) or {}
            local queue = Network.Invoke('HalloweenCraftingMachine_GetQueue')
                or {}

            -- 1. Claim craft xong
            for _, queuedEntry in ipairs(queue) do
                if (queuedEntry.Remaining or 0) <= 0 then
                    claimCraft(queuedEntry)
                else
                    local name = getItemName(queuedEntry.Result)
                    print(
                        '⏳ Still crafting: '
                            .. name
                            .. ' ('
                            .. queuedEntry.Remaining
                            .. 's left)'
                    )
                end
            end

            -- 2. Craft nếu đủ nguyên liệu
            for i, recipeData in ipairs(recipes) do
                local recipe = table.clone(recipeData)

                if
                    recipe.Result
                    and recipe.Result.class
                    and recipe.Result.data
                then
                    recipe.Result =
                        Types.From(recipe.Result.class, recipe.Result.data)
                end

                if recipe.Ingredients then
                    local newIngredients = {}
                    for _, ing in ipairs(recipe.Ingredients) do
                        if ing.Item and ing.Item.class and ing.Item.data then
                            local realItem =
                                Types.From(ing.Item.class, ing.Item.data)
                            table.insert(
                                newIngredients,
                                { Item = realItem, Amount = ing.Amount }
                            )
                        end
                    end
                    recipe.Ingredients = newIngredients
                end

                -- Kiểm tra queued
                local queuedEntry = nil
                for _, q in ipairs(queue) do
                    if q.RecipeIndex == i then
                        queuedEntry = q
                        break
                    end
                end

                printRecipeStatus(recipe, queuedEntry)

                -- Craft nếu đủ nguyên liệu và chưa đang craft
                if not queuedEntry and hasIngredients(recipe) then
                    autoCraft(machineId, i)
                end
            end
        end

        task.wait(5)
    end
end)
