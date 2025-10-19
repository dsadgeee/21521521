-- ================================
-- ⚙️ CONFIG
-- ================================
getgenv().Config = {
    Mode = 'SendAndReceive', -- "SendOnly" | "ReceiveOnly" | "SendAndReceive"
    ReceiverNames = {'amigaming2000', 'kirito_Huyk7', 'mikeythe1boss', 'DreamSoa6', 'DreamSoCow', 'DreamSoPig', 'TunTrapBoy', 'z1c7is', 'dream_cute0809'},
    PetName = 'Headless Horseman',
    WeightCondition = '<2',
    GiftDelay = 0.5,
    KickWhenReceiverHas = 85,
}

-- ================================
-- ⚙️ SERVICES
-- ================================
local Players = game:GetService('Players')
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local player = Players.LocalPlayer
local Backpack = player:WaitForChild('Backpack')

local GameEvents = ReplicatedStorage:WaitForChild('GameEvents')
local PetGiftingService = GameEvents:WaitForChild('PetGiftingService')
local GiftPetEvent = GameEvents:WaitForChild('GiftPet')
local AcceptGiftEvent = GameEvents:WaitForChild('AcceptPetGift')

-- ================================
-- 🧩 TIỆN ÍCH CHUNG
-- ================================
local function getWeightFromName(petName)
    local weight = string.match(petName, '%[(%d+%.?%d*)%s*KG%]')
    return weight and tonumber(weight) or nil
end

local function checkWeight(weight, condition)
    local op, value = string.match(condition, '([<>]=?)([%d%.]+)')
    value = tonumber(value)
    if not (op and value) then return false end
    if op == '>' then return weight > value
    elseif op == '<' then return weight < value
    elseif op == '>=' then return weight >= value
    elseif op == '<=' then return weight <= value end
    return false
end

local function equipPet(petTool)
    if not player.Character then return false end
    for _, t in ipairs(player.Character:GetChildren()) do
        if t:IsA('Tool') then
            t.Parent = player.Backpack
        end
    end
    petTool.Parent = player.Character
    task.wait(0.3)
    return petTool.Parent == player.Character
end

local function unequipAllPets()
    if not player.Character then return end
    for _, tool in ipairs(player.Character:GetChildren()) do
        if tool:IsA('Tool') then
            tool.Parent = Backpack
        end
    end
end

local function countPetInBackpack(petName)
    unequipAllPets()
    local count = 0
    for _, tool in ipairs(Backpack:GetChildren()) do
        if tool:IsA('Tool') and string.find(tool.Name, petName) then
            count += 1
        end
    end
    return count
end

-- ================================
-- 🎁 AUTO GỬI PET (nhiều người nhận)
-- ================================
local function getAvailableReceivers()
    local valid = {}
    for _, name in ipairs(getgenv().Config.ReceiverNames) do
        local receiver = Players:FindFirstChild(name)
        if receiver then
            table.insert(valid, receiver)
        end
    end
    return valid
end

local function giftPetToReceivers(petTool)
    local receivers = getAvailableReceivers()
    if #receivers == 0 then
        warn('⚠️ Không có người nhận nào online.')
        return false
    end

    local weight = getWeightFromName(petTool.Name)
    if not weight then
        warn('⚠️ Không đọc được trọng lượng:', petTool.Name)
        return false
    end

    if not equipPet(petTool) then return false end

    for _, receiver in ipairs(receivers) do
        print(("🎁 Gifting '%s' (%.2f KG) cho @%s"):format(petTool.Name, weight, receiver.Name))
        PetGiftingService:FireServer('GivePet', receiver)
        task.wait(getgenv().Config.GiftDelay)
    end
    return true
end

-- 🌀 Vòng lặp gửi (có rà soát lại sau mỗi lần gửi)
local function autoSendLoop()
    while task.wait(getgenv().Config.GiftDelay) do
        local foundPet = false
        for _, tool in ipairs(Backpack:GetChildren()) do
            if tool:IsA('Tool') and string.find(tool.Name, getgenv().Config.PetName) then
                local weight = getWeightFromName(tool.Name)
                if weight and checkWeight(weight, getgenv().Config.WeightCondition) then
                    foundPet = true
                    if giftPetToReceivers(tool) then
                        -- ✅ Sau khi gửi → rà lại Backpack
                        task.wait(0.2)
                        if countPetInBackpack(getgenv().Config.PetName) == 0 then
                            print('✅ Đã gửi hết tất cả pet thỏa điều kiện, kick.')
                            player:Kick('Đã gửi hết pet thỏa điều kiện.')
                            return
                        end
                    end
                end
            end
        end
        if not foundPet then
            print('✅ Không còn pet thỏa điều kiện ' .. getgenv().Config.WeightCondition .. '. Kick.')
            player:Kick('Đã gửi hết pet thỏa điều kiện.')
            break
        end
    end
end

-- ================================
-- 🎁 AUTO NHẬN PET
-- ================================
local receivedCount = 0

GiftPetEvent.OnClientEvent:Connect(function(giftId, petName, sender)
    if not table.find(getgenv().Config.ReceiverNames, player.Name) then return end
    print('[AUTO-RECEIVE] 🎁 Nhận gift từ @' .. tostring(sender) .. ': ' .. tostring(petName))
    AcceptGiftEvent:FireServer(true, giftId)
    receivedCount += 1
end)

