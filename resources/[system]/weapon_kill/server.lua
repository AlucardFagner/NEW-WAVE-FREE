
RegisterNetEvent('weapon_kill:onPlayerKilled', function(killer, weaponHash, coords)
    TriggerClientEvent('weapon_kill:displayHitmark', killer)
end)
