-- ⚙️ CONFIG RIÊNG CHO PET99
_G.Config = {
    UserID = "0d28ea66-a410-47c0-a707-06d7cb199774",
    discord_id = "698853568291143821",
    Note = "Pc",
}

-- 🧭 TELEPORT WORLD 1 NẾU PLACEID = 16498369169
local PlaceId = game.PlaceId
local TargetID = 16498369169

if PlaceId == TargetID then
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Network = ReplicatedStorage:WaitForChild("Network", 10)
    if Network then
        local TeleportRemote = Network:FindFirstChild("World1Teleport")
        if TeleportRemote then
            local success, err = pcall(function()
                TeleportRemote:InvokeServer()
            end)
            if success then
                print("[✅] Teleport World 1 thành công!")
            else
                warn("[⚠️] Teleport thất bại:", err)
            end
        else
            warn("[⚠️] Không tìm thấy World1Teleport")
        end
    else
        warn("[⚠️] Không tìm thấy Network")
    end
else
    print("[ℹ️] PlaceId không khớp, bỏ qua teleport.")
end

-- 🧩 SAU KHI TELEPORT HOẶC BỎ QUA => LOAD SCRIPT PET99
for i = 1, 5 do
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://cdn.yummydata.click/scripts/pet99"))()
    end)
    if success then
        print("[✅] Load script pet99 thành công!")
        break
    else
        warn("[⚠️] Load script thất bại, thử lại sau 5 giây.", err)
        task.wait(5)
    end
end
