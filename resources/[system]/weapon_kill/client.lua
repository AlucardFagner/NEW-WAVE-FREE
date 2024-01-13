local headshot = {
	[31086] = true
}

local meeleWeapons = {
    ["0"] = true,
    [`WEAPON_UNARMED`] = true,
    [`WEAPON_RUN_OVER_BY_CAR`] = true,
    [`WEAPON_RAMMED_BY_CAR`] = true,
    [`VEHICLE_WEAPON_ROTORS`] = true,
    [`WEAPON_DAGGER`] = true,
    [`WEAPON_BAT`] = true,
    [`WEAPON_BOTTLE`] = true,
    [`WEAPON_CROWBAR`] = true,
    [`WEAPON_FLASHLIGHT`] = true,
    [`WEAPON_GOLFCLUB`] = true,
    [`WEAPON_HAMMER`] = true,
    [`WEAPON_HATCHET`] = true,
    [`WEAPON_KNUCKLE`] = true,
    [`WEAPON_KNIFE`] = true,
    [`WEAPON_MACHETE`] = true,
    [`WEAPON_SWITCHBLADE`] = true,
    [`WEAPON_NIGHTSTICK`] = true,
    [`WEAPON_WRENCH`] = true,
    [`WEAPON_BATTLEAXE`] = true,
    [`WEAPON_POOLCUE`] = true,
    [`WEAPON_STONE_HATCHET`] = true,
    [`WEAPON_GRENADE`] = true,
    [`WEAPON_BZGAS`] = true,
    [`WEAPON_MOLOTOV`] = true,
    [`WEAPON_STICKYBOMB`] = true,
    [`WEAPON_PROXMINE`] = true,
    [`WEAPON_SNOWBALL`] = true,
    [`WEAPON_PIPEBOMB`] = true,
    [`WEAPON_BALL`] = true,
    -- [`WEAPON_SMOKEGRENADE`] = true,
    [`WEAPON_FLARE`] = true,
    [`WEAPON_PETROLCAN`] = true,
    [`WEAPON_PARACHUTE`] = true,
    [`WEAPON_FIREEXTINGUISHER`] = true,
    [`WEAPON_HAZARDCAN`] = true,
    [`WEAPON_PARAFAL`] = true,
    [`WEAPON_FNFAL`] = true,
    [`WEAPON_COLTXM177`] = true
}

AddEventHandler('gameEventTriggered', function (event, args)
    if event ~= 'CEventNetworkEntityDamage' then return end
    local data = {
        victim = args[1],
        attacker = args[2],
    }
    if IsEntityAPed(data.victim) then
        local ped = PlayerPedId()        
        if data.victim == ped and IsPedAPlayer(data.attacker) and data.attacker ~= data.victim then
            data.weaponHash = ({GetCurrentPedWeapon(data.attacker)})[2]
            local _,bone = GetPedLastDamageBone(ped)
            if (bone and bone == 31086 and not meeleWeapons[data.weaponHash]) or GetEntityHealth(ped) <= 100 then 
                ApplyDamageToPed(ped, GetEntityHealth(ped) - 100, false)
                TriggerServerEvent('weapon_kill:onPlayerKilled', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.attacker)), data.weaponHash, GetEntityCoords(ped))
            end
        end
    end
end)

RegisterNetEvent('weapon_kill:displayHitmark', function()
    SendNUIMessage({ 
        display = "hitMarkerShow", 
        color = "#ff0000" 
    })
    Wait(190)
    SendNUIMessage({
        display = "hitMarkerHide"
    })
end)