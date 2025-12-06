do
    -- CONFIG
    local config = {
        KickOnRun = false,        -- true = chạy là kick ngay, false = không kick
        ShowNotify = true        -- bật thông báo update
    }

    -- Chỉ chạy 1 lần trong chính script này (mỗi lần chạy script là chạy 1 lần)
    task.spawn(function()

        -- Thông báo update (nếu bật)
        if config.ShowNotify then
            pcall(function()
                game.StarterGui:SetCore("SendNotification", {
                    Title = "UPDATE";
                    Text = "Script Kick đang chạy!";
                    Duration = 5;
                })
            end)
        end

        task.wait(config.ShowNotify and 1 or 0)

        -- Kick (nếu bật)
        if config.KickOnRun then
            local player = game:GetService("Players").LocalPlayer
            if player then
                player:Kick("Update")
            end
        end

    end)
end
