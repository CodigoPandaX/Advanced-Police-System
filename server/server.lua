ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Arrestar a un jugador
RegisterCommand('arrest', function(source, args, user)
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetId = tonumber(args[1])
    local reason = args[2] or 'Sin motivo'

    if Config.PoliceRanks[xPlayer.job.name] then
        local targetPlayer = ESX.GetPlayerFromId(targetId)
        if targetPlayer then
            local prisonTime = Config.PrisonTime['medio'] -- Default
            TriggerClientEvent('police:arrestPlayer', targetId)
            TriggerClientEvent('chat:addMessage', -1, {
                args = {"^1[SISTEMA]", targetPlayer.name .. " ha sido arrestado por " .. reason}
            })
            MySQL.Async.execute('INSERT INTO police_records (citizen_id, officer_id, reason, time) VALUES (@citizen, @officer, @reason, @time)', {
                ['@citizen'] = targetPlayer.identifier,
                ['@officer'] = xPlayer.identifier,
                ['@reason'] = reason,
                ['@time'] = prisonTime
            })
        else
            TriggerClientEvent('chat:addMessage', source, { args = {"^1[SISTEMA]", "ID no válido"} })
        end
    else
        TriggerClientEvent('chat:addMessage', source, { args = {"^1[SISTEMA]", "No eres policía"} })
    end
end, false)

-- Liberar a un jugador
RegisterCommand('release', function(source, args, user)
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetId = tonumber(args[1])

    if Config.PoliceRanks[xPlayer.job.name] then
        local targetPlayer = ESX.GetPlayerFromId(targetId)
        if targetPlayer then
            TriggerClientEvent('police:releasePlayer', targetId)
            TriggerClientEvent('chat:addMessage', -1, {
                args = {"^1[SISTEMA]", targetPlayer.name .. " ha sido liberado"}
            })
        else
            TriggerClientEvent('chat:addMessage', source, { args = {"^1[SISTEMA]", "ID no válido"} })
        end
    else
        TriggerClientEvent('chat:addMessage', source, { args = {"^1[SISTEMA]", "No eres policía"} })
    end
end, false)
