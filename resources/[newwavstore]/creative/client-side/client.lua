-----------------------------------------------------------------------------------------------------------------------------------------
-- TYREBURST
-----------------------------------------------------------------------------------------------------------------------------------------
local oldSpeed = 0
local Aiming = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- BIKESMODEL
-----------------------------------------------------------------------------------------------------------------------------------------
local bikesModel = {
	[1131912276] = true,
	[448402357] = true,
	[-836512833] = true,
	[-186537451] = true,
	[1127861609] = true,
	[-1233807380] = true,
	[-400295096] = true
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 999
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped) then
			timeDistance = 1

			DisableControlAction(0,345,true)

			if GetPedConfigFlag(ped,78,true) then
				if not Aiming then
					Aiming = GetFollowVehicleCamViewMode()
				end

				SetFollowVehicleCamViewMode(4)
			else
				if Aiming then
					SetFollowVehicleCamViewMode(Aiming)
					Aiming = false
				end
			end

			local vehicle = GetVehiclePedIsUsing(ped)
			if GetPedInVehicleSeat(vehicle,-1) == ped then
				local speed = GetEntitySpeed(vehicle) * 2.236936
				if speed ~= oldSpeed then
					if (oldSpeed - speed) >= 60 then
						TriggerServerEvent("upgradeStress",10)

						if GetVehicleClass(vehicle) ~= 8 then
							SetVehicleEngineOn(vehicle,false,true,true)

							local vehModel = GetEntityModel(vehicle)
							if bikesModel[vehModel] == nil then
								vehicleTyreBurst(vehicle)
							end
						end
					end

					oldSpeed = speed
				end
			end
		else
			if oldSpeed ~= 0 then
				oldSpeed = 0
			end

			if Aiming then
				Aiming = false
			end
		end

		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADDRIFT
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped) then
			local vehicle = GetVehiclePedIsIn(ped)
			if GetPedInVehicleSeat(vehicle,-1) == ped then
				local vehClass = GetVehicleClass(vehicle)
				if (vehClass >= 0 and vehClass <= 7) or vehClass == 9 then
					if IsControlPressed(1,21) then
						local speed = GetEntitySpeed(vehicle) * 2.236936
						if speed <= 75.0 then
							SetVehicleReduceGrip(vehicle,true)

							if not GetDriftTyresEnabled(vehicle) then
								SetDriftTyresEnabled(vehicle,true)
								SetReduceDriftVehicleSuspension(vehicle,true)
							end
						end
					else
						SetVehicleReduceGrip(vehicle,false)

						if GetDriftTyresEnabled(vehicle) then
							SetDriftTyresEnabled(vehicle,false)
							SetReduceDriftVehicleSuspension(vehicle,false)
						end
					end
				end
			end
		end

		Citizen.Wait(100)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLETYREBURST
