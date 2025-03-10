ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

-- Arrestar a un jugador
RegisterNetEvent('police:arrestPlayer')
AddEventHandler('police:arrestPlayer', function()
    local playerPed = PlayerPedId()
    TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8.0, -1, 49, 0, 0, 0, 0)
    FreezeEntityPosition(playerPed, true)
end)

-- Liberar a un jugador
RegisterNetEvent('police:releasePlayer')
AddEventHandler('police:releasePlayer', function()
    local playerPed = PlayerPedId()
    ClearPedTasksImmediately(playerPed)
    FreezeEntityPosition(playerPed, false)
end)
