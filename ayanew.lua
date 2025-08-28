script_key="pakBKJVzXIBWhOgSMvlXWoCJFfeCuBKX";
setfpscap(2)

getgenv().gagConfig = {
    -- Event:
    CRAFT_EVENT = { "Anti Bee Egg", "Skyroot Chest", "Sprout Egg" },
    BUY_TRAVELING_MERCHANT = { "Bee Egg", "Primal Egg", "Paradise Egg", "Rare Summer Egg", "Common Summer Egg" },
    CLAIM_FOOD_CONNOISSEUR_REWARD = {"Culinarian Chest", "Gourmet Egg", "Gorilla Chef"},
    MAX_EVENT_RESTOCK_SHECKLES = 50_000_000_000_000,  -- Restock stop at..
    BUY_EVENT_SHOP = { "Sprout Egg", "Skyroot Chest", "Sprout Seed Pack" },
    
    -- General:
    AUTO_UPDATE_RESTART = false,
    REDEEM_CODES = {},
    EXTRA_PET_SLOTS = 5,
    EXTRA_EGG_SLOTS = 5,
    ADD_FRIEND = true,
    OPEN_ALL_SEED_PACK = false,
    PLACE_COSMETIC = { "Cooking Kit", "Cooking Cauldron" },

    MAX_PLANTS = 300,
    DESTROY_UNTIL_MIN_PLANTS = 200,
    DELETE_PLANTS_AFTER_MAX = { "Carrot", "Strawberry", "Blueberry", "Tomato", "Cauliflower", "Apple", "Coconut" },
    
    BUY_EGGS = {"Mythical Egg", "Bug Egg", "Bee Egg", "Paradise Egg", "Uncommon Egg", ["Common Summer Egg"] = 20 , "Rare Egg" },
    PLANT_EGGS = { "Sprout Egg", "Gourmet Egg", "Corrupted Zen Egg", "Zen Egg", "Dinosaur Egg", "Primal Egg", "Anti Bee Egg", "Bee Egg", "Night Egg", "Bug Egg", "Paradise Egg", "Mythical Egg" },
 
    -- BUY_SEED_SHOP Priority (Left -> Right)
    BUY_SEED_SHOP = { "Romanesco", "Elder Strawberry", "Giant Pinecone", "Burning Bud", "Sugar Apple", "Ember Lily", "Beanstalk", "Cacao", "Pepper", "Mushroom", "Grape", "Mango", "Dragon Fruit", "Cactus", ["Coconut"] = 50, ["Bamboo"] = 50, ["Apple"] = 50, ["Pumpkin"] = 50, ["Watermelon"] = 50, ["Daffodil"] = 50, ["Tomato"] = 50, ["Orange Tulip"] = 50, ["Blueberry"] = 50, ["Strawberry"] = 50, ["Carrot"] = 50 },
    KEEP_SEEDS = { "Grand Tomato", "King Cabbage", "Bone Blossom" },
    KEEP_SEEDS_AFTER_MAX_PLANTS = { "Carrot" },
    
    FAVOURITE_FRUIT_MUTATIONS = {},
    SKIP_HARVEST_MUTATIONS = {},

    KEEP_PETS = {["Rooster"] = 10, ["Chicken"] = 5, ["Mandrake"] = 1, "Griffin", "Chicken Zombie", "Peach Wasp", "Lemon Lion", "Apple Gazelle", "Green Bean", ["Golem"] = 1,"Golden Goose", ["Spriggan"] = 2, "Lobster Thermidor", ["Gorilla Chef"] = 1, ["Sunny-Side Chicken"] = 35, ["Hotdog Daschund"] = 1, ["Bacon Pig"] = 1, ["Junkbot"] = 3, "French Fry Ferret", ["Spaghetti Sloth"] = 1, ["Mochi Mouse"] = 1, ["Kodama"] = 1, "Corrupted Kitsune", ["Starfish"] = 8, ["Capybara"] = 1, ["Tanchozuru"] = 1, ["Seal"] = 1, "Dilophosaurus", "Brontosaurus", "Ankylosaurus", "Spinosaurus", "Kitsune", "Blood Kiwi", "Disco Bee", "Raccoon", "Queen Bee", "Dragonfly", "Butterfly", "Mimic Octopus", "Red Fox" },
    KEEP_PETS_WEIGHT = 6,

    -- EQUIP_PETS Priority (Left -> Right)
    EQUIP_PETS = {["Starfish"] = 8, ["Sunny-Side Chicken"] = 5, "Rooster", "Chicken"},
    USE_PETS_FOR_UPGRADE_SLOT = { "Starfish","Brown Mouse", "Grey Mouse"},

    BUY_GEAR_SHOP = { "Grandmaster Sprinkler", "Master Sprinkler", "Godly Sprinkler", "Advanced Sprinkler", "Basic Sprinkler" },
    USE_SPRINKLER = { "Grandmaster Sprinkler", "Basic Sprinkler", "Master Sprinkler", "Godly Sprinkler", "Advanced Sprinkler" },

    PET_WEBHOOK_URL = "https://discord.com/api/webhooks/1408866660017766500/8OgtYYAinAJ9qhpqLxr_jIzUztGg0YqnxzayJql_zAyaYqzoXxUH2OhEoo9DX09HpDOF",
    SEED_WEBHOOK_URL = "", 
    NOTIFY_PETS = { "Griffin", "Golden Goose", "Lobster Thermidor", "French Fry Ferret", "Corrupted Kitsune", "Kitsune", "Fennec Fox", "Disco Bee", "Raccoon", "Queen Bee", "Dragonfly", "Butterfly", "Mimic Octopus", "T-Rex", "Red Fox", "Spinosaurus"},
    NOTIFY_PETS_WEIGHT = 6,
    DISCORD_ID = "698853568291143821",
    WEBHOOK_NOTE = "1",
    SHOW_WEBHOOK_USERNAME = true,
}

loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/a2234a9cfbe480dfed9eaf6c00a012ca.lua"))()

loadstring(game:HttpGet("https://raw.githubusercontent.com/dsadgeee/Configasfwwqf/refs/heads/main/cfogpige.lua"))()