-----------------------------------------------------------------------------------------------------------------------------------------
function vehicleTyreBurst(Vehicle)
	local Tyre = math.random(4)

	if Tyre == 1 then
		if GetTyreHealth(Vehicle,0) == 1000.0 then
			SetVehicleTyreBurst(Vehicle,0,true,1000.0)
		end
	elseif Tyre == 2 then
		if GetTyreHealth(Vehicle,1) == 1000.0 then
			SetVehicleTyreBurst(Vehicle,1,true,1000.0)
		end
	elseif Tyre == 3 then
		if GetTyreHealth(Vehicle,4) == 1000.0 then
			SetVehicleTyreBurst(Vehicle,4,true,1000.0)
		end
	elseif Tyre == 4 then
		if GetTyreHealth(Vehicle,5) == 1000.0 then
			SetVehicleTyreBurst(Vehicle,5,true,1000.0)
		end
	end

	if math.random(100) < 30 then
		Citizen.Wait(500)
		vehicleTyreBurst(Vehicle)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = {
	{ 1155.43,-1521.37,34.85,80,38,"Hospital",0.5 },
	{ 1839.43,3672.86,34.27,80,38,"Hospital",0.5 },
	{ -247.42,6331.39,32.42,80,38,"Hospital",0.5 },
	{ 55.43,-876.19,30.66,357,5,"Garagem",0.6 },
	{ 598.04,2741.27,42.07,357,65,"Garagem",0.6 },
	{ -136.36,6357.03,31.49,357,5,"Garagem",0.6 },
	{ 275.23,-345.54,45.17,357,65,"Garagem",0.6 },
	{ 596.40,90.65,93.12,357,65,"Garagem",0.6 },
	{ -340.76,265.97,85.67,357,65,"Garagem",0.6 },
	{ -2030.01,-465.97,11.60,357,65,"Garagem",0.6 },
	{ -1184.92,-1510.00,4.64,357,65,"Garagem",0.6 },
	{ 214.02,-808.44,31.01,357,65,"Garagem",0.6 },
	{ -348.88,-874.02,31.31,357,65,"Garagem",0.6 },
	{ 67.74,12.27,69.21,357,65,"Garagem",0.6 },
	{ 361.90,297.81,103.88,357,65,"Garagem",0.6 },
	{ 1035.89,-763.89,57.99,357,65,"Garagem",0.6 },
	{ -796.63,-2022.77,9.16,357,65,"Garagem",0.6 },
	{ 453.27,-1146.76,29.52,357,65,"Garagem",0.6 },
	{ 528.66,-146.3,58.38,357,65,"Garagem",0.6 },
	{ -1159.48,-739.32,19.89,357,65,"Garagem",0.6 },
	{ 101.22,-1073.68,29.38,357,65,"Garagem",0.6 },
	{ 1725.21,4711.77,42.11,357,65,"Garagem",0.6 },
	{ 1624.05,3566.14,35.15,357,5,"Garagem",0.6 },
	{ -73.35,-2004.6,18.27,357,65,"Garagem",0.6 },
	{ -772.56,-245.07,37.22,357,5,"Garagem",0.6 },
	{ -907.26,-2046.19,9.3,60,29,"Departamento Policial",0.6 },
	{ 1851.45,3686.71,34.26,60,29,"Departamento Policial",0.6 },
	{ -448.18,6011.68,31.71,60,29,"Departamento Policial",0.6 },
	{ 25.68,-1346.6,29.5,52,36,"Loja de Departamento",0.5 },
	{ 2556.47,382.05,108.63,52,36,"Loja de Departamento",0.5 },
	{ 1163.55,-323.02,69.21,52,36,"Loja de Departamento",0.5 },
	{ -707.31,-913.75,19.22,52,36,"Loja de Departamento",0.5 },
	{ -47.72,-1757.23,29.43,52,36,"Loja de Departamento",0.5 },
	{ 373.89,326.86,103.57,52,36,"Loja de Departamento",0.5 },
	{ -3242.95,1001.28,12.84,52,36,"Loja de Departamento",0.5 },
	{ 1729.3,6415.48,35.04,52,36,"Loja de Departamento",0.5 },
	{ 548.0,2670.35,42.16,52,36,"Loja de Departamento",0.5 },
	{ 1960.69,3741.34,32.35,52,36,"Loja de Departamento",0.5 },
	{ 2677.92,3280.85,55.25,52,36,"Loja de Departamento",0.5 },
	{ 1698.5,4924.09,42.07,52,36,"Loja de Departamento",0.5 },
	{ -1820.82,793.21,138.12,52,36,"Loja de Departamento",0.5 },
	{ 1393.21,3605.26,34.99,52,36,"Loja de Departamento",0.5 },
	{ -2967.78,390.92,15.05,52,36,"Loja de Departamento",0.5 },
	{ -3040.14,585.44,7.91,52,36,"Loja de Departamento",0.5 },
	{ 1135.56,-982.24,46.42,52,36,"Loja de Departamento",0.5 },
	{ 1166.0,2709.45,38.16,52,36,"Loja de Departamento",0.5 },
	{ -1487.21,-378.99,40.17,52,36,"Loja de Departamento",0.5 },
	{ -1222.76,-907.21,12.33,52,36,"Loja de Departamento",0.5 },
	{ 159.57,6633.8,31.66,52,36,"Loja de Departamento",0.5 },
	{ -154.2,6329.23,31.56,52,36,"Loja de Departamento",0.5 },
	{ 1692.62,3759.50,34.70,76,6,"Loja de Armas",0.4 },
	{ 252.89,-49.25,69.94,76,6,"Loja de Armas",0.4 },
	{ 843.28,-1034.02,28.19,76,6,"Loja de Armas",0.4 },
	{ -331.35,6083.45,31.45,76,6,"Loja de Armas",0.4 },
	{ -663.15,-934.92,21.82,76,6,"Loja de Armas",0.4 },
	{ -1305.18,-393.48,36.69,76,6,"Loja de Armas",0.4 },
	{ -1118.80,2698.22,18.55,76,6,"Loja de Armas",0.4 },
	{ 2568.83,293.89,108.73,76,6,"Loja de Armas",0.4 },
	{ -3172.68,1087.10,20.83,76,6,"Loja de Armas",0.4 },
	{ 21.32,-1106.44,29.79,76,6,"Loja de Armas",0.4 },
	{ 811.19,-2157.67,29.61,76,6,"Loja de Armas",0.4 },
	{ -815.12,-184.15,37.57,71,62,"Barbearia",0.5 },
	{ 138.13,-1706.46,29.3,71,62,"Barbearia",0.5 },
	{ -1280.92,-1117.07,7.0,71,62,"Barbearia",0.5 },
	{ 1930.54,3732.06,32.85,71,62,"Barbearia",0.5 },
	{ 1214.2,-473.18,66.21,71,62,"Barbearia",0.5 },
	{ -33.61,-154.52,57.08,71,62,"Barbearia",0.5 },
	{ -276.65,6226.76,31.7,71,62,"Barbearia",0.5 },
	{ -1117.26,-1438.74,5.11,366,62,"Loja de Roupas",0.5 },
	{ 75.35,-1392.92,29.38,366,62,"Loja de Roupas",0.5 },
	{ -710.15,-152.36,37.42,366,62,"Loja de Roupas",0.5 },
	{ -163.73,-303.62,39.74,366,62,"Loja de Roupas",0.5 },
	{ -822.38,-1073.52,11.33,366,62,"Loja de Roupas",0.5 },
	{ -1193.13,-767.93,17.32,366,62,"Loja de Roupas",0.5 },
	{ -1449.83,-237.01,49.82,366,62,"Loja de Roupas",0.5 },
	{ 4.83,6512.44,31.88,366,62,"Loja de Roupas",0.5 },
	{ 1693.95,4822.78,42.07,366,62,"Loja de Roupas",0.5 },
	{ 125.82,-223.82,54.56,366,62,"Loja de Roupas",0.5 },
	{ 614.2,2762.83,42.09,366,62,"Loja de Roupas",0.5 },
	{ 1196.72,2710.26,38.23,366,62,"Loja de Roupas",0.5 },
	{ -3170.53,1043.68,20.87,366,62,"Loja de Roupas",0.5 },
	{ -1101.42,2710.63,19.11,366,62,"Loja de Roupas",0.5 },
	{ 425.6,-806.25,29.5,366,62,"Loja de Roupas",0.5 },
	{ 1945.39,3773.5,32.27,366,62,"Loja de Roupas",0.5 },
	{ -1082.22,-247.54,37.77,439,73,"Life Invader",0.6 },
	{ -1728.06,-1050.69,1.71,266,62,"Embarcações",0.5 },
	{ 1966.36,3975.86,31.51,266,62,"Embarcações",0.5 },
	{ -776.72,-1495.02,2.29,266,62,"Embarcações",0.5 },
	{ -893.97,5687.78,3.29,266,62,"Embarcações",0.5 },
	{ 4952.76,-5163.6,-0.3,266,62,"Embarcações",0.5 },
	{ 452.99,-607.74,28.59,513,62,"Motorista",0.5 },
	{ 356.42,274.61,103.14,67,62,"Transportador",0.5 },
	{ -840.21,5399.25,34.61,285,62,"Lenhador",0.5 },
	{ 132.6,-1305.06,29.2,93,62,"Vanilla Unicorn",0.5 },
	{ -565.14,271.56,83.02,93,62,"Tequi-La-La",0.5 },
	{ -172.21,6385.85,31.49,403,5,"Farmácia",0.7 },
	{ 1690.07,3581.68,35.62,403,5,"Farmácia",0.7 },
	{ 315.12,-1068.58,29.39,403,5,"Farmácia",0.7 },
	{ 114.45,-4.89,67.82,403,5,"Farmácia",0.7 },
	{ 46.66,-1749.79,29.64,78,11,"Mercado Central",0.5 },
	{ 2747.28,3473.04,55.67,78,11,"Mercado Central",0.5 },
	{ 82.54,-1553.28,29.59,318,62,"Lixeiro",0.6 },
	{ 287.36,2843.6,44.7,318,62,"Lixeiro",0.6 },
	{ -413.97,6171.58,31.48,318,62,"Lixeiro",0.6 },
	{ -428.56,-1728.33,19.79,467,11,"Reciclagem",0.6 },
	{ 180.07,2793.29,45.65,467,11,"Reciclagem",0.6 },
	{ -195.42,6264.62,31.49,467,11,"Reciclagem",0.6 },
	{ -741.56,5594.94,41.66,36,62,"Teleférico",0.6 },
	{ 454.46,5571.95,781.19,36,62,"Teleférico",0.6 },
	{ -191.92,-1155.04,23.05,357,9,"Impound",0.6 },
	{ 1724.84,3715.31,34.22,357,9,"Impound",0.6 },
	{ -273.96,6121.63,31.41,357,9,"Impound",0.6 },
	{ 744.91,-822.22,22.66,647,4,"Arcade",0.6 },
	{ 475.1,3555.28,33.23,84,27,"Ilegal House", 0.4 },
	{ 112.41,3373.68,35.25,84,27,"Ilegal Cosmetics", 0.4},
	{ 2013.95,4990.88,41.21,84,27,"Ilegal Toys", 0.4 },
	{ 186.9,6374.75,32.33,84,27,"Ilegal Criminal", 0.4 },
	{ -653.12,-1502.67,5.22,84,27,"Ilegal House", 0.4 },
	{ -1266.79,-1158.06,6.79,84,27,"Ilegal Cosmetics", 0.4 }, 
	{ 154.98,-1472.47,29.35,84,27,"Ilegal Toys", 0.4 },
	{ 488.1,-1456.11,29.28,84,27,"Ilegal Criminal", 0.4 },
	{ 822.31,-996.67,26.37,402,26,"Mecânica",0.8 },
	{ 2964.43,2752.88,43.32,617,62,"Minerador",0.6 },
	{ 1322.93,-1652.29,52.27,75,13,"Loja de Tatuagem",0.5 },
	{ -1154.42,-1425.9,4.95,75,13,"Loja de Tatuagem",0.5 },
	{ 322.84,180.16,103.58,75,13,"Loja de Tatuagem",0.5 },
	{ -3169.62,1075.8,20.83,75,13,"Loja de Tatuagem",0.5 },
	{ 1864.07,3747.9,33.03,75,13,"Loja de Tatuagem",0.5 },
	{ -293.57,6199.85,31.48,75,13,"Loja de Tatuagem",0.5 },
	{ 1525.07,3784.92,34.49,86,62,"The Boat House",0.4 },
	{ 405.92,6526.12,27.73,89,62,"Colheita",0.4 },
	{ 2301.09,5064.78,45.81,76,62,"Agricultor",0.4 },
	{ -1178.2,-880.6,13.92,408,62,"BurgerShot",0.5 },
	{ 1584.93,6447.82,25.14,408,62,"Pop's Diner",0.5 },
	{ -580.93,-1074.92,22.33,408,62,"Dishes & Desserts",0.5 },
	{ 789.67,-758.2,26.72,408,62,"Pizza This",0.5 },
	{ -794.43,-218.92,37.07,225,62,"Concessionária",0.7 },
	{ -604.39,-933.23,23.86,184,62,"Weazel News",0.6 },
	{ 919.38,-182.83,74.02,198,62,"Taxista",0.5 },
	{ 1696.19,4785.25,42.02,198,62,"Taxista",0.5 },
	{ -680.9,5832.41,17.32,141,62,"Cabana do Caçador",0.7 },
	{ -772.69,312.77,85.7,475,31,"Hotel",0.5 },
	{ 1142.33,2663.9,38.16,475,31,"Hotel",0.5 },
	{ 562.36,2741.56,42.87,273,11,"Animal Park",0.5 },
	{ 1655.27,4874.31,42.04,374,11,"Imobiliária",0.5 },
	{ -308.09,-163.93,40.42,374,11,"Imobiliária",0.5 },
	{ -535.04,-221.34,37.64,267,5,"Prefeitura",0.6 },
	{ 594.43,146.51,97.31,1,4,"", 0.3 },
	{ 660.57,268.11,102.06,1,4,"", 0.3 },
	{ 552.50,-197.71,53.76,1,4,"", 0.3 },
	{ 339.64,-581.13,73.44,1,4,"", 0.3 },
	{ 696.06,-966.19,23.26,1,4,"", 0.3 },
	{ 1152.45,-1531.43,34.66,1,4,"", 0.3 },
	{ 1382.03,-2081.88,51.28,1,4,"", 0.3 },
	{ 589.08,-2802.64,5.34,1,4,"", 0.3 },
	{ -452.97,-2810.19,6.59,1,4,"", 0.3 },
	{ -1007.09,-2835.14,13.22,1,4,"", 0.3 },
	{ -2018.03,-361.23,47.41,1,4,"", 0.3 },
	{ -1727.11,250.50,61.67,1,4,"", 0.3 },
	{ -1089.41,2717.06,18.35,1,4,"", 0.3 },
	{ 322.07,2870.01,44.33,1,4,"", 0.3 },
	{ 1162.30,2722.15,37.31,1,4,"", 0.3 },
	{ 1745.07,3325.18,40.41,1,4,"", 0.3 },
	{ 2013.45,3934.56,31.65,1,4,"", 0.3 },
	{ 2526.61,4191.89,44.57,1,4,"", 0.3 },
	{ 2874.13,4861.62,61.49,1,4,"", 0.3 },
	{ 1985.15,6200.30,41.32,1,4,"", 0.3 },
	{ 1549.42,6613.58,2.15,1,4,"", 0.3 },
	{ -300.29,6390.89,29.89,1,4,"", 0.3 },
	{ -815.19,5384.08,33.79,1,4,"", 0.3 },
	{ -1613.17,5262.20,3.25,1,4,"", 0.3 },
	{ -199.71,3638.30,63.72,1,4,"", 0.3 },
	{ -1487.49,2688.97,2.96,1,4,"", 0.3 },
	{ -3266.54,1139.91,1.95,1,4,"", 0.3 },
	{ 574.19,132.92,98.45,1,50,"", 0.3 },
	{ 344.74,929.16,202.43,1,50,"", 0.3 },
	{ -123.21,1896.61,196.31,1,50,"", 0.3 },
	{ -1097.20,2705.98,21.97,1,50,"", 0.3 },
	{ -2198.33,4242.54,46.92,1,50,"", 0.3 },
	{ -1486.84,4983.19,62.66,1,50,"", 0.3 },
	{ 1345.95,6396.18,32.39,1,50,"", 0.3 },
	{ 2535.65,4661.52,33.06,1,50,"", 0.3 },
	{ 1166.19,-1339.58,35.07,1,50,"", 0.3 },
	{ 1112.41,-2500.32,32.34,1,50,"", 0.3 },
	{ 259.26,-3113.36,4.80,1,50,"", 0.3 },
	{ -1621.63,-1037.19,12.13,1,50,"", 0.3 },
	{ -3421.65,974.54,10.89,1,50,"", 0.3 },
	{ -1910.37,4624.45,56.06,1,50,"", 0.3 },
	{ 895.66,3212.04,40.52,1,50,"", 0.3 },
	{ 1802.75,4604.32,36.65,1,50,"", 0.3 },
	{ 443.32,6456.24,27.68,1,50,"", 0.3 },
	{ 64.84,6320.81,37.85,1,50,"", 0.3 },
	{ -748.40,5595.82,40.64,1,50,"", 0.3 },
	{ -2683.33,2303.38,20.84,1,56,"", 0.3 },
	{ -2687.00,2304.36,20.84,1,56,"", 0.3 },
	{ -1282.21,2559.87,17.36,1,56,"", 0.3 },
	{ 160.43,3119.01,42.39,1,56,"", 0.3 },
	{ 1062.20,3527.83,33.13,1,56,"", 0.3 },
	{ 2364.56,3154.49,47.20,1,56,"", 0.3 },
	{ 2521.62,2637.86,36.94,1,56,"", 0.3 },
	{ 2572.34,477.76,107.68,1,56,"", 0.3 },
	{ 1206.30,-1089.56,39.24,1,56,"", 0.3 },
	{ 1039.79,-244.01,67.28,1,56,"", 0.3 },
	{ 499.27,-530.36,23.73,1,56,"", 0.3 },
	{ 592.17,-2114.34,4.75,1,56,"", 0.3 },
	{ 513.09,-2584.10,13.34,1,56,"", 0.3 },
	{ -2.98,-1299.73,28.26,1,56,"", 0.3 },
	{ 169.72,-1070.63,29.18,1,56,"", 0.3 },
	{ 712.27,-852.63,23.24,1,56,"", 0.3 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADBLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	for _,v in pairs(blips) do
		local blip = AddBlipForCoord(v[1],v[2],v[3])
		SetBlipSprite(blip,v[4])
		SetBlipAsShortRange(blip,true)
		SetBlipColour(blip,v[5])
		SetBlipScale(blip,v[7])
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(v[6])
		EndTextCommandSetBlipName(blip)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ALPHAS
-----------------------------------------------------------------------------------------------------------------------------------------
local alphas = {
	{ 156.44,-1065.79,30.04,10,66 },
	{ -1188.13,-1574.47,4.35,10,66 },
	{ -777.44,5593.64,33.63,10,66 },
	{ 435.06,-647.39,28.73,10,66 },
	{ -896.38,-779.06,15.91,10,66 },
	{ -1668.56,-998.63,7.38,10,66 },
	{ 102.53,-1957.14,20.74,10,66 },
	{ -161.23,-1623.57,33.65,10,66 },
	{ 337.84,-2036.2,21.37,10,66 },
	{ 524.05,-1829.38,28.43,10,66 },
	{ 232.37,-1756.87,29.0,10,66 },
	{ 143.91,6653.49,31.53,10,66 },
	{ 1703.32,4820.19,41.97,10,66 },
	{ 958.53,3618.86,32.67,10,66 },
	{ 1032.52,2656.05,39.55,10,66 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADALPHA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	for _,v in pairs(alphas) do
		local blip = AddBlipForRadius(v[1],v[2],v[3],v[4] + 0.0)
		SetBlipAlpha(blip,255)
		SetBlipColour(blip,v[5])
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISPATCH
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	for i = 1,25 do
		EnableDispatchService(i,false)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		InvalidateIdleCam()
		InvalidateVehicleIdleCam()

		SetCreateRandomCops(false)
		CancelCurrentPoliceReport()
		SetCreateRandomCopsOnScenarios(false)
		SetCreateRandomCopsNotOnScenarios(false)

		SetVehicleModelIsSuppressed(GetHashKey("jet"),true)
		SetVehicleModelIsSuppressed(GetHashKey("besra"),true)
		SetVehicleModelIsSuppressed(GetHashKey("luxor"),true)
		SetVehicleModelIsSuppressed(GetHashKey("blimp"),true)
		SetVehicleModelIsSuppressed(GetHashKey("polmav"),true)
		SetVehicleModelIsSuppressed(GetHashKey("buzzard2"),true)
		SetVehicleModelIsSuppressed(GetHashKey("mammatus"),true)
		SetPedModelIsSuppressed(GetHashKey("s_m_y_prismuscl_01"),true)
		SetPedModelIsSuppressed(GetHashKey("u_m_y_prisoner_01"),true)
		SetPedModelIsSuppressed(GetHashKey("s_m_y_prisoner_01"),true)

		Citizen.Wait(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		SetWeaponDamageModifierThisFrame("WEAPON_BAT",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_HAMMER",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_WRENCH",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_UNARMED",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_HATCHET",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_CROWBAR",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_MACHETE",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_POOLCUE",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_KNUCKLE",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_GOLFCLUB",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_BATTLEAXE",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_FLASHLIGHT",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_NIGHTSTICK",0.35)
		SetWeaponDamageModifierThisFrame("WEAPON_STONE_HATCHET",0.25)

		RemoveAllPickupsOfType("PICKUP_WEAPON_KNIFE")
		RemoveAllPickupsOfType("PICKUP_WEAPON_PISTOL")
		RemoveAllPickupsOfType("PICKUP_WEAPON_MINISMG")
		RemoveAllPickupsOfType("PICKUP_WEAPON_MICROSMG")
		RemoveAllPickupsOfType("PICKUP_WEAPON_PUMPSHOTGUN")
		RemoveAllPickupsOfType("PICKUP_WEAPON_CARBINERIFLE")
		RemoveAllPickupsOfType("PICKUP_WEAPON_SAWNOFFSHOTGUN")

		DisablePlayerVehicleRewards(PlayerId())

		HideHudComponentThisFrame(1)
		HideHudComponentThisFrame(3)
		HideHudComponentThisFrame(4)
		HideHudComponentThisFrame(5)
		HideHudComponentThisFrame(6)
		HideHudComponentThisFrame(7)
		HideHudComponentThisFrame(8)
		HideHudComponentThisFrame(9)
		HideHudComponentThisFrame(10)
		HideHudComponentThisFrame(11)
		HideHudComponentThisFrame(12)
		HideHudComponentThisFrame(13)
		HideHudComponentThisFrame(15)
		HideHudComponentThisFrame(17)
		HideHudComponentThisFrame(18)
		HideHudComponentThisFrame(21)
		HideHudComponentThisFrame(22)

		DisableControlAction(1,37,true)
		DisableControlAction(1,204,true)
		DisableControlAction(1,211,true)
		DisableControlAction(1,349,true)
		DisableControlAction(1,192,true)
		DisableControlAction(1,157,true)
		DisableControlAction(1,158,true)
		DisableControlAction(1,159,true)
		DisableControlAction(1,160,true)
		DisableControlAction(1,161,true)
		DisableControlAction(1,162,true)
		DisableControlAction(1,163,true)
		DisableControlAction(1,164,true)
		DisableControlAction(1,165,true)

		SetRandomVehicleDensityMultiplierThisFrame(0.5)
		SetVehicleDensityMultiplierThisFrame(0.5)
		SetGarbageTrucks(false)
		SetRandomBoats(false)

		if IsPedArmed(PlayerPedId(),6) then
			DisableControlAction(1,140,true)
			DisableControlAction(1,141,true)
			DisableControlAction(1,142,true)
		end

		Citizen.Wait(1)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- IPLOADER
-----------------------------------------------------------------------------------------------------------------------------------------
local ipList = {
	{
		props = {
			"swap_clean_apt",
			"layer_debra_pic",
			"layer_whiskey",
			"swap_sofa_A"
		},
		coords = { -1150.70,-1520.70,10.60 }
	},{
		props = {
			"csr_beforeMission",
			"csr_inMission"
		},
		coords = { -47.10,-1115.30,26.50 }
	},{
		props = {
			"V_Michael_bed_tidy",
			"V_Michael_M_items",
			"V_Michael_D_items",
			"V_Michael_S_items",
			"V_Michael_L_Items"
		},
		coords = { -802.30,175.00,72.80 }
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADIPLOADER
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	for _k,_v in pairs(ipList) do
		local interiorCoords = GetInteriorAtCoords(_v["coords"][1],_v["coords"][2],_v["coords"][3])
		LoadInterior(interiorCoords)

		if _v["props"] ~= nil then
			for k,v in pairs(_v["props"]) do
				EnableInteriorProp(interiorCoords,v)
				Citizen.Wait(1)
			end
		end

		RefreshInterior(interiorCoords)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TELEPORT
-----------------------------------------------------------------------------------------------------------------------------------------
local teleport = {


	{ 1090.46,206.34,-49.0,935.95,47.12,81.1 },
	{ 935.95,47.12,81.1,1090.46,206.34,-49.0 },

	{ 327.16,-603.53,43.29,338.97,-583.85,74.16 },
	{ 338.97,-583.85,74.16,327.16,-603.53,43.29 },

	{ -741.07,5593.13,41.66,446.19,5568.79,781.19 },
	{ 446.19,5568.79,781.19,-741.07,5593.13,41.66 },

	{ -740.78,5597.04,41.66,446.37,5575.02,781.19 },
	{ 446.37,5575.02,781.19,-740.78,5597.04,41.66 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADHOVERFY
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	local innerTable = {}

	for k,v in pairs(teleport) do
		table.insert(innerTable,{ v[1],v[2],v[3],1,"E","Porta de Acesso","Pressione para acessar" })
	end

	TriggerEvent("hoverfy:insertTable",innerTable)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTELEPORT
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 999
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			local coords = GetEntityCoords(ped)
			for _,v in pairs(teleport) do
				local distance = #(coords - vector3(v[1],v[2],v[3]))
				if distance <= 1 then
					timeDistance = 1

					if IsControlJustPressed(1,38) then
						SetEntityCoords(ped,v[4],v[5],v[6],1,0,0,0)
					end
				end
			end
		end

		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- OPENOBJECTS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 999
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			local coords = GetEntityCoords(ped)

			local distance = #(coords - vector3(254.01,225.21,101.87))
			if distance <= 3.0 then
				timeDistance = 1

				if IsControlJustPressed(1,38) then
					local handle,object = FindFirstObject()
					local finished = false

					repeat
						local heading = GetEntityHeading(object)
						local coordsObj = GetEntityCoords(object)
						local distanceObjs = #(coordsObj - coords)

						if distanceObjs < 3.0 and GetEntityModel(object) == 961976194 then
							if heading > 150.0 then
								SetEntityHeading(object,0.0)
							else
								SetEntityHeading(object,160.0)
							end

							FreezeEntityPosition(object,true)
							finished = true
						end

						finished,object = FindNextObject(handle)
					until not finished

					EndFindObject(handle)
				end
			end
		end

		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADHOVERFY
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	TriggerEvent("hoverfy:insertTable",{{ 254.01,225.21,101.87,1.5,"E","Porta do Cofre","Pressione para abrir/fechar" }})
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUNNYHOP
-----------------------------------------------------------------------------------------------------------------------------------------
local bunnyHope = GetGameTimer()
Citizen.CreateThread(function()
	while true do
		local timeDistance = 999
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			if GetGameTimer() <= bunnyHope then
				timeDistance = 1
				DisableControlAction(1,22,true)
			else
				if IsPedJumping(ped) then
					bunnyHope = GetGameTimer() + 5000
				end
			end
		end

		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHCAMERA
-----------------------------------------------------------------------------------------------------------------------------------------
local fov_max = 80.0
local fov_min = 10.0
local speed_ud = 3.0
local zoomspeed = 2.0
local vehCamera = false
local fov = (fov_max + fov_min) * 0.5
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADCAMERA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local waitPacket = 500
		local ped = PlayerPedId()
		if IsPedInAnyHeli(ped) then
			waitPacket = 4

			local veh = GetVehiclePedIsUsing(ped)
			SetVehicleRadioEnabled(veh,false)

			if IsControlJustPressed(1,51) then
				TriggerEvent("hud:Active",false)
				vehCamera = true
			end

			if IsControlJustPressed(1,154) then
				if GetPedInVehicleSeat(veh,1) == ped or GetPedInVehicleSeat(veh,2) == ped then
					TaskRappelFromHeli(ped,1)
				end
			end

			if vehCamera then
				SetTimecycleModifierStrength(0.3)
				SetTimecycleModifier("heliGunCam")

				local scaleform = RequestScaleformMovie("HELI_CAM")
				while not HasScaleformMovieLoaded(scaleform) do
					Citizen.Wait(1)
				end

				local cam = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA",true)
				AttachCamToEntity(cam,veh,0.0,0.0,-1.5,true)
				SetCamRot(cam,0.0,0.0,GetEntityHeading(veh))
				SetCamFov(cam,fov)
				RenderScriptCams(true,false,0,1,0)
				PushScaleformMovieFunction(scaleform,"SET_CAM_LOGO")
				PushScaleformMovieFunctionParameterInt(0)
				PopScaleformMovieFunctionVoid()

				while vehCamera do
					if IsControlJustPressed(1,51) then
						TriggerEvent("hud:Active",true)
						vehCamera = false
					end

					local zoomvalue = (1.0 / (fov_max - fov_min)) * (fov - fov_min)
					CheckInputRotation(cam,zoomvalue)
					HandleZoom(cam)
					HideHudAndRadarThisFrame()
					HideHudComponentThisFrame(19)
					PushScaleformMovieFunction(scaleform,"SET_ALT_FOV_HEADING")
					PushScaleformMovieFunctionParameterFloat(GetEntityCoords(veh).z)
					PushScaleformMovieFunctionParameterFloat(zoomvalue)
					PushScaleformMovieFunctionParameterFloat(GetCamRot(cam,2).z)
					PopScaleformMovieFunctionVoid()
					DrawScaleformMovieFullscreen(scaleform,255,255,255,255)

					Citizen.Wait(1)
				end

				ClearTimecycleModifier()
				fov = (fov_max + fov_min) * 0.5
				RenderScriptCams(false,false,0,1,0)
				SetScaleformMovieAsNoLongerNeeded(scaleform)
				DestroyCam(cam,false)
				SetNightvision(false)
				SetSeethrough(false)
			end
		end

		Citizen.Wait(waitPacket)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKINPUTROTATION
-----------------------------------------------------------------------------------------------------------------------------------------
function CheckInputRotation(cam,zoomvalue)
	local rightAxisX = GetDisabledControlNormal(0,220)
	local rightAxisY = GetDisabledControlNormal(0,221)
	local rotation = GetCamRot(cam,2)
	if rightAxisX ~= 0.0 or rightAxisY ~= 0.0 then
		new_z = rotation.z + rightAxisX * -1.0 * (speed_ud) * (zoomvalue + 0.1)
		new_x = math.max(math.min(20.0,rotation.x + rightAxisY * -1.0 * (3.0) * (zoomvalue + 0.1)),-89.5)
		SetCamRot(cam,new_x,0.0,new_z,2)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- HANDLEZOOM
-----------------------------------------------------------------------------------------------------------------------------------------
function HandleZoom(cam)
	if IsControlJustPressed(1,241) then
		fov = math.max(fov - zoomspeed,fov_min)
	end

	if IsControlJustPressed(1,242) then
		fov = math.min(fov + zoomspeed,fov_max)
	end

	local current_fov = GetCamFov(cam)
	if math.abs(fov - current_fov) < 0.1 then
		fov = current_fov
	end

	SetCamFov(cam,current_fov + (fov - current_fov) * 0.05)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVISIBLABLES
-----------------------------------------------------------------------------------------------------------------------------------------
LocalPlayer["state"]["Invisible"] = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADHACKER
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		if LocalPlayer["state"]["Active"] then
			local ped = PlayerPedId()

			if not IsEntityVisible(ped) and not LocalPlayer["state"]["Invisible"] then
				TriggerServerEvent("admin:Hacker","está invisível")
			end

			if ForceSocialClubUpdate == nil then
				TriggerServerEvent("admin:Hacker","forçou a social club.")
			end

			if ShutdownAndLaunchSinglePlayerGame == nil then
				TriggerServerEvent("admin:Hacker","entrou no modo single player.")
			end

			if ActivateRockstarEditor == nil then
				TriggerServerEvent("admin:Hacker","ativou o rockstar editor.")
			end
		end

		Citizen.Wait(10000)
	end
end)