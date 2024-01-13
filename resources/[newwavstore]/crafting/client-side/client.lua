-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("crafting")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("invClose",function()
	SetNuiFocus(false,false)
	SendNUIMessage({ action = "hideNUI" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTCRAFTING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestCrafting",function(data,cb)
	local inventoryCraft,inventoryUser,invPeso,invMaxpeso = vSERVER.requestCrafting(data["craft"])
	if inventoryCraft then
		cb({ inventoryCraft = inventoryCraft, inventario = inventoryUser, invPeso = invPeso, invMaxpeso = invMaxpeso })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONCRAFT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("functionCraft",function(data)
	if MumbleIsConnected() then
		vSERVER.functionCrafting(data["index"],data["craft"],data["amount"],data["slot"])
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONDESTROY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("functionDestroy",function(data)
	if MumbleIsConnected() then
		vSERVER.functionDestroy(data["index"],data["craft"],data["amount"],data["slot"])
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("populateSlot",function(data)
	if MumbleIsConnected() then
		TriggerServerEvent("crafting:populateSlot",data["item"],data["slot"],data["target"],data["amount"])
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("updateSlot",function(data)
	if MumbleIsConnected() then
		TriggerServerEvent("crafting:updateSlot",data["item"],data["slot"],data["target"],data["amount"])
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING:UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("crafting:Update")
AddEventHandler("crafting:Update",function(action)
	SendNUIMessage({ action = action })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local craftList = {
	{ 82.45,-1553.26,29.59,"lixeiroShop" },
	{ 287.36,2843.6,44.7,"lixeiroShop" },
	{ -413.68,6171.99,31.48,"lixeiroShop" },
	{ 46.98,-1748.2,29.64,"legalShop" },
	{ 2747.42,3471.54,55.67,"legalShop" },
	{ 93.51,3752.83,40.76,"theLostShop" },  ---armas
	{ 813.34,-752.94,26.77,"pizzaThis" },   --- aruumar um lugar maneiro pra pizza
	{ -1200.02,-898.15,13.99,"burgerShot" },  --- arrumar alguem pra ssumir isso aqui 
	{ 1593.9,6455.35,26.02,"popsDiner" },   ---- ,mais um restaurante precisa de um interior foda
	{ -590.37,-1059.77,22.34,"Desserts" },  --- catcafeee arrumar alguem pra ficar aqui e fazer a boa
	{ -1245.85,-1119.15,0.79, "Triads" },  ---armas 
	-- { 128.59,-3008.95,7.04,"mechanicShop" },   não tem necessidade de ter pois eles pode comprar na loja
	{ 2431.49,4967.31,42.34,"Runners" },   --- trafico de heroina 
	-- { -1870.5,2060.64,135.44,"vinhedoShop" }, --- armas não usar esse aqui!
	{ -1020.85,-1486.28,-3.34, "playboyShop" },    ---- yakuza é o nome fazs balas e espada e colete e attachs
	{ 414.07,-1508.78,29.28,"salierisShop" },  --- só faz prego no futuro coloco junto com o fliperama é isso
	{ 437.49,-1974.46,17.29,"Vagos"},    --- drogas cocaine
	{ 799.77,-82.79,75.42, "Ballas"},   --- drogas meta
	{ 112.62,6359.73,32.3, "Families"},  --- drogas maconha
	{ 166.15,-1710.81,22.71, "Bloods"}, --- droga lean talves tira os bloods e adiciona uma favela que esta sobrando
	{ 2535.97,4121.82,31.46, "EastSide"},  --- drogas oxy esse aqui colocar a favela da barragem aqui
	{ 549.84,2684.71,35.55, "Aztecas"},  ---- drogas ecstasy colocar a favela do norte perto da praia aqui
	{ 27.43,6473.54,31.9, "Angels"},  --- faz balas e attachs igual yakuza 
	{ 94.67,-1294.47,29.27, "Vanilla"},    --- vanilla lavagem de dinheiro e somente por enquanto
	{ 723.96,-791.34,16.48, "Arcade"} --- arcade tools capuz, algemas e lockpicks e bloqeuador de sinal 

	-- guarda essa loc serve pra farme de meta -146.07,6310.26,25.07

}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTARGET
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)

	for k,v in pairs(craftList) do
		exports["target"]:AddCircleZone("Crafting:"..k,vector3(v[1],v[2],v[3]),1.0,{
			name = "Crafting:"..k,
			heading = 3374176
		},{
			shop = k,
			distance = 1.0,
			options = {
				{
					event = "crafting:openSystem",
					label = "Abrir",
					tunnel = "shop"
				}
			}
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING:OPENSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("crafting:openSystem",function(shopId)
	if vSERVER.requestPerm(craftList[shopId][4]) then
		SetNuiFocus(true,true)
		SendNUIMessage({ action = "showNUI", name = craftList[shopId][4] })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING:FUELSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("crafting:fuelShop",function()
	SetNuiFocus(true,true)
	SendNUIMessage({ action = "showNUI", name = "fuelShop" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING:OPENSOURCE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("crafting:openSource")
AddEventHandler("crafting:openSource",function()
	SetNuiFocus(true,true)
	SendNUIMessage({ action = "showNUI", name = "craftShop" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING:AMMUNATION
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("crafting:Ammunation")
AddEventHandler("crafting:Ammunation",function()
	SetNuiFocus(true,true)
	SendNUIMessage({ action = "showNUI", name = "ammuShop" })
end)