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
local mainMenu6 = RageUI.CreateMenu('~r~Garage', '~r~Véhicule')
mainMenu6.Display.Header = true 
mainMenu6.Closed = function()
  open = false
end

function OpenMenu6()
     if open then 
         open = false
         RageUI.Visible(mainMenu6, false)
         return
     else
         open = true 
         RageUI.Visible(mainMenu6, true)
         CreateThread(function()
         while open do 
            RageUI.IsVisible(mainMenu6,function() 

              RageUI.Button("Ranger votre véhicule", nil, {RightLabel = "→→"}, true , {
                onSelected = function()
                  local playerPed = PlayerPedId()
      
                  if IsPedSittingInAnyVehicle(playerPed) then
                    local vehicle = GetVehiclePedIsIn(playerPed, false)
            
                    if GetPedInVehicleSeat(vehicle, -1) == playerPed then
                      ESX.ShowNotification('La voiture a été mis en dans le garage')
                      ESX.Game.DeleteVehicle(vehicle)
                       
                    else
                      ESX.ShowNotification('Mais toi place conducteur, ou sortez de la voiture.')
                    end
                  else
                    local vehicle = ESX.Game.GetVehicleInDirection()
            
                    if DoesEntityExist(vehicle) then
                      ESX.ShowNotification('La voiture à été placer dans le garage.')
                      ESX.Game.DeleteVehicle(vehicle)
            
                    else
                      ESX.ShowNotification('Aucune voitures autours')
                    end
                  end
              end,})

              RageUI.Separator("~h~↓ Véhicules ↓")

                RageUI.Button("Newsvan", nil, {RightLabel = "→→"}, true , {
                    onSelected = function()
                      local model = GetHashKey("newsvan")
                      RequestModel(model)
                      while not HasModelLoaded(model) do Citizen.Wait(10) end
                      local pos = GetEntityCoords(PlayerPedId())
                      local vehicle = CreateVehicle(model, -621.34, -920.81, 23.37, 357.9426, true, true)
                      RageUI.CloseAll()
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
	{x = -615.95, y = -920.53, z = 23.37}
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'journaliste' then 
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 5.0 then
            wait = 0
            DrawMarker(36, -615.95, -920.53, 23.37, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 255, 0, 0 , 255, true, true, p19, true)  

        
            if dist <= 1.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~r~[E]~s~ pour au ~r~garage", 1) 
                if IsControlJustPressed(1,51) then
                  OpenMenu6()
            end
        end
    end
    end
    Citizen.Wait(wait)
    end
end
end)

-- MENU FUNCTION --

local open = false 
local mainMenu7 = RageUI.CreateMenu('~r~Garage', '~r~Véhicule')
mainMenu7.Display.Header = true 
mainMenu7.Closed = function()
  open = false
end

function OpenMenu7()
     if open then 
         open = false
         RageUI.Visible(mainMenu7, false)
         return
     else
         open = true 
         RageUI.Visible(mainMenu7, true)
         CreateThread(function()
         while open do 
            RageUI.IsVisible(mainMenu7,function() 

              RageUI.Button("Ranger votre véhicule", nil, {RightLabel = "→→"}, true , {
                onSelected = function()
                  local playerPed = PlayerPedId()
      
                  if IsPedSittingInAnyVehicle(playerPed) then
                    local vehicle = GetVehiclePedIsIn(playerPed, false)
            
                    if GetPedInVehicleSeat(vehicle, -1) == playerPed then
                      ESX.ShowNotification('La voiture a été mis en dans le garage')
                      ESX.Game.DeleteVehicle(vehicle)
                       
                    else
                      ESX.ShowNotification('Mais toi place conducteur, ou sortez de la voiture.')
                    end
                  else
                    local vehicle = ESX.Game.GetVehicleInDirection()
            
                    if DoesEntityExist(vehicle) then
                      ESX.ShowNotification('La voiture à été placer dans le garage.')
                      ESX.Game.DeleteVehicle(vehicle)
            
                    else
                      ESX.ShowNotification('Aucune voitures autours')
                    end
                  end
              end,})

              RageUI.Separator("~h~↓ Hélico ↓")

                RageUI.Button("Newsheli", nil, {RightLabel = "→→"}, true , {
                    onSelected = function()
                      local model = GetHashKey("newsheli")
                      RequestModel(model)
                      while not HasModelLoaded(model) do Citizen.Wait(10) end
                      local pos = GetEntityCoords(PlayerPedId())
                      local vehicle = CreateVehicle(model, -583.58, -930.49, 36.83, 280.169586, true, true)
                      RageUI.CloseAll()
                    end
                })

                RageUI.Button("Newsheli 2", nil, {RightLabel = "→→"}, true , {
                  onSelected = function()
                    local model = GetHashKey("newsheli2")
                    RequestModel(model)
                    while not HasModelLoaded(model) do Citizen.Wait(10) end
                    local pos = GetEntityCoords(PlayerPedId())
                    local vehicle = CreateVehicle(model, -583.58, -930.49, 36.83, 280.169586, true, true)
                    RageUI.CloseAll()
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
	{x = -583.28, y = -935.91, z = 36.83}
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'journaliste' then 
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 5.0 then
            wait = 0
            DrawMarker(34, -583.28, -935.91, 36.83, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 255, 0, 0 , 255, true, true, p19, true)  

        
            if dist <= 1.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~r~[E]~s~ pour au ~r~garage", 1) 
                if IsControlJustPressed(1,51) then
                  OpenMenu7()
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

    local blip = AddBlipForCoord(-545.97, -908.20, 23.0) 

    SetBlipSprite (blip, 135) -- Model du blip
    SetBlipDisplay(blip, 4)
    SetBlipScale  (blip, 0.7) -- Taille du blip
    SetBlipColour (blip, 1) -- Couleur du blip
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName('Weazel-News') -- Nom du blip
    EndTextCommandSetBlipName(blip)
end)