script_key = "BDhKQzjQqINOabkQaYwZFqtuLOOJJfKM";
setfpscap(2)

getgenv().gagConfig = {
    -- Event:
    CRAFT_EVENT = { "Anti Bee Egg" },
    BUY_TRAVELING_MERCHANT = { "Bee Egg", "Primal Egg", "Loquat", "Feijoa", "Pitcher Plant" },
    MAX_EVENT_RESTOCK_SHECKLES = 1000000000, -- Restock stop at 48m
    BUY_EVENT_SHOP = { "Sprout Egg", "Spriggan", "Zen Egg" },

    -- General:
    AUTO_UPDATE_RESTART = false,
    REDEEM_CODES = {},
    EXTRA_PET_SLOTS = 5,
    EXTRA_EGG_SLOTS = 5,
    ADD_FRIEND = true,
    OPEN_ALL_SEED_PACK = true,
    FAST_LEVEL_PET = true,

    MAX_PLANTS = 200,
    DESTROY_UNTIL_MIN_PLANTS = 200,
    DELETE_PLANTS_AFTER_MAX = { "Carrot" },

    BUY_EGGS = { "Mythical Egg", "Bug Egg", "Bee Egg", "Paradise Egg", "Uncommon Egg", ["Common Summer Egg"] = 20 , "Common Egg"  },
    PLANT_EGGS = { "Sprout Egg", "Gourmet Egg", "Corrupted Zen Egg", "Zen Egg", "Dinosaur Egg", "Primal Egg", "Anti Bee Egg", "Bee Egg", "Night Egg", "Bug Egg", "Paradise Egg", "Mythical Egg", "Common Egg" },

    -- BUY_SEED_SHOP Priority (Left -> Right)
    BUY_SEED_SHOP = { "Romanesco", "Elder Strawberry", "Giant Pinecone", "Burning Bud", "Sugar Apple", "Ember Lily", "Beanstalk", "Cacao", "Pepper", "Mushroom", "Grape", "Mango", "Dragon Fruit", "Cactus", ["Coconut"] = 50, ["Bamboo"] = 50, ["Apple"] = 50, ["Pumpkin"] = 50, ["Watermelon"] = 50, ["Daffodil"] = 50, ["Tomato"] = 50, ["Orange Tulip"] = 50, ["Blueberry"] = 50, ["Strawberry"] = 50, ["Carrot"] = 50 },
    KEEP_SEEDS = { "Grand Tomato", "King Cabbage", "Bone Blossom" },
    KEEP_SEEDS_AFTER_MAX_PLANTS = { "Carrot" },

    FAVOURITE_FRUIT_MUTATIONS = {}, -- Stop Autosell
    SKIP_HARVEST_MUTATIONS = {},    -- Stop Harvest

    KEEP_PETS = { "Golden Goose", ["Spriggan"] = 3, ["Golem"] = 3, ["Sushi Bear"] = 2, "Lobster Thermidor", ["Gorilla Chef"] = 5, ["Sunny-Side Chicken"] = 35, ["Hotdog Daschund"] = 1, ["Bacon Pig"] = 1, ["Junkbot"] = 4, "French Fry Ferret", ["Spaghetti Sloth"] = 1, ["Mochi Mouse"] = 2, ["Kodama"] = 1, "Corrupted Kitsune", ["Starfish"] = 8, ["Capybara"] = 1, ["Tanchozuru"] = 1, ["Seal"] = 1, "Kitsune", "Blood Kiwi", "Disco Bee", "Raccoon", "Queen Bee", "Dragonfly", "Butterfly", "Mimic Octopus", "Red Fox", },
    KEEP_PETS_WEIGHT = 5,
    KEEP_PETS_AGE = 75,

    -- EQUIP_PETS Priority (Left -> Right)
    EQUIP_PETS = { ["Sunny-Side Chicken"] = 5, ["Starfish"] = 3 },
    USE_PETS_FOR_UPGRADE_SLOT = { "Starfish" },

    BUY_GEAR_SHOP = { "Grandmaster Sprinkler", "Master Sprinkler", "Godly Sprinkler", "Advanced Sprinkler", "Basic Sprinkler", "Trading Ticket" },
    USE_SPRINKLER = { "Basic Sprinkler", "Master Sprinkler", "Godly Sprinkler", "Advanced Sprinkler", "Grandmaster Sprinkler" },

    PET_WEBHOOK_URL = "https://discord.com/api/webhooks/1401748636291039303/mrWcwfJUa15zymUYhAXo51iPJmSxJqjruvotDtv3NDoRzmHv65cIt86yUCIiLBUEdFMH",
    SEED_WEBHOOK_URL = "",
    NOTIFY_PETS = {"Golden Goose", "Lobster Thermidor", "French Fry Ferret", "Corrupted Kitsune", "Kitsune", "Fennec Fox", "Disco Bee", "Raccoon", "Queen Bee", "Dragonfly", "Butterfly", "Mimic Octopus", "T-Rex", "Red Fox", "Spinosaurus" },
    NOTIFY_PETS_WEIGHT = 5,
    DISCORD_ID = "",
    WEBHOOK_NOTE = "",
    SHOW_WEBHOOK_USERNAME = false,
}

loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/18f68a241a8acc1191c28d9a76d67fe3.lua"))()
