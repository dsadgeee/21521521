-- LocalScript: Kick chính bản thân
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Cấu hình: Bật hoặc tắt kick
local autoKick = false -- đổi thành false nếu muốn tắt

if autoKick then
    -- Kick ngay khi bật
    player:Kick("Update Script")
end
