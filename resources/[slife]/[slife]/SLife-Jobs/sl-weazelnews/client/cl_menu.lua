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
local mainMenu8 = RageUI.CreateMenu('Weazel-News', 'Interaction')
local subMenu8 = RageUI.CreateSubMenu(mainMenu8, "Annonces", "Interaction")
local subMenu9 = RageUI.CreateSubMenu(mainMenu8, "Équipement", "Interaction")
mainMenu8.Display.Header = true 
mainMenu8.Closed = function()
  open = false
end

function OpenMenu8()
	if open then 
		open = false
		RageUI.Visible(mainMenu8, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu8, true)
		CreateThread(function()
		while open do 
		   RageUI.IsVisible(mainMenu8,function() 

			RageUI.Separator("~r~↓ Annonces ↓")
			RageUI.Button("Annonces", nil, {RightLabel = "→→"}, true , {
				onSelected = function()
				end
			}, subMenu8)

			RageUI.Separator("~r~↓ Équipement ↓")
			RageUI.Button("Équipement", nil, {RightLabel = "→→"}, true , {
				onSelected = function()
				end
			}, subMenu9)

			RageUI.Separator("~r~↓ Factures ↓")
			RageUI.Button("Faire une Facture", nil, {RightLabel = "→→"}, true , {
				onSelected = function()
					OpenBillingMenu2()
                    RageUI.CloseAll()
				end
			})

		end)
			
			RageUI.IsVisible(subMenu9,function() 

			RageUI.Button('Sortir/ranger la camera', nil, {}, true, {
				onSelected = function()
					ToogleCam()
				end,
			})

			RageUI.Button('Sortir/ranger le micro', nil, {}, true, {
				onSelected = function()
					ToogleMic()
				end,
			})

			RageUI.Button('Sortir/ranger le micro perche', nil, {}, true, {
				onSelected = function()
					ToogleBmic()
				end,
			})
			end)

			RageUI.IsVisible(subMenu8,function() 

			 RageUI.Button("Annonce Ouvertures", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					TriggerServerEvent('Ouvre:journaliste')
				end
			})

			RageUI.Button("Annonce Fermetures", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					TriggerServerEvent('Ferme:journaliste')
				end
			})

			RageUI.Button("Annonce Recrutement", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					TriggerServerEvent('Recru:journaliste')
				end
			})

			RageUI.Button("Message Personnalisé", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					local te = KeyboardInput("Message", "", 100)
					ExecuteCommand("jou " ..te)
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
			  TriggerEvent("notify", 4, "SLife Personnage", "Problème: Montant Invalide")
		  else
			local playerPed        = GetPlayerPed(-1)
			TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 0, true)
			Citizen.Wait(5000)
			  TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_journaliste', ('journaliste'), amount)
			  Citizen.Wait(100)
			  ESX.ShowNotification("~r~Vous avez bien envoyer la facture")
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

Keys.Register('F6', 'journaliste', 'Ouvrir le menu journaliste', function()
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'journaliste' then
    	OpenMenu8()
	end
end)

local inCam = false
local camId = nil
local camModel = "prop_v_cam_01"
local camanimDict = "missfinale_c2mcs_1"
local camanimName = "fin_c2_mcs_1_camman"

