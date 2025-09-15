local keys = {  -- Add as many key
    "fQrVRyUtoHvGxEEgsYYFMIciFOVzIIaw", 
    "PaNXzVUDIqqFAcrbQmCdIxkqCTkOiNon", 
    "PBHaDrKRnhKUubEXFQChbeqPEAEiQGuD", 
    "RXUJRIJBWUUBfxlzyxElIHjevvqLyrxJ", 
    "RrWyNgerXuGouiXoWhJelcgKSPrWofbE", 
    "pgSKtZuHiqROwmdOcPnmBnMGtDFVzAxO", 
    "PdnOvVkSNPxSeuGptLHqcpccVdHIkGxI", 
    "SPrBpusRNXXLoimtzfdhTBvqFBOUhfDt", 
    "IUXEKHPBlNXgvKqAyNzXouyOhKMTBGHu", 
    "MHjKRLurezSEgfcLduUniaIKEzjYGefm", 
	"aRzIpWwUcfpPkRbRakOGqoMcYpbxgKyf",
	"xXzzNEuwOUQMJrYpualNDpIdTmpCMEvU",
}

script_key = keys[math.random(#keys)];
setfpscap(2)

getgenv().gagConfig = {
    -- Event:
    CRAFT_EVENT = { "Anti Bee Egg", "Skyroot Chest" , "Sprout Egg" },
    BUY_TRAVELING_MERCHANT = { "Bee Egg", "Paradise Egg", "Rare Summer Egg", "Common Summer Egg", "Pitcher Plant", "Feijoa", "Loquat" },
    BUY_EVENT_SHOP = { "Fall Egg" },
    
    PLANT_EVENT_TREES = true,  -- This config will replace most plant related config
    PLACE_COSMETIC = { "Cooking Kit" },
    
    -- General:
    AUTO_UPDATE_RESTART = false,
    REDEEM_CODES = {},
    EXTRA_PET_SLOTS = 5,
    EXTRA_EGG_SLOTS = 5,
    MAX_REBIRTH_SHECKLES = 1_000_000_000_000,
    ADD_FRIEND = true,
    OPEN_ALL_SEED_PACK = false,

    BUY_COSMETIC_SHOP = { ["Cooking Kit"] = 3 },

    MAX_PLANTS = 250,
    DESTROY_UNTIL_MIN_PLANTS = 200,
    DELETE_PLANTS_AFTER_MAX = { "Carrot", "Strawberry", "Blueberry", "Tomato", "Apple" },
    
    BUY_EGGS = { "Bug Egg", "Bee Egg", "Paradise Egg", "Mythical Egg", "Rare Summer Egg", "Common Summer Egg", "Rare Egg", "Uncommon Egg" },
    PLANT_EGGS = { "Fall Egg" , "Anti Bee Egg" , "Common Summer Egg" },
    
    BUY_SEED_SHOP = { "Romanesco", "Elder Strawberry", "Giant Pinecone", "Burning Bud", "Sugar Apple", "Ember Lily", "Beanstalk", "Cacao", "Pepper", "Mushroom", "Grape", "Mango", "Dragon Fruit", "Cactus", ["Coconut"] = 50, ["Bamboo"] = 50, ["Apple"] = 50, ["Pumpkin"] = 50, ["Watermelon"] = 50, ["Daffodil"] = 50, ["Tomato"] = 50, ["Orange Tulip"] = 50, ["Blueberry"] = 50, ["Strawberry"] = 50, ["Carrot"] = 50 },
    KEEP_SEEDS = { "Bone Blossom" },
    KEEP_SEEDS_AFTER_MAX_PLANTS = { "Carrot", "Strawberry", "Blueberry", "Tomato", "Apple" },
    
    FAVOURITE_FRUIT_MUTATIONS = {},
    SKIP_HARVEST_MUTATIONS = {},

    KEEP_PETS = { ["Barn Owl"] = 8, "Swan", ["Space Squirrel"] = 3, "Cockatrice", "Drake", "Wisp", "Luminous Sprite", "Wisp Well", "Phoenix", ["Glimmering Sprite"] = 8, "Griffin", ["Brown Mouse"] = 2, ["Squirrel"] = 1, ["Grey Mouse"] = 2, ["Rooster"] = 4, "Lemon Lion", "Peach Wasp", "Chicken Zombie", ["Gorilla Chef"] = 8, "Green Bean", "Golden Goose", ["Spriggan"] = 1, "Lobster Thermidor", ["Sunny-Side Chicken"] = 35, "French Fry Ferret", ["Kodama"] = 1, "Corrupted Kitsune", ["Starfish"] = 10, ["Capybara"] = 1, ["Seal"] = 1, "Kitsune", "Blood Kiwi", "Disco Bee", "Raccoon", "Queen Bee", "Dragonfly", "Butterfly", "Mimic Octopus", "Red Fox", "Bee", "Honey Bee", "Bear Bee", "Petal Bee", "Wasp", "Tarantula Hawk" },
    KEEP_PETS_WEIGHT = 5,

    EQUIP_PETS = {["Wasp"] = 1, ["Tarantula Hawk"] = 1, ["Barn Owl"] = 1, ["Sunny-Side Chicken"] = 5, ["Starfish"] = 5, ["Brown Mouse"] = 3, ["Grey Mouse"] = 3, ["Rooster"] = 4, "Bear Bee", "Petal Bee"},
    USE_PETS_FOR_UPGRADE_SLOT = { ["Barn Owl"] = 3, ["Brown Mouse"] = 3, ["Grey Mouse"] = 3, ["Starfish"] = 5 },
    REMOVE_PET_MAX_UPGRADE = { "Chicken" },  -- Unequip from garden

    BUY_GEAR_SHOP = { "Grandmaster Sprinkler", "Master Sprinkler", "Godly Sprinkler", "Advanced Sprinkler", "Basic Sprinkler", "Trading Ticket" },
    USE_SPRINKLER = { "Basic Sprinkler", "Master Sprinkler", "Godly Sprinkler", "Advanced Sprinkler", "Grandmaster Sprinkler" },

    PET_WEBHOOK_URL = "https://discord.com/api/webhooks/1408866663558025278/ohhAUmTACbJP2YbxoGH8iXRYJpT36w0HcHrffSsza8TA6iw62VUO1Sb2jCBavqeK1FeW", 
    NOTIFY_PETS = { "Swan", "Cockatrice", "Gnome", "Griffin", "Golden Goose", "Corrupted Kitsune", "Raiju", "Mizuchi", "Kitsune", "Fennec Fox", "Disco Bee", "Raccoon", "Queen Bee", "Night Owl", "Dragonfly", "Butterfly", "Mimic Octopus", "Red Fox" },
    NOTIFY_PETS_WEIGHT = 5,
    DISCORD_ID = "940582401464217640",
    WEBHOOK_NOTE = "pc2",
    SHOW_WEBHOOK_USERNAME = false,
    SHOW_WEBHOOK_JOBID = false,
}

loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/6cb882027ef5de19462b160764dcfb53.lua"))()
