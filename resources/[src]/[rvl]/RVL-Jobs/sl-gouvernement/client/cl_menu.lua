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

grade = {}
local Items = {}      
local Armes = {}    
local ArgentSale = {} 
local PlayerData = {}
local open = false 
local mainMenu = RageUI.CreateMenu(Config.NomDesMenu.cl_menu, 'interaction')
local subMenu = RageUI.CreateSubMenu(mainMenu,'Fouiller', 'interaction')
local subMenu1 = RageUI.CreateSubMenu(mainMenu,'Annonce', 'interaction')
local subMenu2 = RageUI.CreateSubMenu(mainMenu,'Gestion Citoyen', 'interaction')
mainMenu.Display.Header = true 
mainMenu.Closed = function()
  open = false
end


function OpenMenuGouv()
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

			RageUI.Checkbox("Prendre son service", nil, servicegouv, {}, {
                onChecked = function(index, items)
                    servicegouv = true
					ESX.ShowNotification("~g~Vous avez pris votre service !")
                end,
                onUnChecked = function(index, items)
                    servicegouv = false
					ESX.ShowNotification("~r~Vous avez quitter votre service !")
                end
            })

			if servicegouv then

			RageUI.Separator("↓ ~y~Annonces ~s~↓")

			RageUI.Button("Annonces", nil, {RightLabel = "→→"}, true , {
				onSelected = function()
				end
			}, subMenu1)

			RageUI.Separator("↓ ~o~Gestion ~s~↓")

			RageUI.Button("Gestion Citoyen", nil, {RightLabel = "→→"}, true , {
				onSelected = function()
				end
			}, subMenu2)


		end
		end)

        RageUI.IsVisible(subMenu2,function()

            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            if closestPlayer ~= -1 and closestDistance < 3 then
				RageUI.Button("Fouiller", nil, {RightLabel = "→"}, true, {
					onSelected = function() 
						if closestDistance <= 5.0 then 
							getPlayerInv(closestPlayer)
							ExecuteCommand("me fouille l'individu")	
						end
					end,
				}, subMenu)
            else
                RageUI.Button("~r~Personne autour de toi !", nil, {}, false, {})
            end

			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			RageUI.Button("Menotter/démenotter", nil, {RightLabel = "→"}, true, {
				onSelected = function() 
					local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
   
					if closestPlayer == -1 or closestDistance > 3.0 then
					ESX.ShowNotification('Aucun joueur proche')
				else
					TriggerServerEvent('gouv:handcuff', GetPlayerServerId(closestPlayer))
				end
			end
		})


	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	RageUI.Button("Escorter", nil, {RightLabel = "→"}, true, {
		onSelected = function() 
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
   
			if closestPlayer == -1 or closestDistance > 3.0 then
			ESX.ShowNotification('Aucun joueur proche')
		else
			TriggerServerEvent('gouv:drag', GetPlayerServerId(closestPlayer))
		end
	end
})



      local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
      RageUI.Button("Mettre dans un véhicule", nil, {RightLabel = "→"}, true, {
	       onSelected = function() 
		local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
   
		if closestPlayer == -1 or closestDistance > 3.0 then
		ESX.ShowNotification('Aucun joueur proche')
	else
		TriggerServerEvent('gouv:putInVehicle', GetPlayerServerId(closestPlayer))
	end
end
})

      local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
      RageUI.Button("Sortir du véhicule", nil, {RightLabel = "→"}, true, {
	     onSelected = function() 
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
   
		if closestPlayer == -1 or closestDistance > 3.0 then
		ESX.ShowNotification('Aucun joueur proche')
	else
		 TriggerServerEvent('gouv:OutVehicle', GetPlayerServerId(closestPlayer))
	 end
  end
  })

end)

  RageUI.IsVisible(subMenu,function()

	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
	RageUI.Separator("↓ ~r~Argent(s) sale(s) ~s~↓")
	for k,v  in pairs(ArgentSale) do
		RageUI.Button("Argent sale :", nil, {RightLabel = "~g~"..v.label.."$"}, true, {
			onSelected = function() 
				local combien = KeyboardInput("Combien ?", '' , '', 8)
				if tonumber(combien) > v.amount then
					RageUI.Popup({message = "~r~quantité invalide"})
				else
					TriggerServerEvent('gouv:confiscatePlayerItem', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
				end
				RageUI.GoBack()
			end
		})
	end

	RageUI.Separator("↓ ~r~Objet(s) ~s~↓")
	for k,v  in pairs(Items) do
		RageUI.Button(v.label, nil, {RightLabel = "~g~x"..v.right}, true, {
			onSelected = function() 
				local combien = KeyboardInput("Combien ?", '' , '', 8)
				if tonumber(combien) > v.amount then
					RageUI.Popup({message = "~r~quantité invalide"})
				else
					TriggerServerEvent('gouv:confiscatePlayerItem', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
				end
				RageUI.GoBack()
			end
		})
	end

	RageUI.Separator("↓ ~r~Arme(s) ~s~↓")

	for k,v  in pairs(Armes) do
		RageUI.Button(v.label, nil, {RightLabel = "com ~g~"..v.right.. " ~s~munitions"}, true, {
			onSelected = function() 
				local combien = KeyboardInput("Combien ?", '' , '', 8)
				if tonumber(combien) > v.amount then
					RageUI.Popup({message = "~r~quantité invalide"})
				else
					TriggerServerEvent('gouv:confiscatePlayerItem', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
				end
				RageUI.GoBack()
			end
		})
	end


end)

RageUI.IsVisible(subMenu1,function()

	RageUI.Button("Annonce [~g~Ouvertures~s~]", nil, {RightLabel = "→"}, true , {
		onSelected = function()
			TriggerServerEvent('Ouvre:gouvernement')
		end
	})

	RageUI.Button("Annonce [~r~Fermetures~s~]", nil, {RightLabel = "→"}, true , {
		onSelected = function()
			TriggerServerEvent('Ferme:gouvernement')
		end
	})

	RageUI.Button("Annonce [~o~Recrutement~s~]", nil, {RightLabel = "→"}, true , {
		onSelected = function()
			TriggerServerEvent('Recru:gouvernement')
		end
	})

	RageUI.Button("Message [~y~Personnalisé~s~]", nil, {RightLabel = "→"}, true , {
		onSelected = function()
			local te = KeyboardInput("Message", "", 100)
			ExecuteCommand("gouv " ..te)
		end
	})


		   end)
           Wait(0)
          end
       end)
    end
  end
  

Keys.Register('F6', 'eaeaeae', 'Ouvrir le menu eaeaeaeae', function()
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'gouvernement' then
    	OpenMenuGouv()
	end
end)

