-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPC = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("tencode",cRP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local codes = {
	[10] = {
		text = "Confronto em andamento",
		blip = 6,
		codis = "COD 5"
	},
	[13] = {
		text = "Oficial ferido",
		blip = 1,
		codis = "QRT"
	},
	[20] = {
		text = "Localização",
		blip = 38,
		codis = "QTH"
	},
	[32] = {
		text = "Homem armado",
		blip = 83,
		codis = "COD 3"
	},
	[38] = {
		text = "Parando veículo suspeito",
		blip = 61,
		codis = "COD 2"
	},
	[50] = {
		text = "Acidente de trânsito",
		blip = 77,
		codis = "COD 1"
	},
	[78] = {
		text = "Reforço solicitado",
		blip = 4,
		codis = "QRR"
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- SENDCODE
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.sendCode(code)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local ped = GetPlayerPed(source)
		local coords = GetEntityCoords(ped)
		local identity = vRP.userIdentity(user_id)
		local policeResult = vRP.numPermission("Police")
		
		for k,v in pairs(policeResult) do
			async(function()
				if code ~= 13 then  
					vRPC.playSound(v,"Event_Start_Text","GTAO_FM_Events_Soundset")
				end
				TriggerClientEvent("NotifyPush",v,{ code = codes[parseInt(code)]["codis"], title = codes[parseInt(code)]["text"], x = coords["x"], y = coords["y"], z = coords["z"], name = identity["name"].." "..identity["name2"], time = "Recebido às "..os.date("%H:%M"), blipColor = codes[parseInt(code)]["blip"] })
			end)
		end
	end
end