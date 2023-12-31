if Config.Framework == "QBCore" then
    QBCore = exports['qb-core']:GetCoreObject()
end
if Config.Framework == "ESX" then
    ESX = exports['es_extended']:getSharedObject()
end