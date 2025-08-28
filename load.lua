loadstring(game:HttpGet("https://raw.githubusercontent.com/dsadgeee/21521521/refs/heads/main/AYA.lua"))()
-- Auto load script từ GitHub mỗi 2 giây
local url = "https://raw.githubusercontent.com/dsadgeee/21521521/refs/heads/main/tnihieu.lua"

while true do
    local success, err = pcall(function()
        loadstring(game:HttpGet(url))()
    end)

    if not success then
        warn("Lỗi khi load script:", err)
    end

    task.wait(2) -- đợi 2 giây
end

