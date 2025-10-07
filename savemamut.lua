script_key="vldTBYdTWcXhTNTLAihuPPUqSKdjaxgE";
setfpscap(2)

getgenv().gagConfig = {
    -- Event:
    CRAFT_EVENT = { "Anti Bee Egg", "Skyroot Chest" , "Sprout Egg" },
    BUY_TRAVELING_MERCHANT = { "Bee Egg", "Loquat", "Feijoa", "Pitcher Plant" },
    
    -- General:
    AUTO_UPDATE_RESTART = true,
    REDEEM_CODES = {},
    EXTRA_PET_SLOTS = 5,
    EXTRA_EGG_SLOTS = 5,
    ADD_FRIEND = true,
    OPEN_ALL_SEED_PACK = true,

    MAX_PLANTS = 300,
    DESTROY_UNTIL_MIN_PLANTS = 400,
    DELETE_PLANTS_AFTER_MAX = { "Carrot", "Strawberry", "Blueberry", "Tomato", "Apple" },
    
    BUY_EGGS = { "Anti Bee Egg", "Bug Egg", "Bee Egg", "Paradise Egg", "Mythical Egg", "Rare Summer Egg", "Common Summer Egg", "Rare Egg", "Uncommon Egg" },
    PLANT_EGGS = { "Enchanted Egg", "Sprout Egg", "Gourmet Egg", "Corrupted Zen Egg", "Zen Egg", "Dinosaur Egg", "Primal Egg", "Anti Bee Egg", "Bee Egg", "Night Egg", "Bug Egg", "Paradise Egg", "Mythical Egg", "Common Summer Egg", "Rare Egg", "Uncommon Egg" },
    
    BUY_SEED_SHOP = { "Crimson Thorn", "Romanesco", "Elder Strawberry", "Giant Pinecone", "Burning Bud", "Sugar Apple", "Ember Lily", "Beanstalk", "Cacao", "Pepper", "Mushroom", "Grape", "Mango", "Dragon Fruit", "Cactus", ["Coconut"] = 50, ["Bamboo"] = 50, ["Apple"] = 50, ["Pumpkin"] = 50, ["Watermelon"] = 50, ["Daffodil"] = 50, ["Tomato"] = 50, ["Orange Tulip"] = 50, ["Blueberry"] = 50, ["Strawberry"] = 50, ["Carrot"] = 50 },
    KEEP_SEEDS = { "Bone Blossom" },
    KEEP_SEEDS_AFTER_MAX_PLANTS = { "Carrot", "Strawberry", "Blueberry", "Tomato", "Apple" },
    
    FAVOURITE_FRUIT_MUTATIONS = {},
    SKIP_HARVEST_MUTATIONS = {},

    KEEP_PETS = { "Idol Chipmunk", "Chinchilla", "Mizuchi", "Tiger", "Red Panda", "Barn Owl", "Swan", "Space Squirrel", "Cockatrice", "Drake", "Wisp", "Luminous Sprite", "Wisp Well", "Phoenix", "Griffin", "Brown Mouse", "Squirrel", "Grey Mouse", "Rooster", "Lemon Lion", "Peach Wasp", "Chicken Zombie", "Gorilla Chef", "Green Bean", "Golden Goose", "Spriggan", "Lobster Thermidor", "Sunny-Side Chicken", "French Fry Ferret", "Kodama", "Corrupted Kitsune", "Starfish", "Capybara", "Seal", "Kitsune", "Blood Kiwi", "Disco Bee", "Raccoon", "Queen Bee", "Dragonfly", "Butterfly", "Mimic Octopus", "Red Fox", "Bee", "Honey Bee", "Bear Bee", "Petal Bee", "Wasp", "Tarantula Hawk" },
    KEEP_PETS_WEIGHT = 5,
    KEEP_PETS_AGE = 90,

    EQUIP_PETS = { ["Rooster"] = 2, ["Capybara"] = 1, ["Chicken"] = 5 },
    USE_PETS_FOR_UPGRADE_SLOT = { "Chicken" },
    REMOVE_PET_MAX_UPGRADE = { "Capybara", "Chicken" },  -- Unequip from garden

    BUY_GEAR_SHOP = { "Grandmaster Sprinkler", "Master Sprinkler", "Godly Sprinkler", "Advanced Sprinkler", "Basic Sprinkler", "Trading Ticket" },
    USE_SPRINKLER = { "Basic Sprinkler", "Master Sprinkler", "Godly Sprinkler", "Advanced Sprinkler", "Grandmaster Sprinkler" },

    PET_WEBHOOK_URL = "https://discord.com/api/webhooks/1408866660017766500/8OgtYYAinAJ9qhpqLxr_jIzUztGg0YqnxzayJql_zAyaYqzoXxUH2OhEoo9DX09HpDOF", 
    SHOW_PUBLIC_DISCORD_ID = true,
    NOTIFY_PETS = {},
    NOTIFY_PETS_WEIGHT = 5,
    DISCORD_ID = "698853568291143821",
    WEBHOOK_NOTE = "Pc",
    SHOW_WEBHOOK_USERNAME = true,
    SHOW_WEBHOOK_JOBID = true,
}

loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/6cb882027ef5de19462b160764dcfb53.lua"))()
