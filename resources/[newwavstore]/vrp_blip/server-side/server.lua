-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")



local isEventActive = false

function SpawnInitialNPCs(player)
    if not isEventActive then
        local playerPed = GetPlayerPed(player) 
        -- local source = source
	    -- local playerPed = vRP.getUserId(source)
            local npcModel = "a_c_mtlion" -- Modelo de NPC inimigo (altere conforme necessário)
            local npc = CreatePed(4, npcModel, -1673.49,-954.81, 7.67, 0.0, true, true) -- criando ped e definindo o locala onde ele nasce
            local npc2 = CreatePed(4, npcModel, -1680.97,-948.26,7.67, 0.0, true, true) -- criando ped e definindo o locala onde ele nasce
            local npc3 = CreatePed(4, npcModel, -1687.38,-936.77,7.68, 0.0, true, true) -- criando ped e definindo o locala onde ele nasce
            local npc4 = CreatePed(4, npcModel, -1685.41,-931.29,7.7, 0.0, true, true)  -- criando ped e definindo o locala onde ele nasce
            local npc5 = CreatePed(4, npcModel, -1677.67,-922.65,7.89, 0.0, true, true) -- criando ped e definindo o locala onde ele nasce 
            local npc6 = CreatePed(4, npcModel, -1664.92,-922.93,8.14, 0.0, true, true) -- criando ped e definindo o locala onde ele nasce 
            local npc7 = CreatePed(4, npcModel, -1653.7,-933.75,8.12, 0.0, true, true)  -- criando ped e definindo o locala onde ele nasce      
        print(playerPed,"id")
        if npc then
            SetPedArmour(npc, 100000)    --- armadura do ped
            TaskCombatPed(npc, playerPed, 0, 16) -- função nativa para o ped atacar o jogador
            TriggerClientEvent('setupPedAttributes', -1, npc) --- puxando a função que esta no client.lua
            print("1")
            SetPedArmour(npc2, 100000)  -- armadura do ped
            TaskCombatPed(npc2, playerPed, 0, 16) -- função nativa para o ped atacar o jogador
            TriggerClientEvent('setupPedAttributes', -1, npc2) --- puxando a função que esta no client.lua
            print("2")
            SetPedArmour(npc3, 100000)    --- armadura do ped
            TaskCombatPed(npc3, playerPed, 0, 16) -- função nativa para o ped atacar o jogador
            TriggerClientEvent('setupPedAttributes', -1, npc3) --- puxando a função que esta no client.lua
            print("3")
            SetPedArmour(npc4, 100000)    --- armadura do ped
            TaskCombatPed(npc4, playerPed, 0, 16) -- função nativa para o ped atacar o jogador
            TriggerClientEvent('setupPedAttributes', -1, npc4) --- puxando a função que esta no client.lua
            print("4")
            SetPedArmour(npc5, 100000)    --- armadura do ped
            TaskCombatPed(npc5, playerPed, 0, 16) -- função nativa para o ped atacar o jogador
            TriggerClientEvent('setupPedAttributes', -1, npc5) --- puxando a função que esta no client.lua
            print("5")
            SetPedArmour(npc6, 100000)    --- armadura do ped
            TaskCombatPed(npc6, playerPed, 0, 16) -- função nativa para o ped atacar o jogador
            TriggerClientEvent('setupPedAttributes', -1, npc6) --- puxando a função que esta no client.lua
            print("6")
            SetPedArmour(npc7, 100000)    --- armadura do ped
            TaskCombatPed(npc7, playerPed, 0, 16) -- função nativa para o ped atacar o jogador
            TriggerClientEvent('setupPedAttributes', -1, npc7) --- puxando a função que esta no client.lua
            print("7")

            -- local vida  = GetEntityHealth(npc)
            -- local vida2 = GetEntityHealth(npc2)
            -- local vida3 = GetEntityHealth(npc3)
            -- local vida4 = GetEntityHealth(npc4)
            -- local vida5 = GetEntityHealth(npc5)
            -- local vida6 = GetEntityHealth(npc6)
            -- local vida7 = GetEntityHealth(npc7)  
        end
    end
end


function SpawnFinalBoss(player)
    if not isEventActive then
        local playerPed = GetPlayerPed(player)
        local bossModel = "a_c_panther" -- Modelo do chefe final (ig_orleans)
        local boss = CreatePed(4, bossModel, -1660.64,-952.48,7.72, 0.0, true, true)   
        if boss then
            SetPedArmour(boss, 200000 )
            TaskCombatPed(boss, playerPed, 0, 16)
            TriggerClientEvent('IncreaseBossSize', -1, boss)
            print("boss")
        end
    end
end



RegisterNetEvent('startHalloweenEvent')
AddEventHandler('startHalloweenEvent', function()
    if not isEventActive then
        local playerPed = GetPlayerPed(player) -- Obtém o jogador que iniciou o evento (-1 representa o jogador local)

        
        -- Verifique se o jogador está vivo
        if not IsEntityDead(playerPed) then
            -- Se o jogador estiver vivo, inicie o evento
            TriggerClientEvent('Notify', -1, 'aviso', 'O evento de Halloween começou!')

            -- Coloque aqui o código para iniciar o spawn de NPCs iniciais
            SpawnInitialNPCs(playerPed)

            -- Coloque aqui o código para iniciar o spawn do chefe final (se for necessário)

            -- Defina o evento como ativo
            isEventActive = true

            -- Agende o término do evento após 5 minutos
            SetTimeout(300000, function()
                -- Verifique se o evento ainda está ativo (para evitar execução múltipla)
                if isEventActive then
                    -- Execute as ações de encerramento do evento aqui
                    -- Por exemplo, recompensar o jogador e encerrar o evento
                end
            end)
        else
            -- Se o jogador estiver morto, teleporte-o para uma localização específica
            SetEntityCoords(playerPed, -1039.66, -2741.02, 13.88)
            SetTimeout(5000, function()
                -- Reviva o jogador após 5 segundos
                exports["survival"]:Revive(110)
            end)
        end
    else
        TriggerClientEvent('Notify', source, 'aviso', 'O evento de Halloween já está em andamento!')
    end
end)



-- RegisterNetEvent('startHalloweenEvent')
-- AddEventHandler('startHalloweenEvent', function()
--     if not isEventActive then
--         -- -- local source = source
--         -- local playerPed = GetPlayerPed(player)      
--             local ped = PlayerPedId()
--             local health = GetEntityHealth(ped)
--             print(health, "vida")
            
--             if health >= 200 then
--                 SpawnInitialNPCs(source)
--             else 
--                 if health <= 101 then
--                     SetEntityCoords(ped, -1039.66, -2741.02, 13.88)
--                     SetTimeout(5000, function()
--                         exports["survival"]:Revive(110)
--                     end)
--                 end
--             end
     
        
--         -- -- local ped = PlayerPedId()
--         -- local health = GetEntityHealth(playerPed)          
--         -- print(health,"brabo")

--         -- Código para iniciar o evento, como notificações e outros preparativos
--         -- local vida  = GetEntityHealth(npc)
       
--         -- SpawnFinalBoss(source)
       
--         TriggerClientEvent('Notify', source, 'aviso', 'O evento de Halloween começou!')   
--         isEventActive = true    

--     else
--         TriggerClientEvent('Notify', source, 'aviso', 'O evento de Halloween já está em andamento!')
--     end
-- end)



-- Exemplo de chamada da função para spawn do chefe final:
-- Chame esta função quando estiver próximo do final do evento (2 minutos antes do término).
-- SpawnFinalBoss(source) -- Certifique-se de adaptar ao seu sistema de eventos.





