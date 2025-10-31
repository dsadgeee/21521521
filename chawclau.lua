-- ⚙️ GIỚI HẠN FPS
setfpscap(3)

-- 🧭 TELEPORT WORLD 1 NGAY KHI GẶP ID CHỈ ĐỊNH
local TeleportIDs = {
    16498369169, -- ID 1     
}

-- 🧠 HÀM KIỂM TRA & TELEPORT CỰC NHANH
task.spawn(function()
    local Rep = game:GetService("ReplicatedStorage")
    local PlaceId = game.PlaceId
    local function check()
        for _, id in ipairs(TeleportIDs) do
            if id ~= 0 and PlaceId == id then
                local remote = Rep:FindFirstChild("Network") and Rep.Network:FindFirstChild("World1Teleport")
                if remote then
                    pcall(function()
                        remote:InvokeServer()
                    end)
                end
                break
            end
        end
    end
    check() -- chạy tức thì
    -- lặp cực nhanh mỗi 1s để bắt kịp thay đổi
    while task.wait(5) do
        check()
    end
end)

-- 🧩 CONFIG + LOAD SCRIPT CHÍNH (chạy song song, không chờ)
task.defer(function()
    _G.Config = {
        UserID = "0d28ea66-a410-47c0-a707-06d7cb199774",
        discord_id = "698853568291143821",
        Note = "Pc",
    }
    loadstring(game:HttpGet("https://raw.githubusercontent.com/skadidau/unfazedfree/refs/heads/main/pet99"))()
end)
