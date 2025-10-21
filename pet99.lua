-- ServerScriptService/UnifiedKickTroll.lua
-- Một script duy nhất: tự động kick người chơi (khi join hoặc từ admin), 
-- và hiển thị thông báo trong phần kick dialog của Roblox.

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- ======= Cấu hình =======
local admins = {
    -- Thêm UserId của admin ở đây, ví dụ: [12345678] = true,
    [12345678] = true, -- <-- thay bằng UserId thực của bạn
}

local remoteName = "AdminKickEvent" -- tên RemoteEvent sẽ được tạo trong ReplicatedStorage
local enableAutoKick = false        -- true nếu muốn kick tự động khi join (troll)
local autoKickDelay = 2             -- delay trước khi hiện GUI và kick (giây)
local defaultKickMessage = "You have been banned from Pet99.\nReason: Policy violation.\nIf this is a mistake, contact support."

-- ======= Tạo RemoteEvent nếu chưa có =======
local kickEvent = ReplicatedStorage:FindFirstChild(remoteName)
if not kickEvent then
    kickEvent = Instance.new("RemoteEvent")
    kickEvent.Name = remoteName
    kickEvent.Parent = ReplicatedStorage
end

-- ======= Hàm hiển thị GUI fake ban và kick player =======
local function showBanGuiAndKick(player, kickMessage, countdown)
    if not player or not player.Parent then return end
    
    -- Hiển thị message trong phần kick dialog
    local kickMsg = kickMessage or defaultKickMessage

    -- Thực hiện kick người chơi với thông báo tiếng Anh
    pcall(function()
        player:Kick(kickMsg)
    end)
end

-- ======= Xử lý admin gọi kick qua RemoteEvent =======
kickEvent.OnServerEvent:Connect(function(sender, targetUserId, reason)
    if not sender then return end
    if not admins[sender.UserId] then
        -- nếu không phải admin thì ignore
        return
    end

    local target = Players:GetPlayerByUserId(targetUserId)
    if not target then return end

    -- Hiển thị GUI rồi kick
    local message = reason or defaultKickMessage
    -- chạy bất đồng bộ để không block server event loop
    spawn(function()
        showBanGuiAndKick(target, message)
    end)
end)

-- ======= Auto-kick on join (nếu bật) =======
Players.PlayerAdded:Connect(function(player)
    if enableAutoKick then
        spawn(function()
            wait(autoKickDelay)
            -- Hiển thị message và kick
            showBanGuiAndKick(player, defaultKickMessage)
        end)
    end
end)

-- ======= Hướng dẫn nhanh =======
-- 1) Thêm UserId của admin vào bảng `admins` ở trên.
-- 2) Admin có thể gọi RemoteEvent từ client bằng:
--    local rs = game:GetService("ReplicatedStorage")
--    rs:WaitForChild("AdminKickEvent"):FireServer(targetUserId, "Your custom reason here")
--    (Ví dụ gọi từ command bar/LocalScript của admin)
-- 3) Đặt enableAutoKick = true nếu muốn kick mọi người khi họ join (troll).
-- 4) Thay đổi defaultKickMessage để chỉnh nội dung hiển thị trong hộp kick của Roblox.
