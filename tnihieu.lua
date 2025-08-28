local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

-- Link raw tới file version.txt hoặc AYA.lua trên GitHub
local versionURL = "https://raw.githubusercontent.com/dsadgeee/21521521/refs/heads/main/AYA.lua"

-- Phiên bản hiện tại bạn đang chạy
local currentVersion = "1.0.0"

-- Bật/tắt auto kick
local autoKick = true   -- true = bật, false = tắt

-- Hàm kiểm tra version
local function checkVersion()
    local success, response = pcall(function()
        return HttpService:GetAsync(versionURL)
    end)

    if success then
        local latestVersion = string.gsub(response, "%s+", "")
        if latestVersion ~= currentVersion then
            if autoKick then
                Players.LocalPlayer:Kick("⚠ Script đã update! Vui lòng tải bản mới.")
            else
                warn("Script lỗi thời, nhưng autoKick đang TẮT")
            end
        end
    else
        warn("Không thể check version từ GitHub:", response)
    end
end

-- Lặp lại liên tục
task.spawn(function()
    while task.wait(1) do  -- kiểm tra mỗi 10 giây
        checkVersion()
    end
end)
