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
        PET_SLOTS = { 1, 2, 3, 4, 5, 6, 7, 8, 9 }, -- slot đặt pet, put pet
        EGG_SLOTS = { 10 }, -- slot đặt trứng , put egg
    },
    SEND_PET = {
        Usernames = {'TunTrapBoy'}, --- name1 , name2 , name3 ---
        PetSendInterval = 20, -- delay send
        SEND_ALL = true, -- true: SEND ALL, false: SEND PET CONFIG ----
        Name_Pet = {}, --HUGE NAME 1 , HUGE NAME 2 , HUGE NAME 3 ---
    },
    SEND_DIAMONDS = {
        Usernames = {'DreamSoCow'}, --- name1 , name2 , name3 ---
        MinDiamonds = 10000000,
    },
    SEND_ITEM = {
        Usernames = {''}, --- name1 , name2 , name3 ---
        ['Spectral Potion'] = { amount = 3 },
    },
    SEND_EGGS = {
        Usernames = {'TunTrapBoy'}, --- name1 , name2 , name3 ---
        ['Exclusive Egg 56'] = true,
    },
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/dsadgeee/21521521/refs/heads/main/track.lua"))()
