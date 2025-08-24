script_key="pakBKJVzXIBWhOgSMvlXWoCJFfeCuBKX";
setfpscap(2)

getgenv().gagConfig = {
    -- Event:
    CRAFT_EVENT = { "Anti Bee Egg", "Skyroot Chest", "Sprout Egg" },
    BUY_TRAVELING_MERCHANT = { "Bee Egg", "Paradise Egg" },
    MAX_EVENT_RESTOCK_SHECKLES = 10_000_000_000_000,  -- Restock stop at..
    BUY_EVENT_SHOP = { "Sprout Egg", "Spriggan", "Skyroot Chest", "Sprout Seed Pack" },

    -- General:
    AUTO_UPDATE_RESTART = false,
    REDEEM_CODES = {},
    EXTRA_PET_SLOTS = 5,
    EXTRA_EGG_SLOTS = 5,
    ADD_FRIEND = true,
    OPEN_ALL_SEED_PACK = false,

    MAX_PLANTS = 300,
    DESTROY_UNTIL_MIN_PLANTS = 200,
    DELETE_PLANTS_AFTER_MAX = { "Carrot", "Strawberry", "Blueberry", "Tomato", "Cauliflower", "Apple", "Coconut" },
    
    BUY_EGGS = {"Mythical Egg", "Bug Egg", "Bee Egg", "Paradise Egg", ["Common Summer Egg"] = 20, ["Rare Summer Egg"] = 20, "Uncommon Egg", ["Rare Egg"] = 99},
    PLANT_EGGS = { ["Sprout Egg"] = 1, "Gourmet Egg", "Zen Egg", "Anti Bee Egg", "Primal Egg", "Bug Egg", "Paradise Egg", "Mythical Egg", "Common Summer Egg", "Rare Summer Egg" },
    
    -- BUY_SEED_SHOP Priority (Left -> Right)
    BUY_SEED_SHOP = { "Romanesco", "Giant Pinecone", "Burning Bud", "Sugar Apple", "Ember Lily", "Beanstalk", "Cacao", "Pepper", "Mushroom", "Grape", "Mango", "Dragon Fruit", "Cactus", "Coconut", "Bamboo", "Apple", "Pumpkin", "Watermelon", "Daffodil", "Tomato", "Orange Tulip", "Blueberry", "Strawberry", "Carrot" },
    KEEP_SEEDS = { "Grand Tomato", "King Cabbage", "Bone Blossom" },
    
    FAVOURITE_FRUIT_MUTATIONS = {},
    SKIP_HARVEST_MUTATIONS = {},

    KEEP_PETS = {["Rooster"] = 16 , ["Chicken"] = 5, ["Mandrake"] = 2, "Griffin", "Chicken Zombie", "Peach Wasp", "Lemon Lion", "Apple Gazelle", "Green Bean", ["Golem"] = 1, "Gorilla Chef", "Golden Goose", ["Spriggan"] = 4, "Lobster Thermidor", ["Gorilla Chef"] = 1, ["Sunny-Side Chicken"] = 35, ["Hotdog Daschund"] = 1, ["Bacon Pig"] = 1, ["Junkbot"] = 3, "French Fry Ferret", ["Spaghetti Sloth"] = 1, ["Mochi Mouse"] = 1, ["Kodama"] = 1, "Corrupted Kitsune", ["Starfish"] = 8, ["Capybara"] = 1, ["Tanchozuru"] = 1, ["Seal"] = 1, "Dilophosaurus", "Brontosaurus", "Ankylosaurus", "Spinosaurus", "Kitsune", "Blood Kiwi", "Disco Bee", "Raccoon", "Queen Bee", "Dragonfly", "Butterfly", "Mimic Octopus", "Red Fox" },
    KEEP_PETS_WEIGHT = 6,

    -- EQUIP_PETS Priority (Left -> Right)
    EQUIP_PETS = {["Starfish"] = 5, ["Seal"] = 3 , ["Lemon Lion"] = 1, ["Grey Mous"] = 2, ["Brown Mouse"] = 2, ["Orange Tabby"] = 2},
    USE_PETS_FOR_UPGRADE_SLOT = { "Starfish" },

    BUY_GEAR_SHOP = { "Grandmaster Sprinkler", "Master Sprinkler", "Godly Sprinkler", "Advanced Sprinkler", "Basic Sprinkler" },
    USE_SPRINKLER = { "Grandmaster Sprinkler", "Basic Sprinkler", "Master Sprinkler", "Godly Sprinkler", "Advanced Sprinkler" },

    PET_WEBHOOK_URL = "https://discord.com/api/webhooks/1408866660017766500/8OgtYYAinAJ9qhpqLxr_jIzUztGg0YqnxzayJql_zAyaYqzoXxUH2OhEoo9DX09HpDOF",
    SEED_WEBHOOK_URL = "", 
    NOTIFY_PETS = { "Griffin", "Golden Goose", "Lobster Thermidor", "French Fry Ferret", "Corrupted Kitsune", "Kitsune", "Fennec Fox", "Disco Bee", "Raccoon", "Queen Bee", "Dragonfly", "Butterfly", "Mimic Octopus", "T-Rex", "Red Fox", "Spinosaurus"},
    NOTIFY_PETS_WEIGHT = 6,
    DISCORD_ID = "698853568291143821",
    WEBHOOK_NOTE = "Dream",
    SHOW_WEBHOOK_USERNAME = true,
}
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/c916e5b90dc37c71ecf1ec00dfce3d5d.lua"))()
