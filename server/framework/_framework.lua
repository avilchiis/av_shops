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
        if Config.UsingCustomCrypto and Config.CustomCryptos[account] then
            return Player.PlayerData.metadata.crypto[account]
        else
            return Player.PlayerData.money[account]
        end
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
        if Config.UsingCustomCrypto and Config.CustomCryptos[account] then
            local Crypto = Player.PlayerData.metadata.crypto
            if not Crypto[account] then return end
            Crypto[account] = Crypto[account] - amount
            Player.Functions.SetMetaData("crypto", Crypto)
        else
            Player.Functions.RemoveMoney(account,amount)
        end
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
            xPlayer.addInventoryItem(v['name'],v['amount'])
        end
    end
end