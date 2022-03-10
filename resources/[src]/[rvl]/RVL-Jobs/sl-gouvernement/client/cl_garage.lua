ESX = nil

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


RegisterNetEvent('esx:setjob')
AddEventHandler('esx:setjob', function(job)
    ESX.PlayerData.job = job
end)


local open = false 
local mainMenu6 = RageUI.CreateMenu(Config.NomDesMenu.cl_garage, 'Véhicule')
mainMenu6.Display.Header = true 
mainMenu6.Closed = function()
  open = false
end

function OpenMenuGarageGouv()
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

              RageUI.Separator("~h~↓ Véhicules ↓")

                for k,v in pairs(Config.VehiculesBanchisseur) do
                RageUI.Button(v.buttoname, nil, {RightLabel = "→→"}, true , {
                    onSelected = function()
                        if not ESX.Game.IsSpawnPointClear(vector3(v.spawnzone.x, v.spawnzone.y, v.spawnzone.z), 10.0) then
                        ESX.ShowNotification("~g~Gouvernement\n~r~Point de spawn bloquée")
                        else
                            DoScreenFadeOut(1500)
                            Wait(1500)
                        local model = GetHashKey(v.spawnname)
                        RequestModel(model)
                        while not HasModelLoaded(model) do Wait(10) end
                        local gouviveh = CreateVehicle(model, v.spawnzone.x, v.spawnzone.y, v.spawnzone.z, v.headingspawn, true, false)
                        SetVehicleNumberPlateText(gouviveh, "govuernement"..math.random(50, 999))
                        SetVehicleFixed(gouviveh)
                        TaskWarpPedIntoVehicle(PlayerPedId(),  gouviveh,  -1)
                        SetVehRadioStation(gouviveh, 0)
                        DoScreenFadeIn(1500)
                        Wait(1500)
                        end
                    end
                })


              end
            end)
          Wait(0)
         end
      end)
   end
end

local npc = {
	{hash="a_m_m_hasjew_01", x = -522.0233, y = -263.8323, z = 35.47, a = 206.845},
}

Citizen.CreateThread(function()
	for _, item2 in pairs(npc) do
		local hash = GetHashKey(item2.hash)
		while not HasModelLoaded(hash) do
		RequestModel(hash)
		Wait(20)
		end
		ped2 = CreatePed("PED_TYPE_CIVFEMALE", item2.hash, item2.x, item2.y, item2.z-0.92, item2.a, false, true)
		SetBlockingOfNonTemporaryEvents(ped2, true)
		FreezeEntityPosition(ped2, true)
		SetEntityInvincible(ped2, true)
	end
 end)

