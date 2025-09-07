script_key="qwhIjrnQcSQLjUUOrAZHQCVQCmflwHDc";
setfpscap(2)

getgenv().gagConfig = {
    -- Event:
    CRAFT_EVENT = { "Enchanted Chest", "Fairy Net", "Anti Bee Egg", "Mutation Spray Glimmering" },
    BUY_TRAVELING_MERCHANT = { "Bee Egg", "Primal Egg", "Paradise Egg", "Rare Summer Egg", "Common Summer Egg" },
    MAX_EVENT_RESTOCK_SHECKLES = 5_000_000_000_000,
    BUY_EVENT_SHOP = {"Enchanted Chest", "Luminous Sprite" },
    
    CLAIM_FAIRY_REWARD = { "Mutation Spray Glimmering", "Enchanted Egg", "Enchanted Seed Pack", "FairyPoints", "Fairy Targeter" },
    CLAIM_FOOD_CONNOISSEUR_REWARD = {"Culinarian Chest", "Gourmet Egg", "Gorilla Chef"},
    PLANT_EVENT_TREES = false,

    -- General:
    AUTO_UPDATE_RESTART = false,
    REDEEM_CODES = {},
    EXTRA_PET_SLOTS = 5,
    EXTRA_EGG_SLOTS = 5,
    ADD_FRIEND = true,
    OPEN_ALL_SEED_PACK = false,
    PLACE_COSMETIC = { "Cooking Kit", "Cooking Cauldron" },

    MAX_PLANTS = 200,
    DESTROY_UNTIL_MIN_PLANTS = 200,
    DELETE_PLANTS_AFTER_MAX = { "Carrot", "Strawberry", "Blueberry", "Tomato", "Cauliflower", "Apple" },

    BUY_EGGS = { "Legendary Egg", "Mythical Egg", "Bug Egg", "Bee Egg", "Paradise Egg", "Common Summer Egg", "Rare Summer Egg", "Rare Egg" },
    PLANT_EGGS = { "Enchanted Egg", "Gourmet Egg", "Zen Egg", "Anti Bee Egg", "Primal Egg", "Bug Egg", "Paradise Egg", "Sprout Egg", "Mythical Egg", "Common Summer Egg", "Rare Summer Egg", "Rare Egg" },
    
    -- BUY_SEED_SHOP Priority (Left -> Right)
    BUY_SEED_SHOP = { ["Sunbulb"] = 10, ["Glimmering Sprite"] = 10, ["Romanesco"] = 10, ["Giant Pinecone"] = 10, ["Burning Bud"] = 10, ["Sugar Apple"] = 10, ["Ember Lily"] = 10, ["Beanstalk"] = 10, ["Cacao"] = 10, ["Pepper"] = 10, ["Mushroom"] = 10, ["Grape"] = 10, ["Mango"] = 10, ["Dragon Fruit"] = 10, ["Cactus"] = 10, ["Coconut"] = 10, ["Bamboo"] = 10, ["Apple"] = 10, ["Pumpkin"] = 10, ["Watermelon"] = 10, ["Daffodil"] = 10, ["Tomato"] = 10, ["Orange Tulip"] = 10, ["Blueberry"] = 10, ["Strawberry"] = 10, ["Carrot"] = 10 },
    KEEP_SEEDS = { "Grand Tomato", "King Cabbage", "Bone Blossom", "Mushroom" },
    
    FAVOURITE_FRUIT_MUTATIONS = {},
    SKIP_HARVEST_MUTATIONS = {},

    KEEP_PETS = { "Phoenix", ["Shroomie"] = 2, ["Drake"] = 2, ["Luminous Sprite"] = 2, "Griffin", ["Glimmering Sprite"] = 5, "Cockatrice", "Golem", "Gnome", "Green Bean", "Apple Gazelle", "Lemon Lion", "Peach Wasp", "Golden Goose", ["Spriggan"] = 5, ["Gorilla Chef"] = 4, "Junkbot", "Hotdog Daschund", "Sunny-Side Chicken", "Lobster Thermidor", "French Fry Ferret", ["Starfish"] = 8, "Raiju", "Corrupted Kodama", ["Rooster"] = 6, "Capybara", ["Koi"] = 2, ["Tanchozuru"] = 3, "Kitsune", "Corrupted Kitsune", "Dilophosaurus", "Spinosaurus", "Brontosaurus", "T-Rex", "Fennec Fox", "Blood Kiwi", ["Hamster"] = 2, "Disco Bee", "Raccoon", "Queen Bee", "Dragonfly", "Butterfly", ["Tarantula Hawk"] = 3, ["Wasp"] = 3, ["Honey Bee"] = 2, ["Bee"] = 2, "Mimic Octopus", "Red Fox", "Chicken Zombie" },
    KEEP_PETS_WEIGHT = 6,

    -- EQUIP_PETS Priority (Left -> Right)
    EQUIP_PETS = { "Bee", "Honey Bee", "Bear Bee", "Petal Bee", "Wasp", "Tarantula Hawk", ["Glimmering Sprite"] = 5, ["Sunny-Side Chicken"] = 3, ["Brown Mouse"] = 2, ["Squirrel"] = 1, ["Grey Mouse"] = 2,  ["Rooster"] = 4 },
    USE_PETS_FOR_UPGRADE_SLOT = { "Starfish", "Capybara", "Brown Mouse", "Grey Mouse", "Rooster", "Squirrel" },

    BUY_GEAR_SHOP = { "Fairy Targeter", "Master Sprinkler", "Godly Sprinkler", "Advanced Sprinkler", "Basic Sprinkler" },
    USE_SPRINKLER = { "Fairy Targeter", "Basic Sprinkler", "Master Sprinkler", "Godly Sprinkler", "Advanced Sprinkler" },

    PET_WEBHOOK_URL = "https://discord.com/api/webhooks/1408866660017766500/8OgtYYAinAJ9qhpqLxr_jIzUztGg0YqnxzayJql_zAyaYqzoXxUH2OhEoo9DX09HpDOF",
    SEED_WEBHOOK_URL = "", 
    NOTIFY_PETS = { "Phoenix", "Cockatrice", "Griffin", "Golden Goose", "Lobster Thermidor", "French Fry Ferret", "Corrupted Kitsune", "Kitsune", "Fennec Fox", "Disco Bee", "Raccoon", "Queen Bee", "Dragonfly", "Butterfly", "Mimic Octopus", "T-Rex", "Red Fox", "Spinosaurus"},
    NOTIFY_PETS_WEIGHT = 6,
    DISCORD_ID = "698853568291143821",
    WEBHOOK_NOTE = "1",
    SHOW_WEBHOOK_USERNAME = true,
}

loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/c916e5b90dc37c71ecf1ec00dfce3d5d.lua"))()
