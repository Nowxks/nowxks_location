ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('Blista')
AddEventHandler('Blista', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 2000
    xPlayer.removeMoney(2000)
end)

RegisterNetEvent('Faggio')
AddEventHandler('Faggio', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 1000
    xPlayer.removeMoney(1000)
end)

RegisterNetEvent('BMX')
AddEventHandler('BMX', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 500
    xPlayer.removeMoney(500)
end)

------------------------CREATED BY Nowxks#0069---------------------------
------------------------CREATED BY Nowxks#0069---------------------------
------------------------CREATED BY Nowxks#0069---------------------------
--                  https://discord.gg/uu9sGjgKGT                      --
------------------------CREATED BY Nowxks#0069---------------------------
------------------------CREATED BY Nowxks#0069---------------------------
------------------------CREATED BY Nowxks#0069--------------------------- 