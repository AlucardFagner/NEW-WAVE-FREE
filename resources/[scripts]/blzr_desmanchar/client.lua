local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vSERVER = Tunnel.getInterface("blzr_desmanchar")

blzr = {}
Tunnel.bindInterface("blzr_desmanchar", blzr)

vRP = Proxy.getInterface("vRP")
vRPclient = Proxy.getInterface("vRP")

---------------------------------------------------------------------
-- CONFIG
---------------------------------------------------------------------
-- FV
local IniciarServico = {1005.39,-1556.34,30.8} -- Onde se inicia o serviço e verifica a existência de um carro
local LocalDesmancharCarro = {1000.38,-1549.23,30.79} -- Onde deve haver o carro que será desmanchado para poder continuar o desmanche
local LocalFerramentas = {994.67,-1556.19,30.76} -- Local onde 'pegará' as ferramentas
local AnuncioChassi = {992.62,-1529.04,30.87} -- Onde finalizará a missão para entregar o chassi e receber dinheiro e itens
local Computador = {1005.15,-1571.1,30.85} -- Local onde ficará o computador de venda
---------------------------------------------------------------------
--VARIAVEIS
---------------------------------------------------------------------
local blips = {}

local permitido = true
local etapa = 0 
local PosVeh = {}
local PecasRemovidas = {}
local TipoVeh = ''
local qtdPecasRemovidas = 0
local PecasVeh = 0



---------------------------------------------------------------------
-- CODIGO
---------------------------------------------------------------------

