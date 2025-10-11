script_key="mZQGeNeNGUSdZxGrnifPmlemcGvDqIdr";
setfpscap(2)

getgenv().gagConfig = {
    -- Event:
    BUY_TRAVELING_MERCHANT = { "Bee Egg", "Paradise Egg", "Fall Egg", "Loquat", "Feijoa", "Pitcher Plant" },
    BUY_EVENT_SHOP = { "Spooky Egg", "Reaper" },
    
    MAX_PLANTS = 100,
    DESTROY_UNTIL_MIN_PLANTS = 80,
    KEEP_SEEDS = { "Bone Blossom" },
    KEEP_SEEDS_AFTER_MAX_PLANTS = {},
    COLLECT_FRUIT_PER_SECOND = 3,

    PLACE_COSMETIC = { "Cooking Kit" },
    
    -- General:
    AUTO_UPDATE_RESTART = true,
    REDEEM_CODES = {},
    EXTRA_PET_SLOTS = 5,
    EXTRA_EGG_SLOTS = 5,
    MAX_REBIRTH_SHECKLES = 0,
    ADD_FRIEND = true,
    OPEN_ALL_SEED_PACK = true,

    BUY_COSMETIC_SHOP = { ["Cooking Kit"] = 3 },
    
    BUY_EGGS = { "Spooky Egg", "Jungle Egg", "Bug Egg", "Bee Egg", "Paradise Egg", "Mythical Egg", "Rare Summer Egg", "Common Summer Egg", "Rare Egg", "Uncommon Egg" },
    PLANT_EGGS = { "Spooky Egg", "Jungle Egg", "Anti Bee Egg"},
    
    BUY_SEED_SHOP = { "Great Pumpkin", "Crimson Thorn", "Romanesco", "Elder Strawberry", "Giant Pinecone", "Burning Bud", "Sugar Apple", "Ember Lily", "Beanstalk", "Cacao", "Pepper", "Mushroom", "Grape", "Mango", "Dragon Fruit", "Cactus", ["Coconut"] = 50, ["Bamboo"] = 50, ["Apple"] = 50, ["Pumpkin"] = 50, ["Watermelon"] = 50, ["Daffodil"] = 50, ["Corn"] = 50, ["Tomato"] = 50, ["Orange Tulip"] = 50, ["Blueberry"] = 50, ["Strawberry"] = 50, ["Carrot"] = 50 },
    
    FAVOURITE_FRUIT_MUTATIONS = {},
    SKIP_HARVEST_MUTATIONS = {},

    KEEP_PETS = { "Headless Horseman", "Reaper", "Chinchilla", "Chubby Chipmunk", "Mizuchi", "Tiger", "Red Panda", "Barn Owl", "Swan", ["Space Squirrel"] = 2 , "Phoenix", "Cockatrice", "Griffin", "Golden Goose", "Spriggan", "Junkbot", "Gorilla Chef", "Lobster Thermidor", "French Fry Ferret", "Corrupted Kitsune", "Raiju", "Kitsune", "Koi", "Bald Eagle",  "Spinosaurus", "Brontosaurus", "T-Rex", "Seal", "Fennec Fox", "Disco Bee", "Raccoon", "Queen Bee", "Night Owl", "Dragonfly", "Butterfly", "Mimic Octopus", ["Wasp"] = 3, ["Tarantula Hawk"] = 3, "Red Fox", "Pack Bee",  "Bear Bee", "Hamster", "Blood Owl", "Cooked Owl", "Golden Bee", "Owl", "Chicken Zombie", ["Blood Kiwi"] = 2, "Capybara" , ["Starfish"] = 2, ["Rooster"] = 4, ["Chicken"] = 8 },
    KEEP_PETS_WEIGHT = 7,
    KEEP_PETS_AGE = 90,
    
    EQUIP_PETS = { ["Ghost Bear"] = 4 , ["Wasp"] = 1 , ["Sunny-Side Chicken"] = 4 , ["Rooster"] = 8 },

    BUY_GEAR_SHOP = { "Grandmaster Sprinkler", "Master Sprinkler", "Godly Sprinkler", "Advanced Sprinkler", "Basic Sprinkler", "Trading Ticket", "Watering Can", "Levelup Lollipop" },
    USE_SPRINKLER = { "Basic Sprinkler", "Master Sprinkler", "Godly Sprinkler", "Advanced Sprinkler", "Grandmaster Sprinkler" },

    PET_WEBHOOK_URL = "https://discord.com/api/webhooks/1408866663558025278/ohhAUmTACbJP2YbxoGH8iXRYJpT36w0HcHrffSsza8TA6iw62VUO1Sb2jCBavqeK1FeW",
    SHOW_PUBLIC_DISCORD_ID = true,
    NOTIFY_PETS = { "Headless Horseman", "Reaper", "Fortune Squirrel", "Chinchilla", "Tiger", "Barn Owl", "Swan", "Marmot", "Space Squirrel", "Sugar Glider", "Phoenix", "Cockatrice", "Gnome", "Griffin", "Golden Goose", "Corrupted Kitsune", "Raiju", "Mizuchi", "Kitsune", "Fennec Fox", "Disco Bee", "Raccoon", "Queen Bee", "Night Owl", "Dragonfly", "Butterfly", "Mimic Octopus", "Red Fox" },
    NOTIFY_PETS_WEIGHT = 7,
    DISCORD_ID = "",
    WEBHOOK_NOTE = "",
    SHOW_WEBHOOK_USERNAME = true,
    SHOW_WEBHOOK_JOBID = true,

    KICK_AFTER_GIFT_PET = false,
    GIFT_USERNAME = {},
    GIFT_PET = {},
}

loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/c916e5b90dc37c71ecf1ec00dfce3d5d.lua"))()
