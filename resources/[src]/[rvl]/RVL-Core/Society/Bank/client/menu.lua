Citizen.CreateThread(function()
	while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) Citizen.Wait(10) end
    while ESX.GetPlayerData().job == nil do Citizen.Wait(10) end
    if ESX.IsPlayerLoaded() then ESX.PlayerData = ESX.GetPlayerData() end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)
 
local menu = false 
local mainMenu = RageUI.CreateMenu('Banquier', 'MENU')
local subMenu = RageUI.CreateSubMenu(mainMenu, "Annonce", "MENU")
mainMenu.Closed = function() menu = false end

function Menu()
	if menu then menu = false RageUI.Visible(mainMenu, false) return else menu = true RageUI.Visible(mainMenu, true)
		CreateThread(function()
			while menu do 
		   		RageUI.IsVisible(mainMenu,function() 
            		RageUI.Button("Annonce", nil, {RightLabel = "→"}, true, {onSelected = function() end}, subMenu)
					RageUI.Button("Faire une Facture", nil, {RightLabel = "→"}, true , {
						onSelected = function()
							OpenBillingMenu()
                	    	RageUI.CloseAll()
							menu = false
						end
					})
        		end)
                RageUI.IsVisible(subMenu, function() 
                    RageUI.Button("Annonce d'Ouverture", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        	TriggerServerEvent('open:banquier')
                        end
                    })		
					RageUI.Button("Annonce de Fermeture", nil, {RightLabel = "→"}, true , {
    					onSelected = function()
        					TriggerServerEvent('close:banquier')
    					end
					})
                end)
            Wait(0)
          	end
      	end)
    end
end

function OpenBillingMenu()
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'billing', {title = "Facture"},
	    function(data, menu)
		    local amount = tonumber(data.value)
		    local player, distance = ESX.Game.GetClosestPlayer()  
		    if player ~= -1 and distance <= 3.0 then  
		        menu.close()
		        if amount == nil then
			        ESX.ShowNotification("~r~Problème~s~\nMontant Invalide")
		        else
			        local playerPed = GetPlayerPed(-1)
			        TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 0, true)
			        Citizen.Wait(5000)
			        TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_banquier', ('banquier'), amount)
			        Citizen.Wait(100)
			        ESX.ShowNotification("Vous avez bien envoyé la facture")
		        end
		    else
		        ESX.ShowNotification("~r~Problème~s~\nAucun joueur à proximité")
		    end
	    end, function(data, menu)
		menu.close()
	end)
end

function KeyboardInput(TextEntry, ExampleText, MaxStringLength)
	AddTextEntry('FMMC_KEY_TIP1', TextEntry .. ':')
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength)
	blockinput = true
	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do Citizen.Wait(0) end
	if UpdateOnscreenKeyboard() ~= 2 then local result = GetOnscreenKeyboardResult() Citizen.Wait(500) blockinput = false return result
    else Citizen.Wait(500) blockinput = false return nil
	end
end

Citizen.CreateThread(function() 
	local blip = AddBlipForCoord(244.65, 220.41, 106.28) 
				 SetBlipSprite (blip, 536) 
				 SetBlipDisplay(blip, 4) 
				 SetBlipScale  (blip, 0.7) 
				 SetBlipColour (blip, 2) 
				 SetBlipAsShortRange(blip, true) 
				 BeginTextCommandSetBlipName('STRING') 
				 AddTextComponentSubstringPlayerName('Banquier - Pacific Bank') 
				 EndTextCommandSetBlipName(blip) 
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("cs_bankman")
    while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
	end
    ped = CreatePed("PED_TYPE_CIVMALE", "cs_bankman", 247.04, 224.98, 105.28, 164.96, false, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("a_f_y_business_01")
    while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
	end
	ped = CreatePed("PED_TYPE_CIVMALE", "a_f_y_business_01", 243.64, 226.23, 105.28, 158.61, false, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
end)

Keys.Register('F6', 'open', 'Ouvrir le menu banquier', function()
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'banquier' then
    	Menu()
	end
end)
