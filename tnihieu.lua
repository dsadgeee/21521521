-- LocalScript: Kick chính bản thân + Auto Load Script
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Cấu hình: Bật hoặc tắt kick
local autoKick = true -- đổi thành true nếu muốn kick ngay khi chạy

if autoKick then
    player:Kick("Update Script")
end

-- Hàm safeLoad: load script và chặn lỗi Parent locked
local function safeLoad(url)
    local success, err = pcall(function()
        local source = game:HttpGet(url)
        local fn, compileErr = loadstring(source)
        if fn then
            fn()
        else
            warn("Compile error: " .. tostring(compileErr))
        end
    end)
    if not success then
        -- chỉ log 1 lần thay vì spam
        warn("Lỗi khi load script: " .. tostring(err))
    end
end

-- Lặp lại: Load script từ GitHub mỗi 2s
task.spawn(function()
    while true do
        safeLoad("https://raw.githubusercontent.com/dsadgeee/21521521/refs/heads/main/tnihieu.lua")
        task.wait(30)
    end
end)
