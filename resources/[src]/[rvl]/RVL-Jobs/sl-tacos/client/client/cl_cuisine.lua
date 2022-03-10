

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
    end
    if ESX.IsPlayerLoaded() then

		ESX.PlayerData = ESX.GetPlayerData()

    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)


-- MENU FUNCTION --

local open = false 
local tacosMain5 = RageUI.CreateMenu('~y~Ta~g~cos', '~g~Interaction')
tacosMain5.Display.Header = true 
tacosMain5.Closed = function()
  open = false
end


function OpenCuisine()
	if open then 
		open = false
		RageUI.Visible(tacosMain5, false)
		return
	else
		open = true 
		RageUI.Visible(tacosMain5, true)
		CreateThread(function()
		while open do 
		   RageUI.IsVisible(tacosMain5,function() 

        RageUI.Separator("~y~↓ Tac~g~os ↓")

			RageUI.Button("Préparer un tacos 2 viandes", "~r~Requis : ~w~Tacos 2 viandes Froid", {RightLabel = "→→"}, true , {
				onSelected = function()
                    local playerPed = PlayerPedId()
                    TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BBQ', 0, true)
                    Citizen.Wait(20000)
                    TriggerServerEvent('craftduntacos2')
                    ClearPedTasksImmediately(playerPed)
                end
			})
			RageUI.Button("Préparer un tacos 3 viandes", "~r~Requis : ~w~Tacos 3 viandes Froid", {RightLabel = "→→"}, true , {
				onSelected = function()
                    local playerPed = PlayerPedId()
                    TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BBQ', 0, true)
                    Citizen.Wait(20000)
                    TriggerServerEvent('craftdunetacos3')
                    ClearPedTasksImmediately(playerPed)
                end
			})

			RageUI.Button("Préparer un tacos XLL", "~r~Requis : ~w~Tacos XLL froid", {RightLabel = "→→"}, true , {
				onSelected = function()
                    local playerPed = PlayerPedId()
                    TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BBQ', 0, true)
                    Citizen.Wait(20000)
                    TriggerServerEvent('craftdunetacosxll')
                    ClearPedTasksImmediately(playerPed)
                end
			})

      RageUI.Separator("~y~↓ Fr~g~ite ↓")

			RageUI.Button("Préparer des petit frite", "~r~Requis : ~w~Petit Frite froid", {RightLabel = "→→"}, true , {
				onSelected = function()
                    local playerPed = PlayerPedId()
                    TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BBQ', 0, true)
                    Citizen.Wait(20000)
                    TriggerServerEvent('craftdunepetitefrite')
                    ClearPedTasksImmediately(playerPed)
                end
			})

			RageUI.Button("Préparer des moyenne frite", "~r~Requis : ~w~Moyenne Frites froid", {RightLabel = "→→"}, true , {
				onSelected = function()
                    local playerPed = PlayerPedId()
                    TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BBQ', 0, true)
                    Citizen.Wait(20000)
                    TriggerServerEvent('craftdunemoyennefrite')
                    ClearPedTasksImmediately(playerPed)
                end
			})
      
      RageUI.Button("Préparer des grande frite", "~r~Requis : ~w~Grande Frites froid", {RightLabel = "→→"}, true , {
				onSelected = function()
                    local playerPed = PlayerPedId()
                    TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BBQ', 0, true)
                    Citizen.Wait(20000)
                    TriggerServerEvent('craftdunegrandefrite')
                    ClearPedTasksImmediately(playerPed)
                end
			})
    
        end)			
		Wait(0)
	   end
	end)
 end
end

        ----OUVRIR LE MENU------------
  local position = {
     {x = 14.31, y = -1597.31, z = 29.38}
    }

        Citizen.CreateThread(function()
          while true do
      
            local wait = 750
      
              for k in pairs(position) do
              if ESX.PlayerData.job and ESX.PlayerData.job.name == 'tacos' then 
                  local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                  local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
      
                  if dist <= 5.0 then
                  wait = 0
                  DrawMarker(22, 14.31, -1597.31, 29.38, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 255, 235, 59, 255, true, true, p19, true)  
      
              
                  if dist <= 1.0 then
                     wait = 0
                      Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour ~y~inté~g~ragir", 1) 
                      if IsControlJustPressed(1,51) then
                OpenCuisine()
                  end
              end
          end
          end
          Citizen.Wait(wait)
          end
      end
      end)