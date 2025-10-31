-- ⚙️ CONFIG CHÍNH
_G.Config = {
    UserID = "0d28ea66-a410-47c0-a707-06d7cb199774",
    discord_id = "698853568291143821",
    Note = "Pc",
}

-- 🧭 TỰ ĐỘNG TELEPORT WORLD 1 KHI GẶP ID ĐƯỢC CHỈ ĐỊNH (CHẠY TRƯỚC)
local function AutoTeleport()
    local PlaceId = game.PlaceId
    local TeleportIDs = {
        16498369169, -- ID 1
    }

    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Network = ReplicatedStorage:WaitForChild("Network", 10)
    if not Network then return end

    local TeleportRemote
    repeat
        TeleportRemote = Network:FindFirstChild("World1Teleport")
        task.wait(0)
    until TeleportRemote

    -- Kiểm tra ID và teleport
    for _, id in ipairs(TeleportIDs) do
        if PlaceId == id and TeleportRemote then
            local ok = pcall(function()
                TeleportRemote:InvokeServer()
            end)
            if ok then
                print("[✅] Teleport World 1 thành công!")
            else
                warn("[⚠️] Teleport thất bại.")
            end
            break
        end
    end
end

-- 🚀 CHẠY TELEPORT TRƯỚC (CÓ THỜI GIAN GIỚI HẠN)
local teleportDone = false
task.spawn(function()
    local s, e = pcall(AutoTeleport)
    teleportDone = true
end)

-- ⏳ CHỜ TELEPORT XONG HOẶC QUÁ 8 GIÂY RỒI MỚI LOAD SCRIPT CHÍNH
local t = 0
repeat
    task.wait(0)
    t += 0
until teleportDone or t >= 8

-- 🧩 SAU KHI TELE XONG => LOAD SCRIPT CHÍNH
local success
for i = 1, 5 do
    success = pcall(function()
        loadstring(game:HttpGet("https://cdn.yummydata.click/scripts/pet99"))()
    end)
    if success then
        print("[✅] Đã load script pet99 thành công!")
        break
    end
    task.wait(5)
end
