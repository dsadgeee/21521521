getgenv().Config = {
    SERVER_HOP = false, -- true: bật hop server, false: tắt hop server
    DPS_THRESHOLDS = {
        HOUSE1 = {'>0'),
        HOUSE2 = {'1000~4000', '>10000' },
        HOUSE3 = {'3500~6500', '>23500' },
        HOUSE4 = {'46000~10000', '>25000'),
        HOUSES = {'8000~24000' },
        HOUSE6 = { '>100000' },
    },

    plant = {
        PET_SLOTS = { 1, 2, 3, 4, 5, 6, 7, 8, 9 }, -- slot đặt pet
        EGG_SLOTS = { 10 }, -- slot đặt trứng
    },

    SEND_PET = {
        Usernames = { 'TunTrapBoy' },
        PetSendInterval = 20,
        SEND_ALL = true,
        Name_Pet = {},
    },

    SEND_DIAMONDS = {
        Usernames = { 'DreamSoCow' },
        MinDiamonds = 50000000,
    },

    SEND_ITEM = {
        Usernames = { '' },
        ['Spectral Potion'] = { amount = 3 },
    },

    SEND_EGGS = {
        Usernames = { 'TunTrapBoy' },
        ['Exclusive Egg 56'] = true,
    },
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/dsadgeee/21521521/refs/heads/main/track.lua"))()
