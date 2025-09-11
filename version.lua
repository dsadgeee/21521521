local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local currentVersion = "1.0.0"  -- Phiên bản hiện tại trong script
local versionURL = "" -- Link file version.txt trên GitHub

local function checkVersion()
    local success, result = pcall(function()
        return HttpService:GetAsync(versionURL)
    end)
    
    if success and result then
        local onlineVersion = string.match(result, "[%d%.]+")
        if onlineVersion and onlineVersion ~= currentVersion then
            player:Kick("Script đã cập nhật, vui lòng vào lại game.")
        end
    else
        warn("Không thể kiểm tra version:", result)
    end
end

while true do
    checkVersion()
    wait(30)
end
