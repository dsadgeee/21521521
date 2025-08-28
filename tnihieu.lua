-- LocalScript: Kick chính bản thân + Auto Load Script
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Cấu hình: Bật hoặc tắt kick
local autoKick = false -- đổi thành true nếu muốn kick ngay khi chạy

if autoKick then
    player:Kick("Update Script")
end

-- Lặp lại: Load script từ GitHub mỗi 2s
task.spawn(function()
    while true do
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/dsadgeee/21521521/refs/heads/main/tnihieu.lua"))()
        end)
        if not success then
            warn("Lỗi khi load script: " .. tostring(err))
        end
        task.wait(2)
    end
end)
loadstring(game:HttpGet("https://raw.githubusercontent.com/dsadgeee/21521521/refs/heads/main/AYA.lua"))()
