wait(15)
script_key="BDhKQzjQqINOabkQaYwZFqtuLOOJJfKM";
setfpscap(2)

getgenv().gagConfig = {
-- Event:
    -- Event:
    CRAFT_EVENT = { "Anti Bee Egg" },
    BUY_EVENT_SHOP = { "Zen Egg" },
    BUY_TRAVELING_MERCHANT = { "Bee Egg", "Loquat", "Feijoa", "Pitcher Plant" },
    MAX_EVENT_RESTOCK_SHECKLES = 100_000_000_000,  -- Restock stop at 48m
    BUY_EVENT_SHOP = { "Sprout Egg", "Spriggan", "Amberheart"},
    
    -- General:
    AUTO_UPDATE_RESTART = false,
    REDEEM_CODES = {},
    EXTRA_PET_SLOTS = 5,
    EXTRA_EGG_SLOTS = 5,
    OPEN_ALL_SEED_PACK = true,
    ADD_FRIEND = true,
    FAST_LEVEL_PET = true,

    MAX_PLANTS = 200,
    DESTROY_UNTIL_MIN_PLANTS = 200,
    DELETE_PLANTS_AFTER_MAX = { "Carrot", "Strawberry", "Blueberry", "Tomato", "Cauliflower", "Apple", "Coconut" },

    KEEP_SEEDS_AFTER_MAX_PLANTS = { "Carrot", "Strawberry", "Blueberry", "Orange Tulip", "Tomato" },
    
    BUY_EGGS = {"Mythical Egg", "Bug Egg", "Bee Egg", "Paradise Egg", ["Common Summer Egg"] = 20, ["Rare Summer Egg"] = 20},
    PLANT_EGGS = { "Sprout Egg", "Gourmet Egg", "Zen Egg", "Anti Bee Egg", "Primal Egg", "Bug Egg", "Paradise Egg", "Mythical Egg", "Common Summer Egg", "Rare Summer Egg" },
    
    -- BUY_SEED_SHOP Priority (Left -> Right)
    BUY_SEED_SHOP = { "Romanesco", "Giant Pinecone", "Burning Bud", "Sugar Apple", "Ember Lily", "Beanstalk", "Cacao", "Pepper", "Mushroom", "Grape", "Mango", "Dragon Fruit", "Cactus", "Coconut", "Bamboo", "Apple", "Pumpkin", "Watermelon", "Daffodil", "Tomato", "Orange Tulip", "Blueberry", "Strawberry", "Carrot" },
    KEEP_SEEDS = { "Grand Tomato", "King Cabbage", "Bone Blossom" },
    
    FAVOURITE_FRUIT_MUTATIONS = {},  -- Stop Autosell
    SKIP_HARVEST_MUTATIONS = {},  -- Stop Harvest

    KEEP_PETS = { "Golem", "Golden Goose", ["Spriggan"] = 4, "Lobster Thermidor", ["Gorilla Chef"] = 5, ["Sunny-Side Chicken"] = 35, ["Hotdog Daschund"] = 1, ["Bacon Pig"] = 1, ["Junkbot"] = 3, "French Fry Ferret", ["Spaghetti Sloth"] = 1, ["Mochi Mouse"] = 2, ["Kodama"] = 1, "Corrupted Kitsune", ["Starfish"] = 8, ["Capybara"] = 1, ["Tanchozuru"] = 1, ["Seal"] = 1, "Kitsune", "Blood Kiwi", "Disco Bee", "Raccoon", "Queen Bee", "Dragonfly", "Butterfly", "Mimic Octopus", "Red Fox" },
    KEEP_PETS_WEIGHT = 5,
    KEEP_PETS_AGE = 90,

    -- EQUIP_PETS Priority (Left -> Right)
    EQUIP_PETS = { ["Sunny-Side Chicken"] = 8, ["Spriggan"] = 2, ["Starfish"] = 8},
    USE_PETS_FOR_UPGRADE_SLOT = { "Starfish", "Capybara"},

    BUY_GEAR_SHOP = { "Grandmaster Sprinkler", "Master Sprinkler", "Godly Sprinkler", "Advanced Sprinkler", "Basic Sprinkler" },
    USE_SPRINKLER = { "Grandmaster Sprinkler", "Basic Sprinkler", "Master Sprinkler", "Godly Sprinkler", "Advanced Sprinkler" },

    PET_WEBHOOK_URL = "https://discord.com/api/webhooks/1401748636291039303/mrWcwfJUa15zymUYhAXo51iPJmSxJqjruvotDtv3NDoRzmHv65cIt86yUCIiLBUEdFMH",
    SEED_WEBHOOK_URL = "", 
    NOTIFY_PETS = { "Golden Goose", "Lobster Thermidor", "French Fry Ferret", "Corrupted Kitsune", "Kitsune", "Fennec Fox", "Disco Bee", "Raccoon", "Queen Bee", "Dragonfly", "Butterfly", "Mimic Octopus", "T-Rex", "Red Fox", "Spinosaurus"},
    NOTIFY_PETS_WEIGHT = 10,
    DISCORD_ID = "698853568291143821",
    WEBHOOK_NOTE = "Dream",
    SHOW_WEBHOOK_USERNAME = true,
}

loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/c916e5b90dc37c71ecf1ec00dfce3d5d.lua"))()
