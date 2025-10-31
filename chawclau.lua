setfpscap(3)
_G.Config = { UserID = "0d28ea66-a410-47c0-a707-06d7cb199774", discord_id = "698853568291143821" , Note = "Pc", } loadstring(game:HttpGet("https://raw.githubusercontent.com/skadidau/unfazedfree/refs/heads/main/pet99"))()
wait
-- 🧭 TỰ ĐỘNG TELEPORT WORLD 1 KHI GẶP ID ĐƯỢC CHỈ ĐỊNH
local PlaceId = game.PlaceId

-- 📋 NHẬP 3 ID CẦN KÍCH HOẠT (để trống 0 mai bạn điền)
local TeleportIDs = {
    16498369169, -- ID 1
}

-- 🔍 HÀM KIỂM TRA VÀ TELEPORT
local function checkAndTeleport()
    for _, id in ipairs(TeleportIDs) do
        if PlaceId == id then
            game:GetService('ReplicatedStorage').Network.World1Teleport
                :InvokeServer()
            break
        end
    end
end

-- ⚙️ CHẠY NGAY VÀ LẶP MỖI 60 GIÂY
checkAndTeleport()
while task.wait(60) do
    checkAndTeleport()
end

