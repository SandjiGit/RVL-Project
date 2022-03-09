Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
	end
end)

--- MENU ---

local open = false 
local mainMenu = RageUI.CreateMenu('~y~Tac~g~os', '~g~Frigo') 
mainMenu.Display.Header = true 
mainMenu.Closed = function()
  open = false
end

--- FUNCTION OPENMENU ---

function Shoptacos()
	if open then 
		open = false
		RageUI.Visible(mainMenu, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu, true)
		CreateThread(function()
		while open do 
		   RageUI.IsVisible(mainMenu,function() 

			RageUI.Separator("~y~↓ Tac~g~os ↓")

			RageUI.Button("Tacos 2 viandes Froid", "Sert à faire un tacos 2 viandes", {RightLabel = "~g~25$"}, true , {
				onSelected = function()
					TriggerServerEvent('aurezia:Buytacosfroid2')
				end
			})


			RageUI.Button("Tacos 3 viandes Froid", "Sert à faire un tacos 3 viandes", {RightLabel = "~g~35$"}, true , {
				onSelected = function()
					TriggerServerEvent('aurezia:Buytacosfroid3')
				end
			})

			RageUI.Button("Tacos XLL", "Sert à faire un tacos XLL", {RightLabel = "~g~45$"}, true , {
				onSelected = function()
					TriggerServerEvent('aurezia:Buytacosfroidxll')
				end
			})

			RageUI.Separator("~y~↓ Fr~g~ite ↓")

			RageUI.Button("Petite Frite Froid", "Sert à faire des petit frite", {RightLabel = "~g~10$"}, true , {
				onSelected = function()
					TriggerServerEvent('aurezia:Buypetitefroidfrite')
				end
			})

            RageUI.Button("Moyenne Frite Froid", "Sert à faire des moyenne frite", {RightLabel = "~g~15$"}, true , {
				onSelected = function()
					TriggerServerEvent('aurezia:Buymoyennefroidfrite')
				end
			})

			RageUI.Button("Grande Frite Froid", "Sert à faire des grande frite", {RightLabel = "~g~20$"}, true , {
				onSelected = function()
					TriggerServerEvent('aurezia:Buygrandefroidfrite')
				end
			})

			RageUI.Separator("~y~↓ Gla~g~ce ↓")

            RageUI.Button("Sunday Nature", "Sunday nature tout prét", {RightLabel = "~g~20$"}, true , {
				onSelected = function()
					TriggerServerEvent('aurezia:Buysundaynature')
				end
			})

			RageUI.Button("Sunday Fraise", "Sunday fraise tout prét", {RightLabel = "~g~20$"}, true , {
				onSelected = function()
					TriggerServerEvent('aurezia:Buysundayfraise')
				end
			})
		end)			
		Wait(0)
	   end
	end)
 end
end
		-------------------------------------------------------------------------------------------------------

----OUVRIR LE MENU------------
local position = {
	{x = 11.8, y = -1598.46, z = 29.38}
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
            DrawMarker(22, 11.8, -1598.46, 29.38, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 255, 235, 59, 255, true, true, p19, true)  

        
            if dist <= 1.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour ~y~inté~g~ragir", 1) 
                if IsControlJustPressed(1,51) then
					Shoptacos()
            end
        end
    end
    end
    Citizen.Wait(wait)
    end
end
end)