local blips = {}

CreateThread(function()
    for k, v in pairs(Config.Shops) do
        if v['blip'] and next(v['blip']) then
            for h, j in pairs(v['blip']) do
                local data = j
                local blip = AddBlipForCoord(data['coords'][1], data['coords'][2], data['coords'][3])
                SetBlipSprite(blip, data['sprite'])
                SetBlipScale(blip, data['scale'])
                SetBlipColour(blip, data['color'])
                SetBlipDisplay(blip, 4)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentSubstringPlayerName(data['label'])
                EndTextCommandSetBlipName(blip)
                blips[#blips+1] = blip
            end
        end
    end
end)