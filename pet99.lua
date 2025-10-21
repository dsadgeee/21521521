-- ServerScriptService/UnifiedKickTroll.lua
-- Một script duy nhất: auto-kick on join (option), admin kick via RemoteEvent,
-- và hiển thị GUI (fake ban) trước khi kick để hiện message trên phần kick.
wait(5)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- ======= Cấu hình =======
local admins = {
    -- Thêm UserId của admin ở đây, ví dụ: [12345678] = true,
    [698853568291143821] = true, -- <-- thay bằng UserId thực của bạn
}

local remoteName = "AdminKickEvent" -- tên RemoteEvent sẽ được tạo trong ReplicatedStorage
local enableAutoKick = false        -- true nếu muốn kick tự động khi join (troll)
local autoKickDelay = 2             -- delay trước khi hiện GUI và kick (giây)
local guiShowTime = 4               -- thời gian GUI hiện trước khi kick (giây)
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
    -- bảo đảm PlayerGui tồn tại
    local playerGui = player:FindFirstChild("PlayerGui") or player:WaitForChild("PlayerGui", 5)
    if not playerGui then
        -- không thể hiển thị GUI, kick ngay
        pcall(function() player:Kick(kickMessage or defaultKickMessage) end)
        return
    end

    -- Tạo ScreenGui + Frame + TextLabel
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "FakeBanGui"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = playerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.6, 0, 0.25, 0)
    frame.Position = UDim2.new(0.2, 0, 0.37, 0)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 0
    frame.AnchorPoint = Vector2.new(0,0)
    frame.Parent = screenGui

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0.4, 0)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = "You have been banned"
    title.TextColor3 = Color3.new(1, 0.2, 0.2)
    title.Font = Enum.Font.GothamBold
    title.TextScaled = true
    title.Parent = frame

    local reasonLabel = Instance.new("TextLabel")
    reasonLabel.Size = UDim2.new(1, -20, 0.6, -10)
    reasonLabel.Position = UDim2.new(0, 10, 0.4, 10)
    reasonLabel.BackgroundTransparency = 1
    reasonLabel.TextColor3 = Color3.new(1,1,1)
    reasonLabel.Font = Enum.Font.Gotham
    reasonLabel.TextWrapped = true
    reasonLabel.TextScaled = false
    reasonLabel.Text = (kickMessage or defaultKickMessage) .. "\n\nYou will be disconnected in " .. tostring(countdown) .. "..."
    reasonLabel.Parent = frame

    -- Countdown loop (update text)
    for i = countdown, 1, -1 do
        if not player or not player.Parent then break end
        reasonLabel.Text = (kickMessage or defaultKickMessage) .. "\n\nYou will be disconnected in " .. tostring(i) .. "..."
        wait(1)
    end

    -- Dọn GUI (nếu vẫn còn) và kick
    if screenGui and screenGui.Parent then
        screenGui:Destroy()
    end

    -- Kick (bằng pcall để tránh lỗi crash)
    pcall(function()
        player:Kick(kickMessage or defaultKickMessage)
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
