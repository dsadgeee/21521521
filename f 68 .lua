-- ================== AUTO SEND MAIL - HUGE & EXCLUSIVE EGGS ==================
repeat task.wait() until game:IsLoaded()

local HttpService = game:GetService('HttpService')
local player = game.Players.LocalPlayer
local Network = require(game.ReplicatedStorage.Library.Client.Network)
local Save = require(game.ReplicatedStorage.Library.Client.Save)

-- ================== CONFIG ==================
local CONFIG = {
    -- Danh sách người nhận (gửi luân phiên, reset khi hết danh sách)
    RECEIVERS = {
        "TunTrapBoy",
        ""
    },
    
    -- Gửi tất cả Huge Pet
    SEND_HUGE = true,
    
    -- Gửi tất cả Exclusive Eggs
    SEND_EXCLUSIVE_EGGS = true,
    
    -- Thời gian chờ giữa các lần gửi (giây)
    SEND_DELAY = 10
}

-- ================== DATA LƯU TRẠNG THÁI GỬI ==================
local DATA_FILE = player.Name .. "_MailSent.json"

local function loadData()
    if isfile(DATA_FILE) then
        return HttpService:JSONDecode(readfile(DATA_FILE))
    else
        return { huge = {}, eggs = {} }
    end
end

local function saveData(data)
    writefile(DATA_FILE, HttpService:JSONEncode(data))
end

local sentData = loadData()

-- ================== UTILS ==================
local function getNextReceiver(sentList)
    for _, name in ipairs(CONFIG.RECEIVERS) do
        if not table.find(sentList, name) then
            return name
        end
    end
    -- Reset khi gửi hết 1 vòng
    table.clear(sentList)
    saveData(sentData)
    return CONFIG.RECEIVERS[1]
end

local function sendMail(toUser, itemId, category, uid, amount)
    local ok = pcall(function()
        Network.Invoke("Mailbox: Send", toUser, itemId, category, uid, amount)
    end)
    return ok
end

local function isExclusiveEgg(id)
    return id and string.find(string.lower(id), "exclusive egg")
end

-- ================== KIỂM TRA KHÔNG GỬI CHO CHÍNH MÌNH ==================
if table.find(CONFIG.RECEIVERS, player.Name) then
    warn("⚠️ Bạn đang trong danh sách nhận, sẽ không tự gửi cho mình!")
end

-- ================== GỬI HUGE PET ==================
task.spawn(function()
    if not CONFIG.SEND_HUGE then return end
    
    while task.wait(CONFIG.SEND_DELAY) do
        local inv = Save.Get()
        if not inv or not inv.Inventory or not inv.Inventory.Pet then continue end
        inv = inv.Inventory.Pet
        
        for uid, pet in pairs(inv) do
            if pet.id and string.find(pet.id, "Huge") then
                local receiver = getNextReceiver(sentData.huge)
                
                sendMail(receiver, pet.id, "Pet", uid, pet._am or 1)
                task.wait(1)
                
                -- Kiểm tra đã gửi thành công
                local afterInv = Save.Get().Inventory.Pet
                if not afterInv or not afterInv[uid] then
                    print("🎁 Gửi Huge:", pet.id, "→", receiver)
                    table.insert(sentData.huge, receiver)
                    saveData(sentData)
                    break
                end
            end
        end
    end
end)

-- ================== GỬI EXCLUSIVE EGGS ==================
task.spawn(function()
    if not CONFIG.SEND_EXCLUSIVE_EGGS then return end
    
    while task.wait(CONFIG.SEND_DELAY) do
        local inv = Save.Get()
        if not inv or not inv.Inventory or not inv.Inventory.Egg then continue end
        inv = inv.Inventory.Egg
        
        for uid, egg in pairs(inv) do
            if isExclusiveEgg(egg.id) then
                local receiver = getNextReceiver(sentData.eggs)
                
                sendMail(receiver, egg.id, "Egg", uid, egg._am or 1)
                task.wait(1)
                
                -- Kiểm tra đã gửi thành công
                local afterInv = Save.Get().Inventory.Egg
                if not afterInv or not afterInv[uid] then
                    print("🥚 Gửi Egg:", egg.id, "→", receiver)
                    table.insert(sentData.eggs, receiver)
                    saveData(sentData)
                    break
                end
            end
        end
    end
end)

print("✅ Auto Send Mail đã chạy!")
print("📋 Gửi Huge:", CONFIG.SEND_HUGE and "BẬT" or "TẮT")
print("📋 Gửi Exclusive Eggs:", CONFIG.SEND_EXCLUSIVE_EGGS and "BẬT" or "TẮT")
print("👥 Người nhận:", table.concat(CONFIG.RECEIVERS, ", "))
