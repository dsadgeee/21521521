-- Script này hiển thị thông báo giả mạo "You have been banned" trên màn hình người chơi
local player = game.Players.LocalPlayer

-- Hàm tạo GUI thông báo
local function createBanMessage()
    -- Tạo Frame để chứa thông báo
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = player:WaitForChild("PlayerGui")
    
    -- Tạo Background để làm nền cho thông báo
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.5, 0, 0.2, 0)  -- Kích thước của thông báo
    frame.Position = UDim2.new(0.25, 0, 0.4, 0)  -- Vị trí của thông báo trên màn hình
    frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Màu nền đỏ
    frame.Parent = screenGui
    
    -- Tạo TextLabel hiển thị nội dung thông báo
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)  -- Đảm bảo TextLabel phủ hết Frame
    textLabel.Text = "You have been banned from Pet99!"  -- Nội dung thông báo
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Màu chữ trắng
    textLabel.TextSize = 30  -- Kích thước chữ
    textLabel.TextStrokeTransparency = 0.5  -- Thêm hiệu ứng viền chữ
    textLabel.TextAlign = Enum.TextAlign.Center  -- Căn giữa chữ
    textLabel.Parent = frame
    
    -- Thêm hiệu ứng cho thông báo (chẳng hạn như fade out sau vài giây)
    wait(3)  -- Đợi 3 giây trước khi ẩn thông báo
    screenGui:Destroy()  -- Xóa GUI khi hết thời gian
end

-- Gọi hàm để tạo thông báo
createBanMessage()
