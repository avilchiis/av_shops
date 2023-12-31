local buying = false
RegisterNUICallback("buy", function(data,cb)
    if data['cart'] and data['account'] then
        if not buying then
            buying = true
            local res = lib.callback.await('av_shops:purchase', false, data['account'], data['cart'])
            if res then
                SendNUIMessage({
                    action = "clearCart"
                })
            end
            buying = false
        end
    end
    cb("ok")
end)