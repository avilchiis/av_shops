if Config.Framework == "QBCore" then
    QBCore = exports['qb-core']:GetCoreObject()
end
if Config.Framework == "ESX" then
    ESX = exports['es_extended']:getSharedObject()
end

-- Get Player money
function getMoney(src, account)
    if Config.Framework == "QBCore" then
        local Player = QBCore.Functions.GetPlayer(src)
        return Player.PlayerData.money[account]
    elseif Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer and xPlayer.getAccount(account) then
            return xPlayer.getAccount(account).money
        else
            return false
        end
    end
end

-- Remove money from player
function removeMoney(src, account, amount)
    if Config.Framework == "QBCore" then
        local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.RemoveMoney(account,amount)
    elseif Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(src)
        xPlayer.removeAccountMoney(account,amount)
    end
end

function giveItems(src,itemList)
    if Config.Framework == "QBCore" then
        local Player = QBCore.Functions.GetPlayer(src)
        if Player then
            for k, v in pairs(itemList) do
                Player.Functions.AddItem(v['name'],v['amount'])
            end
        end
    elseif Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer then
            for _, v in pairs(itemList) do
                xPlayer.addInventoryItem(v['name'], v['amount'])
            end
        end
    end
end