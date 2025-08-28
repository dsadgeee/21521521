--[[ 
📌 HƯỚNG DẪN:
1. Trong GitHub repo tạo file "tnihieu.txt"
   - Ban đầu ghi: no
   - Khi muốn tất cả client bị văng khỏi game → đổi thành: kick

2. Script này sẽ:
   - Load script chính từ AYA.lua
   - Liên tục kiểm tra file tnihieu.txt
   - Nếu phát hiện "kick" → văng khỏi game
   - Khi người chơi vào lại game, loader tự chạy lại AYA.lua
]]

-- 🔗 Link tới script chính
local mainScriptURL = "https://raw.githubusercontent.com/dsadgeee/21521521/refs/heads/main/AYA.lua"

-- 🔗 Link tới file tín hiệu
local signalURL     = "https://raw.githubusercontent.com/dsadgeee/21521521/refs/heads/main/tnihieu.txt"

-- Hàm chạy script chính
local function runMainScript()
    loadstring(game:HttpGet(mainScriptURL))()
end

-- Chạy script chính lúc bắt đầu
runMainScript()

-- Kiểm tra tín hiệu liên tục
task.spawn(function()
    while task.wait(10) do -- ⏰ check mỗi 10 giây
        local ok, signal = pcall(function()
            return game:HttpGet(signalURL)
        end)

        if ok and signal then
            signal = signal:lower():gsub("%s+", "")
            if signal == "kick" then
                game.Players.LocalPlayer:Kick("Dev đã gửi tín hiệu reload script.")
                break -- sau khi kick thì thoát vòng lặp
            end
        end
    end
end)
