-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")

-- Lide com a interação do jogador com o blip
CreateThread(function()
    while true do
    
      Wait(1)
        local playerPed = PlayerId()
        local player = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),-1670.27,-935.63,7.75,true)  
        -- Verifique se o jogador está perto o suficiente do blip
        if player < 6 then
            DrawMarker(42,-1670.27,-935.63,7.75,0,0,0,0,180.0,130.0,1.0,1.0,0.5,255,0,0,100,1,0,0,1)
            if IsControlJustReleased(0, 38) then -- Tecla E
                -- Envie um evento para o servidor para abrir o link do Discord
                TriggerServerEvent('startHalloweenEvent')
            end
        end
    end
end)

    



function SetupPedAttributes(npc)
    SetEntityMaxSpeed(npc, 100)
    TaskWanderStandard(npc, 10.0, 10)
end
function SetupPedAttributes(npc2)
    SetEntityMaxSpeed(npc2, 100)
    TaskWanderStandard(npc2, 10.0, 10)
end
function SetupPedAttributes(npc3)
    SetEntityMaxSpeed(npc3, 100)
    TaskWanderStandard(npc3, 10.0, 10)
end
function SetupPedAttributes(npc4)
    SetEntityMaxSpeed(npc4, 100)
    TaskWanderStandard(npc4, 10.0, 10)
end
function SetupPedAttributes(npc5)
    SetEntityMaxSpeed(npc5, 100)
    TaskWanderStandard(npc5, 10.0, 10)
end
function SetupPedAttributes(npc6)
    SetEntityMaxSpeed(npc6, 100)
    TaskWanderStandard(npc6, 10.0, 10)
end
function SetupPedAttributes(npc7)
    SetEntityMaxSpeed(npc7, 100)
    TaskWanderStandard(npc7, 10.0, 10)
end

function IncreaseBossSize(boss)
    SetEntityMaxSpeed(boss, 200)
    TaskWanderStandard(boss, 10.0, 10)
end


-- No client.lua
RegisterNetEvent('setupPedAttributes')
AddEventHandler('setupPedAttributes', function(npc, npc2, npc3, npc4, npc5, npc6, npc7)
    SetupPedAttributes(npc, npc2, npc3, npc4, npc5, npc6, npc7)
end)

RegisterNetEvent('IncreaseBossSize')
AddEventHandler('IncreaseBossSize', function(boss)
    SetupPedAttributes(boss)

end)






