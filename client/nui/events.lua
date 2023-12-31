RegisterNetEvent("av_shops:open", function(index)
    if not index then print("av_shops:open received null as shop index") return end
    if not Config.Shops[index] then 
        print("[ERROR] WRONG SHOP INDEX RECEIVED, "..index.." DOESN'T EXIST IN CONFIG.SHOPS") 
        return 
    end
    local shop = Config.Shops[index]
    local data = {}
    data['header'] = shop['header']
    data['subheader'] = shop['subheader']
    data['shopIcon'] = shop['shopIcon']
    data['payButtons'] = shop['payButtons']
    data['moneySymbol'] = shop['moneySymbol']
    data['inventoryPath'] = Config.InventoryPath
    data['categories'] = {}
    for k, v in pairs(shop['categories']) do
        if v['canAccess']() then
            local index = #data['categories'] + 1
            data['categories'][index] = {
                type = v['type'],
                header = v['header'], 
                subheader = v['subheader'], 
                icon = v['icon'], 
            }
        end
    end
    data['products'] = {}
    for k, v in pairs(shop['items']) do
        v['image'] = getImage(v['name'])
        local index = #data['products'] + 1
        data['products'][index] = v
    end
    data['lang'] = UILang
    SetNuiFocus(true,true)
    SendNUIMessage({
        action = "open",
        data = data
    })
end)

RegisterNUICallback("close", function(data,cb)
    SendNUIMessage({
        action = "close"
    })
    SetNuiFocus(false,false)
    cb("ok")
end)

RegisterNetEvent("av_shops:notification", function(msg, color)
    SendNUIMessage({
        action = "notification",
        data = {
            msg = msg,
            color = color,
        }
    })
end)