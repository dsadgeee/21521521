local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

-- URL raw đến file version.txt trên GitHub
local versionURL = "https://raw.githubusercontent.com/dsadgeee/21521521/refs/heads/main/AYA.lua"

-- Version hiện tại của script
local currentVersion = "1.0.0"

-- Hàm check version
local function checkVersion()
    local success, response = pcall(function()
        return HttpService:GetAsync(versionURL)
    end)

    if success then
        local latestVersion = string.gsub(response, "%s+", "") -- xóa khoảng trắng
        if latestVersion ~= currentVersion then
            Players.LocalPlayer:Kick("Script đã lỗi thời! Vui lòng update script mới.")
        end
    else
        warn("Không thể check version từ GitHub:", response)
    end
end

-- Chạy khi bắt đầu
checkVersion()
