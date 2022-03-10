ESX = nil
societygouv = nil

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


-- MENU FUNCTION --

local open = false 
local mainMenu = RageUI.CreateMenu(Config.NomDesMenu.cl_boss, 'interaction')
mainMenu.Display.Header = true 
mainMenu.Closed = function()
  open = false
end


function OpenMenuBossGouv()
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
            
			if societygouv ~= nil then
                RageUI.Button('Argent de la société:', " ", {RightLabel = "~g~"..societygouv.."$"}, true, {onSelected = function()end});   
            end
            RageUI.Separator("↓ Actions ↓") 
            RageUI.Button('Retirer de l\'argent.', " ", {RightLabel = ">"}, true, {onSelected = function()
                local money = KeyboardInput('Combien voulez vous retirer :', '', 10)
                TriggerServerEvent("gouv:withdrawMoney","society_"..ESX.PlayerData.job.name ,money)
                RefreshMoney()
            end});   

            RageUI.Button('Déposer de l\'argent.', " ", {RightLabel = ">"}, true, {onSelected = function()
                local money = KeyboardInput('Combien voulez vous retirer :', '', 10)
                TriggerServerEvent("gouv:depositMoney","society_"..ESX.PlayerData.job.name ,money)
                RefreshMoney()
            end});  

            RageUI.Button('Rafraichir le compte.', " ", {RightLabel = ">"}, true, {onSelected = function()
                RefreshMoney()
            end}); 


		   end)
		 Wait(0)
		end
	 end)
  end
end





