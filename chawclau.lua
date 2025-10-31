-- ⚙️ GIỚI HẠN FPS
setfpscap(3)

-- 🧩 CONFIG + LOAD SCRIPT CHÍNH
_G.Config = {
    UserID = "0d28ea66-a410-47c0-a707-06d7cb199774",
    discord_id = "698853568291143821",
    Note = "Pc",
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/skadidau/unfazedfree/refs/heads/main/pet99"))()

-- ⏱️ CHỜ CHO SCRIPT CHÍNH TẢI
wait(2)

-- 🧭 TỰ ĐỘNG TELEPORT WORLD 1 KHI GẶP ID ĐƯỢC CHỈ ĐỊNH
local PlaceId = game.PlaceId

-- 📋 NHẬP DANH SÁCH ID CẦN TELE (để trống hoặc thêm sau)
local TeleportIDs = {
    16498369169, -- ID 1     
}

-- 🔍 HÀM KIỂM TRA VÀ TELEPORT
local function checkAndTeleport()
    for _, id in ipairs(TeleportIDs) do
        if id ~= 0 and PlaceId == id then
            local remote = game:GetService("ReplicatedStorage").Network:FindFirstChild("World1Teleport")
            if remote then
                pcall(function()
                    remote:InvokeServer()
                end)
            end
            break
        end
    end
end

-- ⚙️ CHẠY NGAY VÀ LẶP MỖI 60 GIÂY
checkAndTeleport()
while task.wait(30) do
    checkAndTeleport()
end
