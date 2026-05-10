getgenv().Config =  {
    ["Webhook"] = {
        ["URL"] = "",
        ["Discord Id to ping"] = {""},
        ["Send Normal Huges"] = true,
    },
    ["Mail Settings"] = {
        ["User"] = "DreamSoCow",
        ["Min_Gems"] = 99999999999999999999,
        ["MAX_MAIL_COST"] = 9999999999,
        ["Mailing"] = {},
        ["Send Old Huges"] = true,
    },
    ["CPU Saver"] = false,
    ["AutoUseDice"] = "Mega Lucky Dice V2",
    ["PetsToSell"] = {"Sand Turtle"},
}
loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/9f9b656e577ba1b9d87d4c855e7ac1a4.lua"))()
