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
        EGG_SLOTS = { 10 }, -- slot dành cho trứng -- slot đặt trứng , put egg
    },
    SEND_PET = {
        Usernames = { 'TunTrapBoy' },  --gửi cho nhiều usename,send multi 'usename'
        PetSendInterval = 20,
    },
    SEND_DIAMONDS = {
        Usernames = { 'DreamSoCow' },--gửi cho nhiều usename,send multi usename
        MinDiamonds = 50000000,
    },
    SEND_ITEM = {
        Usernames = { 'usename' },
        ['Spectral Potion'] = { amount = 3 },--gửi cho nhiều usename,send multi usename
    },
    SEND_EGGS = {
        Usernames = { 'TunTrapBoy' },
        ['Exclusive Egg 56'] = true, --- SEND Exclusive Egg
    },
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/dsadgeee/21521521/refs/heads/main/track.lua"))()