function ToogleCam()
	if not inCam then
		inCam = true
		RequestModel(GetHashKey(camModel))
		while not HasModelLoaded(GetHashKey(camModel)) do
			Citizen.Wait(1)
		end
		
		local pPed = GetPlayerPed(-1)
		local plyCoords = GetOffsetFromEntityInWorldCoords(pPed, 0.0, 0.0, -5.0)
		local camspawned = CreateObject(GetHashKey(camModel), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
		local netid = ObjToNet(camspawned)
		SetNetworkIdExistsOnAllMachines(netid, true)
		NetworkSetNetworkIdDynamic(netid, true)
		SetNetworkIdCanMigrate(netid, false)
		AttachEntityToEntity(camspawned, pPed, GetPedBoneIndex(pPed, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
		TaskPlayAnim(pPed, 1.0, -1, -1, 50, 0, 0, 0, 0) -- 50 = 32 + 16 + 2
		TaskPlayAnim(pPed, camanimDict, camanimName, 1.0, -1, -1, 50, 0, 0, 0, 0)
		camId = netid

		Citizen.CreateThread(function()
			while not HasAnimDictLoaded(camanimDict) do
				RequestAnimDict(camanimDict)
				Citizen.Wait(100)
			end

			while inCam do
				local pPed = GetPlayerPed(-1)
				if not IsEntityPlayingAnim(pPed, camanimDict, camanimName, 3) then
					TaskPlayAnim(pPed, 1.0, -1, -1, 50, 0, 0, 0, 0) -- 50 = 32 + 16 + 2
					TaskPlayAnim(pPed, camanimDict, camanimName, 1.0, -1, -1, 50, 0, 0, 0, 0)
				end
					
				DisablePlayerFiring(PlayerId(), true)
				DisableControlAction(0,25,true) -- disable aim
				DisableControlAction(0, 44,  true) -- INPUT_COVER
				DisableControlAction(0,37,true) -- INPUT_SELECT_WEAPON
				SetCurrentPedWeapon(pPed, GetHashKey("WEAPON_UNARMED"), true)
				Wait(1)
			end
		end)
	else
		inCam = false

		ClearPedTasks(GetPlayerPed(-1))
		ClearPedSecondaryTask(GetPlayerPed(-1))
		DetachEntity(NetToObj(camId), 1, 1)
		DeleteEntity(NetToObj(camId))
		camId = nil
	end
end

local useMic = false
local mic_net = nil
local micModel = "p_ing_microphonel_01"
local micanimDict = "missheistdocksprep1hold_cellphone"
local micanimName = "hold_cellphone"
function ToogleMic()
	if not useMic then
		useMic = true
		RequestModel(GetHashKey(micModel))
		while not HasModelLoaded(GetHashKey(micModel)) do
			Citizen.Wait(100)
		end
	
		while not HasAnimDictLoaded(micanimDict) do
			RequestAnimDict(micanimDict)
			Citizen.Wait(1)
		end

		local pPed = GetPlayerPed(-1)
		local plyCoords = GetOffsetFromEntityInWorldCoords(pPed, 0.0, 0.0, -5.0)
		local micspawned = CreateObject(GetHashKey(micModel), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
		local netid = ObjToNet(micspawned)
		SetNetworkIdExistsOnAllMachines(netid, true)
		NetworkSetNetworkIdDynamic(netid, true)
		SetNetworkIdCanMigrate(netid, false)
		AttachEntityToEntity(micspawned, pPed, GetPedBoneIndex(pPed, 60309), 0.055, 0.05, 0.0, 240.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
		TaskPlayAnim(pPed, 1.0, -1, -1, 50, 0, 0, 0, 0) -- 50 = 32 + 16 + 2
		TaskPlayAnim(pPed, micanimDict, micanimName, 1.0, -1, -1, 50, 0, 0, 0, 0)
		mic_net = netid

		Citizen.CreateThread(function()
			while useMic do
				if (IsPedInAnyVehicle(pPed, -1) and GetPedVehicleSeat(pPed) == -1) or IsPedCuffed(pPed) then
					ClearPedSecondaryTask(pPed)
					DetachEntity(NetToObj(mic_net), 1, 1)
					DeleteEntity(NetToObj(mic_net))
					mic_net = nil
					useMic = false
				end
				Wait(1)
			end
		end)

	else
		useMic = false
		ClearPedSecondaryTask(GetPlayerPed(PlayerId()))
		DetachEntity(NetToObj(mic_net), 1, 1)
		DeleteEntity(NetToObj(mic_net))
		mic_net = nil
	end
end

local useBmic = false
local bmic_net  = nil
local bmicModel = "prop_v_bmike_01"
local bmicanimDict = "missfra1"
local bmicanimName = "mcs2_crew_idle_m_boom"
function ToogleBmic()
	if not useBmic then
		useBmic = true
		
		RequestModel(GetHashKey(bmicModel))
		while not HasModelLoaded(GetHashKey(bmicModel)) do
			Citizen.Wait(1)
		end
	
		local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
		local bmicspawned = CreateObject(GetHashKey(bmicModel), plyCoords.x, plyCoords.y, plyCoords.z, true, true, false)
		local netid = ObjToNet(bmicspawned)
		SetNetworkIdExistsOnAllMachines(netid, true)
		NetworkSetNetworkIdDynamic(netid, true)
		SetNetworkIdCanMigrate(netid, false)
		AttachEntityToEntity(bmicspawned, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422), -0.08, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
		TaskPlayAnim(GetPlayerPed(PlayerId()), 1.0, -1, -1, 50, 0, 0, 0, 0) -- 50 = 32 + 16 + 2
		TaskPlayAnim(GetPlayerPed(PlayerId()), bmicanimDict, bmicanimName, 1.0, -1, -1, 50, 0, 0, 0, 0)

		bmic_net = netid

		Citizen.CreateThread(function()
			RequestAnimDict(bmicanimDict)
			while not HasAnimDictLoaded(bmicanimDict) do
				Citizen.Wait(1)
			end

			while useBmic do
	
				if not IsEntityPlayingAnim(PlayerPedId(), bmicanimDict, bmicanimName, 3) then
					TaskPlayAnim(GetPlayerPed(PlayerId()), 1.0, -1, -1, 50, 0, 0, 0, 0) -- 50 = 32 + 16 + 2
					TaskPlayAnim(GetPlayerPed(PlayerId()), bmicanimDict, bmicanimName, 1.0, -1, -1, 50, 0, 0, 0, 0)
				end
				
				DisablePlayerFiring(PlayerId(), true)
				DisableControlAction(0,25,true) -- disable aim
				DisableControlAction(0, 44,  true) -- INPUT_COVER
				DisableControlAction(0,37,true) -- INPUT_SELECT_WEAPON
				SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey("WEAPON_UNARMED"), true)
				
				if (IsPedInAnyVehicle(GetPlayerPed(-1), -1) and GetPedVehicleSeat(GetPlayerPed(-1)) == -1) or IsPedCuffed(GetPlayerPed(-1)) then
					ClearPedSecondaryTask(GetPlayerPed(-1))
					DetachEntity(NetToObj(bmic_net), 1, 1)
					DeleteEntity(NetToObj(bmic_net))
					bmic_net = nil
					useBmic = false
				end
				Wait(1)
			end
		end)

	else
		useBmic = false
		ClearPedSecondaryTask(GetPlayerPed(PlayerId()))
		DetachEntity(NetToObj(bmic_net), 1, 1)
		DeleteEntity(NetToObj(bmic_net))
		bmic_net = nil
	end
end

