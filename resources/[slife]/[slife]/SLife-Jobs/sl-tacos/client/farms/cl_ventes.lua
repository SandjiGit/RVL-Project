Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
	end
end)

--- MENU ---

local open = false 
local mainMenu = RageUI.CreateMenu('~y~Ven~g~tes', '~g~Tacos')
mainMenu.Display.Header = true 
mainMenu.Closed = function()
  open = false
end

--- FUNCTION OPENMENU ---

function Ventestacos()
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

			RageUI.Button("Giga tacos", nil, {RightLabel = "~r~40$"}, true , {
				onSelected = function()
                    TriggerServerEvent('sellgigatacos')
				end
			}, subMenu)

		   end)
		Wait(0)
	   end
	end)
 end
end
		-------------------------------------------------------------------------------------------------------

local position = {
	{x = -157.81, y = -54.37, z = 54.4}
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'tacos' then 
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 20.0 then
            wait = 0
			DrawMarker(22, -157.81, -54.37, 54.4, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 1.0, 1.0, 1.0, 255, 235, 59, 255, true, true, p19, true)   

        
            if dist <= 1.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour ~y~inté~g~ragir", 1) 
                if IsControlJustPressed(1,51) then
					Ventestacos()
            end
        end
    end
    end
    Citizen.Wait(wait)
    end
end
end)
