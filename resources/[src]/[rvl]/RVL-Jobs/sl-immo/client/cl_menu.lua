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
local mainMenu88 = RageUI.CreateMenu('SL Immo', 'Interaction')
local subMenu88 = RageUI.CreateSubMenu(mainMenu88, "SL Immo", "Annonces")
local subMenu9 =RageUI.CreateSubMenu(mainMenu88, "SL Immo", "Liste des Clients")
mainMenu88.Display.Glare = false;
mainMenu88.Display.Header = true
mainMenu88.Display.PageCounter = false;
mainMenu88.Closed = function()
  open = false
end

function OpenMenu88()
	if open then 
		open = false
		RageUI.Visible(mainMenu8, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu88, true)
		CreateThread(function()
		while open do 
		   RageUI.IsVisible(mainMenu88,function() 

			RageUI.Separator("Divers")
			RageUI.Button("📣  Annonces", nil, {RightLabel = "→"}, true , {
				onSelected = function()
				end
			}, subMenu88)

			RageUI.Button("📝 Faire une Facture", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					OpenBillingMenu2()
                    RageUI.CloseAll()
				end
			})
			RageUI.Separator("")
			RageUI.Separator("Gestion des Logements")
			RageUI.Button("👪 Liste des Clients", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					ExecuteCommand("clients")
					RageUI.CloseAll()
				end
			})

			RageUI.Button("🏠 Créer une Propriété", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					ExecuteCommand("creator")
					RageUI.CloseAll()
				end
			})

			RageUI.Button("Google Doc", "Un Google Doc à été mis en place par le patron, il permet d'archivé les clients et de s'organiser. Merci de le suivre à la lettre ! (Instruction HRP par le Staff)", {RightLabel = ""}, true , {
				onSelected = function()
				end
			})

			end)



			RageUI.IsVisible(subMenu88,function() 

			 RageUI.Button("Annonce Ouvertures", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					TriggerServerEvent('Ouvre:taxi')
				end
			})

			RageUI.Button("Annonce Fermetures", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					TriggerServerEvent('Ferme:taxi')
				end
			})

		   end)
		 Wait(0)
		end
	 end)
  end
end


-- FUNCTION BILLING --

function OpenBillingMenu2()

	ESX.UI.Menu.Open(
	  'dialog', GetCurrentResourceName(), 'billing',
	  {
		title = "Facture"
	  },
	  function(data, menu)
	  
		local amount = tonumber(data.value)
		local player, distance = ESX.Game.GetClosestPlayer()
  
		if player ~= -1 and distance <= 3.0 then
  
		  menu.close()
		  if amount == nil then
			  ESX.ShowNotification("~r~Problèmes~s~: Montant invalide")
		  else
			local playerPed        = GetPlayerPed(-1)
			TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 0, true)
			Citizen.Wait(5000)
			  TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_sl-immo', ('sl-immo'), amount)
			  Citizen.Wait(100)
			  ESX.ShowNotification("Vous avez bien envoyer la facture")
		  end
  
		else
		  ESX.ShowNotification("~r~Problèmes~s~: Aucun joueur à proximitée")
		end
  
	  end,
	  function(data, menu)
		  menu.close()
	  end
	)
  end

-- OUVERTURE DU MENU --

Keys.Register('F6', 'SL-Immo', 'Ouvrir le menu SL-Immo', function()
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'sl-immo' then
    	OpenMenu88()
	end
end)


