Config = Config or {}
Config.Shops = {
    ["247"] = { -- key index, needs to be unique and a string
        header = "Convenience Store",
        subheader = "24/7",
        shopIcon = "fa-solid fa-store",
        distance = 2, -- Interact distance
        moneySymbol = "$",
        blip = { -- table or false
            {label = "Shop", coords = {25.6450, -1345.5902, 29.4970}, sprite = 59, color = 2, scale = 0.6}, -- Strawberry Avenue
            {label = "Shop", coords = {-3038.7102, 585.9199, 7.9089}, sprite = 59, color = 2, scale = 0.6}, -- Banham Canyon
            {label = "Shop", coords = {-3241.4783, 1001.1895, 12.8307}, sprite = 59, color = 2, scale = 0.6}, -- Chumash
            {label = "Shop", coords = {547.7677, 2671.9250, 42.1565}, sprite = 59, color = 2, scale = 0.6}, -- Harmony
            {label = "Shop", coords = {1728.7306, 6414.2690, 35.0372}, sprite = 59, color = 2, scale = 0.6}, -- Mount Chiliad
            {label = "Shop", coords = {1698.0547, 4924.4907, 42.0637}, sprite = 59, color = 2, scale = 0.6}, -- Grapeseed
            {label = "Shop", coords = {1961.5067, 3739.9910, 32.3437}, sprite = 59, color = 2, scale = 0.6}, -- Sandy Shores
            {label = "Shop", coords = {2679.1614, 3280.1370, 55.2411}, sprite = 59, color = 2, scale = 0.6}, -- Grand Senora Desert
            {label = "Shop", coords = {2557.9731, 381.9641, 108.6229}, sprite = 59, color = 2, scale = 0.6}, -- Tataviam Mountains
            {label = "Shop", coords = {373.6128, 325.4062, 103.5663}, sprite = 59, color = 2, scale = 0.6}, -- Vinewood
        },
        coords = { -- All locations where you can find the exact same shop, you can add multiple locations for the same shop if u want
            {25.6528, -1347.6392, 29.4970}, -- Strawberry Avenue
            {-3038.7102, 585.9199, 7.9089}, -- Banham Canyon
            {-3241.4783, 1001.1895, 12.8307}, -- Chumash
            {547.7677, 2671.9250, 42.1565}, -- Harmony
            {1728.7306, 6414.2690, 35.0372}, -- Mount Chiliad
            {1698.0547, 4924.4907, 42.0637}, -- Grapeseed
            {1961.5067, 3739.9910, 32.3437}, -- Sandy Shores
            {2679.1614, 3280.1370, 55.2411}, -- Grand Senora Desert
            {2557.9731, 381.9641, 108.6229}, -- Tataviam Mountains
            {373.6128, 325.4062, 103.5663}, -- Vinewood
        },
        canInteract = function()
            -- Maybe you want to restrict the shop, do a check and return true/false
            return true
        end,
        payButtons = { -- Max 2 buttons
        -- account name, used to pay for the items
            {account = "bank", label = "Pay with card"},
            {account = "cash", label = "Pay with cash"}, -- "cash" for QBCore, "money" for ESX
        },
        categories = {
            {
                type = "drinks",
                header = "Drinks", 
                subheader = "Something refreshing", 
                icon = "fa-solid fa-bottle-droplet", 
                canAccess = function() -- You can restrict a category, do your own check and return true/false
                    return true 
                end
            },
            {
                type = "food", 
                header = "Food", 
                subheader = "Something tasty", 
                icon = "fa-solid fa-utensils",
                canAccess = function() -- You can restrict a category, do your own check and return true/false
                    return true 
                end
            },
        },
        items = {
            {name = "water", label = "Water", price = 3, type = "drinks"},
            {name = "sandwich", label = "Sandwich", price = 2, type = "food"},
        }
    }

}