Citizen.CreateThread(function() 

    lepitopi = CreateObject(GetHashKey("prop_laptop_lester"),Computador[1], Computador[2], Computador[3]-0.97,true,true,true)
    SetEntityHeading(lepitopi, Computador[4])

    while true do
        local ThreadDelay = 5000
        if permitido then
            ThreadDelay = 0
            local ped = PlayerPedId()
            local pedCoords = GetEntityCoords(ped)
            if etapa == 0 then
                local dist = Vdist(pedCoords, IniciarServico[1], IniciarServico[2], IniciarServico[3])
                if dist < 10 then
                    DrawMarker(21, IniciarServico[1], IniciarServico[2], IniciarServico[3]-0.5, 0, 0, 0, 180.0, 0, 0, 0.4, 0.4, 0.4, 207, 158, 25, 150, 0, 0, 0, 1)
                    if dist < 1 then
                        text3D(IniciarServico[1], IniciarServico[2], IniciarServico[3]-0.5, '~y~[E] ~w~PARA DESMANCHAR O VEÍCULO')
                        if IsControlJustPressed(0,38) then
                            veh = CheckVeiculo(LocalDesmancharCarro[1], LocalDesmancharCarro[2], LocalDesmancharCarro[3])
                            if veh then 
                                local VehPermitido, ClasseVeh = CheckClasse(veh)
                                placa = GetVehicleNumberPlateText(veh)
                                nomeCarro = GetDisplayNameFromVehicleModel(GetEntityModel(veh))
                                modeloCarro = nomeCarro
                                -- nomeCarro = GetDisplayNameFromVehicleModel(GetEntityModel(veh))
                                -- modeloCarro = GetLabelText(nomeCarro)
                                -- local modeloDoBanco = vRP.query("vehicles/plateVehicles",{ plate = placa })
                                -- if modeloCarro == "NULL" then
                                --     print(placa,"entrei no if que decide tudo")
                                    
                                --     print(modeloDoBanco[1]["vehicle"],"preciso da tabela doido")
                                --     -- print("resultado json",json.encode(modeloDoBanco))
                                --     -- modeloCarro2 = "nissangtr"
                                --     local modeloCarro = GetLabelText(modeloDoBanco[1]["vehicle"])
                                --     -- local modeloCarro = GetLabelText(modeloCarro2)
                                -- else
                                --     modeloCarro = "NULL"
                                -- end
                                print(veh,VehPermitido,ClasseVeh,placa,nomeCarro,modeloCarro,"veiculo nao permitido")
                                if VehPermitido then 

                                    -- local VehPlayers = vRP.query("vehicles/plateVehicles",{ plate = placa })
                                    if CheckVehPermitido(modeloCarro) then
                                        print("entrei aqui")
                                        if vSERVER.CheckItem() then    
                                            if ClasseVeh == 8 then
                                                TipoVeh = 'moto'
                                            else
                                                TipoVeh = 'carro'
                                            end
                                            
                                            -- NOTIFICACAO AQUI
                                        
                                            TriggerEvent('Notify', 'sucesso ', 'CONTINUANDO SERVIÇO!', 'Veículo identificado: <br>Veículo: <b>' .. modeloCarro .. ' (' .. nomeCarro.. ')</b><br>Placa: <b>'..placa..'</b><br><br>Continue. Pegue as ferramentas para desmanchar o veículo.')
                                            etapa = 1
                                            FreezeEntityPosition(veh, true)
                                            SetVehicleDoorsLocked(veh, 4)
                                            
                                        else
                                            -- TriggerEvent('Notify', 'negado', 'ERRO AO INICIAR O SERVIÇO!', 'Você necessita de um <b>cartão de desmanche</b> para iniciar o serviço.')
                                            TriggerEvent("Notify","verde","Voce precisa de item",5000)
                                        end
                                    else
                                        -- TriggerEvent('Notify', 'negado', 'ERRO AO INICIAR O SERVIÇO!', 'Esse veículo não pode ser desmanchado.')
                                        TriggerEvent("Notify","amarelo","Veiculo nao pode ser desmanchado",5000)
                                    end
                                else
                                    -- TriggerEvent('Notify', 'negado', 'ERRO AO INICIAR O SERVIÇO!', 'O veículo precisa ser um carro, van ou moto.')
                                    TriggerEvent("Notify","vermelho","veiculo precisa ser carro ou van",5000)
                                end
                            else 
                                -- NOTIFICACAO AQUI
                                -- TriggerEvent('Notify', 'negado ', 'ERRO AO INICIAR O SERVIÇO!', 'Não há nenhum carro próximo para ser desmanchado.')
                                TriggerEvent("Notify","azul","Não tem veiculo proximo",5000)
                            end
                        end
                    end
                end
            elseif etapa == 1 then
                local dist = Vdist(pedCoords, LocalFerramentas[1], LocalFerramentas[2], LocalFerramentas[3])
                if dist < 10 then
                    DrawMarker(21, LocalFerramentas[1], LocalFerramentas[2], LocalFerramentas[3]-0.5, 0, 0, 0, 180.0, 0, 0, 0.4, 0.4, 0.4, 207, 158, 25, 150, 0, 0, 0, 1)
                    if dist < 1 then
                        text3D(LocalFerramentas[1], LocalFerramentas[2], LocalFerramentas[3]-0.5, '~y~[E] ~w~PARA PEGAR AS ~y~FERRAMENTAS')
                        if IsControlJustPressed(0,38) then
                            if TipoVeh == 'carro' then
                                PosVeh['Porta_Direita'] = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh,"handle_dside_f"))
                                PosVeh['Porta_Esquerda'] = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh,"handle_pside_f"))
                                PosVeh['Roda_EsquerdaFrente'] = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh,"wheel_lf"))
                                PosVeh['Roda_DireitaFrente'] = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh,"wheel_rf"))
                                PosVeh['Roda_EsquerdaTras'] = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh,"wheel_lr"))
                                PosVeh['Roda_DireitaTras'] = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh,"wheel_rr"))
                                -- PosVeh['Capo'] = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh,"bumper_f"))
                                PecasVeh = 6
                            else
                                PosVeh['Roda_Frente'] = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh,"wheel_lf"))
                                PosVeh['Roda_Tras'] = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh,"wheel_lr"))
                                PosVeh['Banco'] = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh,"chassis_dummy"))
                                PecasVeh = 3
                            end
                            FreezeEntityPosition(ped, true)
                            SetEntityHeading(ped, LocalFerramentas[4])
                            vRP.playAnim(false, {{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "idle_a"}}, true)
                            -- vRP.playAnim(source,false,{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"},true)
                            TriggerEvent('progress', 5000, 'PEGANDO FERRAMENTAS')

                            Wait(5000)  

                            etapa = 2
                            TriggerEvent('Notify', 'sucesso', 'FERRAMENTAS PEGAS!', 'Você pegou todas as ferramentas, vá e desmanche o veículo.')
                            FreezeEntityPosition(ped, false)
                            ClearPedTasks(ped)
                        end
                    end
                end
            elseif etapa == 2 then

                if qtdPecasRemovidas == PecasVeh then
                    etapa = 3
                    -- print('Tudo desmontado, passando proxima etapa')
                    TriggerEvent('Notify', 'sucesso', 'VEÍCULO DESMANCHADO COM SUCESSO!', 'Vá até a bancada e anuncie o chassi do veículo.')
                end

                for k , v in pairs(PosVeh) do
                    local x,y,z = table.unpack(v)
                    if not PecasRemovidas[k] then
                        local dist = Vdist(pedCoords, x,y,z)
                        if dist < 10 then
                            DrawMarker(21, x, y, z+1, 0, 0, 0, 180.0, 0, 0, 0.4, 0.4, 0.4, 207, 158, 25, 150, 0, 0, 0, 1)
                            if dist < 1.0 then
                                text3D(x, y, z+0.5, '~y~[E] ~w~PARA DESMANCHAR')
                                if IsControlJustPressed(0, 38) then
                                    if k == 'Capo' or k == 'pMalas' then
                                       -- vRP.playAnim(false, {{"mini@repair" , "fixing_a_player"}}, true)
                                        vRP._playAnim(false,{task='WORLD_HUMAN_WELDING'},true)
                                    elseif k == 'Porta_Direita' or k == 'Porta_Esquerda' or k == 'Banco' then
                                        vRP._playAnim(false,{task='WORLD_HUMAN_WELDING'},true)
                                    else
                                       -- vRP.playAnim(false, {{"amb@medic@standing@tendtodead@idle_a" , "idle_a"}}, true)
                                        vRP._playAnim(false,{task='WORLD_HUMAN_WELDING'},true)
                                    end
                                    Wait(5000)
                                    ClearPedTasks(ped)
                                    PecasRemovidas[k] = true
                                    qtdPecasRemovidas = qtdPecasRemovidas + 1
                                    if TipoVeh == 'carro' then
                                        if k == 'Roda_EsquerdaFrente' then
                                            SetVehicleTyreBurst(veh, 0, true, 1000)
                                        elseif k == 'Roda_DireitaFrente' then
                                            SetVehicleTyreBurst(veh, 1, true, 1000)
                                        elseif k == 'Roda_EsquerdaTras' then
                                            SetVehicleTyreBurst(veh, 4, true, 1000)
                                        elseif k == 'Roda_DireitaTras' then
                                            SetVehicleTyreBurst(veh, 5, true, 1000)
                                        elseif k == 'Porta_Direita' then
                                            SetVehicleDoorBroken(veh, 0, true)
                                        elseif k == 'Porta_Esquerda' then
                                            SetVehicleDoorBroken(veh, 1, true)
                                        elseif k == 'Capo' then
                                            SetVehicleDoorBroken(veh, 4, true)
                                        end
                                    else
                                        if k == 'Roda_Frente' then
                                            SetVehicleTyreBurst(veh, 0, true, 1000)
                                        elseif k == 'Roda_Tras' then
                                            SetVehicleTyreBurst(veh, 4, true, 1000)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end

            elseif etapa == 3 then
                local dist = Vdist(pedCoords, AnuncioChassi[1], AnuncioChassi[2], AnuncioChassi[3])
                if dist < 10 then
                    DrawMarker(21, AnuncioChassi[1], AnuncioChassi[2], AnuncioChassi[3]-0.5, 0, 0, 0, 180.0, 0, 0, 0.4, 0.4, 0.4, 207, 158, 25, 150, 0, 0, 0, 1)
                    if dist < 1 then
                        text3D(AnuncioChassi[1], AnuncioChassi[2], AnuncioChassi[3]-0.5, '~y~[E] ~w~PARA ANUNCIAR O ~y~CHASSI')
                        if IsControlJustPressed(0,38) then
                            FreezeEntityPosition(ped, true)
                            SetEntityCoords(ped, AnuncioChassi[1], AnuncioChassi[2], AnuncioChassi[3]-0.97)
                            SetEntityHeading(ped, AnuncioChassi[4])
                            vRP.playAnim(false, {{"anim@heists@prison_heistig1_p1_guard_checks_bus", "loop"}}, true)
                            TriggerEvent('progress', 5000, 'ANUNCIANDO CHASSI DO VEÍCULO')
                            Wait(5000)
                            FreezeEntityPosition(ped, false)
                            ClearPedTasks(ped)
                            vSERVER.GerarPagamento(placa, nomeCarro, modeloCarro)
                            print(placa, nomeCarro, modeloCarro, "gerar os pagamentos")
                            DeletarVeiculo(veh)
                            etapa = 0 
                            PosVeh = {}
                            PecasRemovidas = {}
                            TipoVeh = ''
                            qtdPecasRemovidas = 0
                            PecasVeh = 0
                        end
                    end
                end
            end



            if etapa > 0 then
                if IsControlJustPressed(0,168) then
                    -- REMOVER TUDO PARA CANCELAMENTO
                    etapa = 0
                    FreezeEntityPosition(PlayerPedId(), false)
                    ClearPedTasks(PlayerPedId())
                    if veh then
                        FreezeEntityPosition(veh, false)
                    end
                    etapa = 0 
                    PosVeh = {}
                    PecasRemovidas = {}
                    TipoVeh = ''
                    qtdPecasRemovidas = 0
                    PecasVeh = 0
                    TriggerEvent('Notify', 'aviso', 'DESMANCHE', 'Você cancelou o serviço.')
                end
            end


        end
        Citizen.Wait(ThreadDelay)
    end
end)

--[[ Citizen.CreateThread(function() 
    while true do
        if vSERVER.CheckPerm() then
            permitido = true
            -- print('PERMITIDO')
        else
            -- print('N PERMITIDO')
            permitido = false
        end
        Wait(5000)
    end
end) ]]

----------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------- FUNCOES AUXILIARES
----------------------------------------------------------------------------------------------------------------------------------

-- DEBUG
-- RegisterCommand('etapa', function(source, args, rawCmd)
--     veh = CheckVeiculo(LocalDesmancharCarro[1], LocalDesmancharCarro[2], LocalDesmancharCarro[3])
--     PosVeh['Porta_Direita'] = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh,"handle_dside_f"))
--     PosVeh['Porta_Esquerda'] = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh,"handle_pside_f"))
--     PosVeh['Roda_EsquerdaFrente'] = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh,"wheel_lf"))
--     PosVeh['Roda_DireitaFrente'] = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh,"wheel_rf"))
--     PosVeh['Roda_EsquerdaTras'] = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh,"wheel_lr"))
--     PosVeh['Roda_DireitaTras'] = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh,"wheel_rr"))
--     PosVeh['Capo'] = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh,"bumper_f"))
--     PecasVeh = 1
--     TipoVeh = 'carro'

