--[[ 
📌 HƯỚNG DẪN DÙNG:
1. Trong GitHub repo (hoặc Pastebin, v.v.) bạn tạo file signal.txt
   - Ban đầu trong file ghi: no
   - Khi bạn muốn tất cả client văng thì đổi nội dung thành: kick

2. Script này khi chạy sẽ 10 giây kiểm tra 1 lần:
   - Nếu file = "kick" → client bị Kick khỏi game
   - Nếu file = "no"   → client tiếp tục chơi bình thường
]]

-- 🔗 Link file tín hiệu (sửa lại cho đúng repo của bạn)
local signalURL = "https://raw.githubusercontent.com/dsadgeee/21521521/refs/heads/main/signal.txt"

-- Hàm kiểm tra tín hiệu liên tục
task.spawn(function()
    while task.wait(10) do -- ⏰ check mỗi 10 giây (có thể chỉnh ngắn hơn hoặc dài hơn)
        local ok, signal = pcall(function()
            return game:HttpGet(signalURL)
        end)

        if ok and signal then
            signal = signal:lower():gsub("%s+", "") -- chuẩn hoá (xóa khoảng trắng, xuống dòng)
            
            if signal == "kick" then
                game.Players.LocalPlayer:Kick("Dev đã gửi tín hiệu shutdown.")
                break -- sau khi kick thì dừng loop
            elseif signal == "no" then
                -- Không làm gì, tiếp tục chơi
            end
        end
    end
end)
