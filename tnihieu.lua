local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local versionURL = "https://raw.githubusercontent.com/dsadgeee/21521521/main/AYA.lua"
local currentVersion = "1.0.0"

local function checkVersion()
    local success, response = pcall(function()
        return HttpService:GetAsync(versionURL)
    end)

    if success then
        local latestVersion = string.gsub(response, "%s+", "")
        if latestVersion ~= currentVersion then
            Players.LocalPlayer:Kick("⚠ Script đã lỗi thời! Vui lòng update script mới.")
        end
    else
        warn("Không thể check version từ GitHub:", response)
    end
end

checkVersion()