task.spawn(function()
    while task.wait(6) do
        if table.find(getgenv().Config.ReceiverNames, player.Name) then
            local count = countPetInBackpack(getgenv().Config.PetName)
            print(('📦 [%s] Đang có %d pet "%s" trong Backpack.'):format(player.Name, count, getgenv().Config.PetName))
            if count >= getgenv().Config.KickWhenReceiverHas then
                print('⛔ Đã đạt giới hạn ' .. getgenv().Config.KickWhenReceiverHas .. ' pet. Tự động kick.')
                player:Kick('Đã nhận đủ ' .. getgenv().Config.KickWhenReceiverHas .. ' pet.')
                break
            end
        end
    end
end)

-- ================================
-- 🚀 KÍCH HOẠT
-- ================================
task.spawn(function()
    if getgenv().Config.Mode == 'SendOnly' then
        autoSendLoop()
    elseif getgenv().Config.Mode == 'ReceiveOnly' then
        print('🎧 Chế độ nhận pet đang hoạt động...')
    elseif getgenv().Config.Mode == 'SendAndReceive' then
        if not table.find(getgenv().Config.ReceiverNames, player.Name) then
            print('🚀 Acc gửi bắt đầu hoạt động...')
            task.spawn(autoSendLoop)
        else
            print('🤖 Acc nhận chỉ hoạt động nhận pet & kiểm tra balo.')
        end
    end
end)

local player = game.Players.LocalPlayer

-- 📝 Danh sách đường dẫn thủ công muốn xoá
local ManualPathsToDelete = {
    'workspace.GardenCoinShop',
    'workspace.Debris',
    'workspace.Interaction.UpdateItems.WitchesBrewEvent.PotionShelf',
    'workspace.Interaction.UpdateItems.WitchesBrewEvent.WitchesBrewLeaderboard',
    'workspace.Interaction.UpdateItems.WitchesBrewEvent.WitchesBrewPlate',
    'workspace.Interaction.UpdateItems.WitchesBrewEvent.Witch.Broom',
    'workspace.Interaction.UpdateItems.HalloweenMarketEvent.Casket',
    'workspace.Interaction.UpdateItems.HalloweenMarketEvent["Devious Pumpkin"]',
    'workspace.Interaction.UpdateItems.HalloweenMarketEvent.HalloweenEloise',
    'workspace.Interaction.UpdateItems.HalloweenMarketEvent.HalloweenLights',
    'workspace.Interaction.UpdateItems.HalloweenMarketEvent.HalloweenPlate',
    'workspace.Interaction.UpdateItems.HalloweenMarketEvent.HalloweenSteven',
    'workspace.Interaction.UpdateItems.HalloweenMarketEvent.Model1',
    'workspace.Interaction.UpdateItems.HalloweenMarketEvent:GetChildren()[11]',
    'workspace.Interaction.UpdateItems.HalloweenMarketEvent.Model2',
    'workspace.Interaction.UpdateItems.HalloweenMarketEvent.PumpkinLight',
    'workspace.Interaction.UpdateItems.HalloweenMarketEvent.CandyCornSpecialCurrencyUIOverlap',
    -- Thêm đường dẫn khác tại đây
}

-- 🌟 Ẩn phần hiển thị của Part nhưng giữ nguyên Prompt + thư mục con
local function hidePartVisualButKeepContents(part)
    part.Transparency = 1
    part.CastShadow = false
    part.CanCollide = false
    part.CanTouch = false
    part.CanQuery = false

    -- Xoá các mesh / decal bên trong part (nếu có)
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

-- 🧹 Xoá phần hiển thị cây/quả, giữ Prompt & folder bên trong
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

-- 🌳 Hàm xử lý cây & quả
local function clearPlantAndFruits(plant)
    clearFolderVisualButKeepPrompt(plant)
    local fruits = plant:FindFirstChild('Fruits')
    if fruits then
        for _, fruit in ipairs(fruits:GetChildren()) do
            clearFolderVisualButKeepPrompt(fruit)
        end
    end
end

-- 🧼 Hàm xoá đường dẫn thủ công
local function deleteManualPaths()
    for _, path in ipairs(ManualPathsToDelete) do
        local success, target = pcall(function()
            return loadstring('return ' .. path)()
        end)
        if success and target then
            warn('Xóa theo đường dẫn:', path)
            target:Destroy()
        end
    end
end

-- 🧼 Vòng lặp dọn map cũ liên tục
spawn(function()
    while task.wait(2) do
        pcall(function()
            -- ❌ Xoá Lighting object
            for _, obj in ipairs(game:GetService('Lighting'):GetChildren()) do
                obj:Destroy()
            end

            -- ❌ Xoá Debris
            if workspace:FindFirstChild('Debris') then
                for _, obj in ipairs(workspace.Debris:GetChildren()) do
                    obj:Destroy()
                end
            end

            -- ❌ Xoá Terrain
            if workspace:FindFirstChild('Terrain') then
                for _, obj in ipairs(workspace.Terrain:GetChildren()) do
                    obj:Destroy()
                end
            end

            -- 🧹 Xoá theo đường dẫn thủ công
            deleteManualPaths()

            -- 🌾 Dọn toàn bộ Farm
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

                                -- 🌿 Cây & quả
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

                                -- 🧱 Deco, Fence, Cosmetic
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
        end)
    end
end)

print('✅ Script đã thêm phần xoá đường dẫn thủ công 🌿✨')
