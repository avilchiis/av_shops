function getImage(item)
    if GetResourceState('qb-inventory') == 'started' then
        if not QBCore.Shared.Items then return false end
        if QBCore.Shared.Items[item] and QBCore.Shared.Items[item]['image'] then
            return QBCore.Shared.Items[item]['image']
        end
    end
    return ('%s.png'):format(item)
end