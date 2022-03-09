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
local tacosDeTesMort = RageUI.CreateMenu('~y~Gar~g~age', '~g~Interaction')
tacosDeTesMort.Display.Header = true 
tacosDeTesMort.Closed = function()
  open = false
end

function OpenTesMorttacos()
     if open then 
         open = false
         RageUI.Visible(tacosDeTesMort, false)
         return
     else
         open = true 
         RageUI.Visible(tacosDeTesMort, true)
         CreateThread(function()
         while open do 
            RageUI.IsVisible(tacosDeTesMort,function() 

              RageUI.Button("Ranger le véhicule", nil, {RightLabel = "→→"}, true , {
                onSelected = function()
                  local veh,dist4 = ESX.Game.GetClosestVehicle(playerCoords)
                  if dist4 < 4 then
                      DeleteEntity(veh)
                      RageUI.CloseAll()
                end
              end, })


                RageUI.Button("Camion de Tacos", nil, {RightLabel = "→→"}, true , {
                    onSelected = function()
                      local model = GetHashKey("taco")
                      RequestModel(model)
                      while not HasModelLoaded(model) do Citizen.Wait(10) end
                      local pos = GetEntityCoords(PlayerPedId())
                      local vehicle = CreateVehicle(model, 23.45, -1604.84, 29.28, 137.8782, true, true)
                    end
                })

                RageUI.Button("Bifta Tacos", nil, {RightLabel = "→→"}, true , {
                    onSelected = function()
                      local model = GetHashKey("bifta")
                      RequestModel(model)
                      while not HasModelLoaded(model) do Citizen.Wait(10) end
                      local pos = GetEntityCoords(PlayerPedId())
                      local vehicle = CreateVehicle(model, 23.45, -1604.84, 29.28, 137.8782, true, true)
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
	{x = 20.27, y = -1604.77, z = 29.39}
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'tacos' then 
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 15.0 then
            wait = 0
            DrawMarker(22, 20.27, -1604.77, 29.39, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 255, 235, 59, 255, true, true, p19, true)  

        
            if dist <= 1.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour ~y~inté~g~ragir", 1) 
                if IsControlJustPressed(1,51) then
                  OpenTesMorttacos()
            end
        end
    end
    end
    Citizen.Wait(wait)
    end
end
end)

--- BLIPS ---

Citizen.CreateThread(function()

  local blip = AddBlipForCoord(8.86, -1604.33, 29.37) 

  SetBlipSprite (blip, 79) -- Model du blip
  SetBlipDisplay(blip, 4)
  SetBlipScale  (blip, 0.5) -- Taille du blip
  SetBlipColour (blip, 2) -- Couleur du blip
  SetBlipAsShortRange(blip, true)

  BeginTextCommandSetBlipName('STRING')
  AddTextComponentSubstringPlayerName('Tacos') -- Nom du blip
  EndTextCommandSetBlipName(blip)
end)

