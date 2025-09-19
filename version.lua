local delayTime = 120
local version = "1.0.0"
game.Players.PlayerAdded:Connect(function(p) task.delay(delayTime,function() if version~="1.0.0" then p:Kick("Script version mismatch") end end) end)

