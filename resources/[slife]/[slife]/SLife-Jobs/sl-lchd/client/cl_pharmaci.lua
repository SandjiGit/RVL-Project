Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
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


--- MENU ---

local open = false 
local mainMenu = RageUI.CreateMenu('~b~Pharmacie', '~b~Ambulance') 
mainMenu.Display.Header = true 
mainMenu.Closed = function()
  open = false
end

--- FUNCTION OPENMENU ---

function PharmacieAmbulance() 
    if open then 
		open = false
		RageUI.Visible(mainMenu, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu, true)
		CreateThread(function()
		while open do 
        RageUI.IsVisible(mainMenu, function()

			RageUI.Separator("↓   ~b~Pharmaci    ~s~↓")

			for k, v in pairs(Config2.Pharmacie) do
			RageUI.Button(v.Nom, nil, {RightLabel = "(x1)"}, true, {
				onSelected = function()
					TriggerServerEvent('Pharmacy:giveItem', v.Nom, v.Item)
				end
			})
	
			
		end
		end)			
		Wait(0)
	   end
	end)
 end
end


Citizen.CreateThread(function()
    while true do
		local wait = 750
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
			for k in pairs(Config2.Position.Pharmacie) do
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local pos = Config2.Position.Pharmacie
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= Config2.MarkerDistance then
                    wait = 0
                    DrawMarker(Config2.MarkerType, pos[k].x, pos[k].y, pos[k].z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Config2.MarkerSizeLargeur, Config2.MarkerSizeEpaisseur, Config2.MarkerSizeHauteur, Config2.MarkerColorR, Config2.MarkerColorG, Config2.MarkerColorB, Config2.MarkerOpacite, Config2.MarkerSaute, true, p19, Config2.MarkerTourne)  
                end

                if dist <= 1.0 then
                    wait = 0
                    Visual.Subtitle(Config2.TextPharmacie, 1)
                    if IsControlJustPressed(1,51) then
                        PharmacieAmbulance()
                    end
                end
            end
		end
    Citizen.Wait(wait)
    end
end)