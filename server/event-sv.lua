ESX = exports["es_extended"]:getSharedObject()



-- player connect to server query
AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
    local source = source
    local license = GetPlayerIdentifierByType(source, 'license')
    license = string.gsub(license, "license:", "")

    local playerData = MySQL.Sync.fetchAll('SELECT * FROM gmd_gangwar WHERE license = @license', {
        ['@license'] = license
    })

    if not next(playerData) or playerData[1].license == '' then
        MySQL.Async.execute('INSERT INTO gmd_gangwar (license, score) VALUES (@license, @score)', {
            ['@license'] = license,
            ['@score'] = 0
        }, function(rowsAffected)
            if rowsAffected > 0 then
                print('Spieler mit Lizenz ' .. license .. ' wurde zur Tabelle gangwar hinzugefügt.')
            else
                print('Fehler beim Hinzufügen des Spielers zur Tabelle gangwar.')
            end
        end)
    else
        print('Spieler mit Lizenz ' .. license .. ' ist bereits in der Tabelle gangwar vorhanden.')
    end
    deferrals.done()
end)
