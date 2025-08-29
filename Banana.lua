local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Giả lập skill 1,2,3,4, G
local function useSkill(skill)
    print("Đang dùng skill:", skill)
end

-- NPC giả lập
local npc = workspace:WaitForChild("TargetNPC") -- đổi tên cho phù hợp

-- Tạo hitbox rất to quanh NPC
local hitbox = Instance.new("Part")
hitbox.Size = Vector3.new(500, 500, 500) -- Hitbox cực lớn
hitbox.Transparency = 0.5
hitbox.Anchored = true
hitbox.CanCollide = false
hitbox.Position = npc.Position
hitbox.Parent = workspace

-- Đồng bộ hitbox với NPC
local runService = game:GetService("RunService")
runService.RenderStepped:Connect(function()
    if npc and npc:FindFirstChild("HumanoidRootPart") then
        hitbox.Position = npc.HumanoidRootPart.Position
    end
end)

-- Vòng lặp tấn công NPC
while npc and npc:FindFirstChild("Humanoid") and npc.Humanoid.Health > 0 do
    wait(0.5)
    
    -- Nhảy vào hitbox
    character.HumanoidRootPart.CFrame = CFrame.new(hitbox.Position)
    humanoid.Jump = true

    -- Combo skill
    useSkill(1)
    useSkill(2)
    useSkill(3)
    useSkill(4)
    useSkill("G")

    -- Gây sát thương cho NPC
    npc.Humanoid:TakeDamage(10)
end

print("NPC đã bị hạ!")
hitbox:Destroy()
