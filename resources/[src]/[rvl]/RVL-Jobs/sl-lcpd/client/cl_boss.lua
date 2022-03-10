ESX = nil
societypolice = nil

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
local mainMenu = RageUI.CreateMenu('LCPD', 'oss Action')
mainMenu.Display.Header = true 
mainMenu.Closed = function()
  open = false
end


function BossPolice()
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
            
			if societypolice ~= nil then
                RageUI.Button('Argent de la société:', " ", {RightLabel = ""..societypolice.."$"}, true, {onSelected = function()end});   
            end
            RageUI.Separator("↓ Actions ↓") 
            RageUI.Button('Retirer de l\'argent.', " ", {RightLabel = ">"}, true, {onSelected = function()
                local money = KeyboardInput('Combien voulez vous retirer :', '', 10)
                TriggerServerEvent("police:withdrawMoney","society_"..ESX.PlayerData.job.name ,money)
                RefreshMoney()
            end});   

            RageUI.Button('Déposer de l\'argent.', " ", {RightLabel = ">"}, true, {onSelected = function()
                local money = KeyboardInput('Combien voulez vous retirer :', '', 10)
                TriggerServerEvent("police:depositMoney","society_"..ESX.PlayerData.job.name ,money)
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


function RefreshMoney()
    if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' then
        ESX.TriggerServerCallback('police:getSocietyMoney', function(money)
            societypolice = money
        end, "society_"..ESX.PlayerData.job.name)
    end
end

function Updatessocietypolicemoney(money)
    societypolice = ESX.Math.GroupDigits(money)
    
end


function KeyboardInput(TextEntry, ExampleText, MaxStringLength)

	AddTextEntry('FMMC_KEY_TIP1', TextEntry .. ':')
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength)
	blockinput = true

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Citizen.Wait(0)
	end

	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Citizen.Wait(500)
		blockinput = false
		return result
	else
		Citizen.Wait(500)
		blockinput = false
		return nil
	end
end


Citizen.CreateThread(function()
    while true do
        local wait = 750
        if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' then
            for k in pairs(Config.Position.Boss) do
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local pos = Config.Position.Boss
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= Config.MarkerDistance then
                    wait = 0
                    DrawMarker(6, pos[k].x, pos[k].y, pos[k].z -0.995 , nil, nil, nil, -90, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 166, 255, 130, 0, 1, 2, 0, nil, nil, 0)  
                    --DrawMarker(Config.MarkerType, pos[k].x, pos[k].y, pos[k].z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, Config.MarkerColorR, Config.MarkerColorG, Config.MarkerColorB, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)  
                end

                if dist <= 1.0 then
                    wait = 0
                    Draw3DText(pos[k].x, pos[k].y, pos[k].z, "Appuyez sur ~b~E~s~ pour ~b~intéragir")
                    if IsControlJustPressed(1,51) then
                        BossPolice()
                    end
                end
            end
        end
    Citizen.Wait(wait)
    end
end)

function Draw3DText(x, y, z, text)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local p = GetGameplayCamCoords()
	local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
	local scale = (1 / distance) * 2
	local fov = (1 / GetGameplayCamFov()) * 100
	local scale = scale * fov
	if onScreen then
		SetTextScale(0.0, 0.25)
		SetTextFont(0)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 255)
		SetTextDropshadow(0, 0, 0, 0, 255)
		SetTextEdge(2, 0, 0, 0, 150)
		SetTextDropShadow()
		SetTextOutline()
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
		DrawText(_x,_y)
	end
end