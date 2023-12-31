CreateThread(function()
    print("^2FREE resource downloaded from^3 https://av-scripts.tebex.io/ ^7")
    print("^2FREE resource downloaded from^3 https://av-scripts.tebex.io/ ^7")
    print("^2FREE resource downloaded from^3 https://av-scripts.tebex.io/ ^7")
end)

lib.callback.register('av_shops:purchase', function(source, account, cart)
    local src = source
    local canPay = false
    local total = 0
    local products = {}
    local myMoney = getMoney(src,account)
    if myMoney then
        for k, v in pairs(cart) do
            total += (v['price'] * v['amount'])
            products[#products+1] = {
                name = v['name'],
                amount = v['amount']
            }
        end
        if myMoney >= total then
            canPay = true
            removeMoney(src, account, total)
            giveItems(src,products)
        else
            TriggerClientEvent("av_shops:notification",src,Lang['not_enough_money'],"red")
        end
    else
        print("^1[ERROR] Account ^3"..account.."^1 doesn't exist in your server, this is NOT a script problem check your config!^7")
        print("^1[ERROR] Account ^3"..account.."^1 doesn't exist in your server, this is NOT a script problem check your config!^7")
        print("^1[ERROR] Account ^3"..account.."^1 doesn't exist in your server, this is NOT a script problem check your config!^7")
    end
    return canPay
end)