--     -- PosVeh['Roda_Frente'] = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh,"wheel_lf"))
--     -- PosVeh['Roda_Tras'] = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh,"wheel_lr"))
--     -- PosVeh['Banco'] = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh,"chassis_dummy"))
--     -- PecasVeh = 3
--     -- TipoVeh = 'moto'

--     etapa = 2

--     placa = GetVehicleNumberPlateText(veh)
--     nomeCarro = GetDisplayNameFromVehicleModel(GetEntityModel(veh))
--     modeloCarro = GetLabelText(nomeCarro)
-- end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- Check Classe
-----------------------------------------------------------------------------------------------------------------------------------------
function CheckClasse(veh)
    local classe = GetVehicleClass(veh)
    if classe ~= 0 and classe ~= 1 and classe ~= 2 and classe ~= 3 and classe ~= 4 and classe ~= 5 and classe ~= 6 and classe ~= 7 and classe ~= 8 and classe ~= 9 and classe ~= 11 and classe ~= 12 then
        return false, 0
    else
        return true, classe
    end
end

function CheckVehPermitido(nomeCarro)
    local vehs = vSERVER.GetVehs()
    nomeCarro = string.upper(nomeCarro):gsub("%s", "") 
    for k , v in pairs(vehs) do
        -- if string.upper(nomeCarro) == string.upper(k) then
        if string.find(string.upper(k):gsub("%s", ""), nomeCarro) then
            print("ta retornando true")
            return true
        end
    end
    print("ta retornando false")
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TEXT3D
-----------------------------------------------------------------------------------------------------------------------------------------
function text3D(x,y,z,text)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)

	SetTextFont(4)
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,150)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text))/370
	DrawRect(_x,_y+0.0125,0.01+factor,0.03,0,0,0,80)
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- VERIFICAR VAGA VAGA
-----------------------------------------------------------------------------------------------------------------------------------------
function CheckVeiculo(x,y,z)
    local check = GetClosestVehicle(x,y,z,5.001,0,71)
    if DoesEntityExist(check) then
        return check
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETAR VEICULO
-----------------------------------------------------------------------------------------------------------------------------------------
function DeletarVeiculo( entity )
    SetEntityAsMissionEntity(entity, true, true)
    DeleteVehicle(entity)
    -- Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAW TXT
-----------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end