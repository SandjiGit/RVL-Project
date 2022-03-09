ESX = nil

local actionCles, ShowName, gamerTags, invisible = {select = {"Prêter", "Détruire"}, index = 1}, false, {}, false


local Rperso = {
    ItemSelected = {},
    ItemSelected2 = {},
    WeaponData = {},
    factures = {},
    cledevoiture = {},
    bank = nil,
    sale = nil,
    DoorState = {
		FrontLeft = false,
		FrontRight = false,
		BackLeft = false,
		BackRight = false,
		Hood = false,
		Trunk = false
	},
    Admin = {
        showcoords = false,
        NoClipP = false,
        godmode = false,
        affichername = false,
        fantomemode = false
    },
	DoorIndex = 1,
	DoorList = {"Avant Gauche", "Avant Droite", "Arrière Gauche", "Arrière Droite"},
    minimap = true,
    CardIndex = 1,
    PermisIndex = 1,
    PPAIndex = 1,
    Checked = false,
    HUDIndex = 1,
    CINEMATICIndex = 1,
}

local societymoney, societymoney2 = nil, nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    ESX.TriggerServerCallback('gPersonalmenu:getUsergroup', function(group)
        playergroup = group
    end)

    RefreshMoney()

	if Config.DoubleJob then
		RefreshMoney2()
	end

    Rperso.WeaponData = ESX.GetWeaponList()
	for i = 1, #Rperso.WeaponData, 1 do
		if Rperso.WeaponData[i].name == 'WEAPON_UNARMED' then
			Rperso.WeaponData[i] = nil
		else
			Rperso.WeaponData[i].hash = GetHashKey(Rperso.WeaponData[i].name)
		end
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(200)

		if invisible then
			SetEntityVisible(GetPlayerPed(-1), 0, 0)
			NetworkSetEntityInvisibleToNetwork(pPed, 1)
		else
			SetEntityVisible(GetPlayerPed(-1), 1, 0)
			NetworkSetEntityInvisibleToNetwork(pPed, 0)
		end

		if ShowName then
			local pCoords = GetEntityCoords(GetPlayerPed(-1), false)
			for _, v in pairs(GetActivePlayers()) do
				local otherPed = GetPlayerPed(v)

				if otherPed ~= pPed then
					if #(pCoords - GetEntityCoords(otherPed, false)) < 250.0 then
						gamerTags[v] = CreateFakeMpGamerTag(otherPed, ('[%s] %s'):format(GetPlayerServerId(v), GetPlayerName(v)), false, false, '', 0)
						SetMpGamerTagVisibility(gamerTags[v], 4, 1)
					else
						RemoveMpGamerTag(gamerTags[v])
						gamerTags[v] = nil
					end
				end
			end
		else
			for _, v in pairs(GetActivePlayers()) do
				RemoveMpGamerTag(gamerTags[v])
			end
		end

		for k,v in pairs(GetActivePlayers()) do
			if NetworkIsPlayerTalking(v) then
				local pPed = GetPlayerPed(v)
				local pCoords = GetEntityCoords(pPed)
				DrawMarker(32, pCoords.x, pCoords.y, pCoords.z+1.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 255, 0, 170, 0, 1, 2, 0, nil, nil, 0)
			end
		end
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  ESX.PlayerData = xPlayer
end)

RegisterNetEvent('es:activateMoney')
AddEventHandler('es:activateMoney', function(money)
	  ESX.PlayerData.money = money
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
	RefreshMoney()
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
	ESX.PlayerData.job2 = job2
	RefreshMoney2()
end)

RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
	for i=1, #ESX.PlayerData.accounts, 1 do
		if ESX.PlayerData.accounts[i].name == account.name then
			ESX.PlayerData.accounts[i] = account
			break
		end
	end
end)

--- Argent entreprise/orga

RegisterNetEvent('esx_addonaccount:setMoney')
AddEventHandler('esx_addonaccount:setMoney', function(society, money)
	if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' and 'society_' .. ESX.PlayerData.job.name == society then
		societymoney = ESX.Math.GroupDigits(money)
	end

	if ESX.PlayerData.job2 ~= nil and ESX.PlayerData.job2.grade_name == 'boss' and 'society_' .. ESX.PlayerData.job2.name == society then
		societymoney2 = ESX.Math.GroupDigits(money)
	end
end)

RegisterNetEvent('gPersonalmenu:Weapon_addAmmoToPedC')
AddEventHandler('gPersonalmenu:Weapon_addAmmoToPedC', function(value, quantity)
  local weaponHash = GetHashKey(value)

    if HasPedGotWeapon(PlayerPed, weaponHash, false) and value ~= 'WEAPON_UNARMED' then
        AddAmmoToPed(PlayerPed, value, quantity)
    end
end)


function RefreshMoney()
	if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' then
		ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
			societymoney = ESX.Math.GroupDigits(money)
		end, ESX.PlayerData.job.name)
	end
end

function RefreshMoney2()
	if ESX.PlayerData.job2 ~= nil and ESX.PlayerData.job2.grade_name == 'boss' then
		ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
			societymoney2 = ESX.Math.GroupDigits(money)
		end, ESX.PlayerData.job2.name)
	end
end

local function rPersonalmenuKeyboardInput(TextEntry, ExampleText, MaxStringLenght)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
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



-------------- Menu Personnel ----------------
local ListIndex = 1;

local open = false
Menu5 = RageUI.CreateMenu('SLIFE', 'Menu Personnel')
local Mportefeuille = RageUI.CreateSubMenu(Menu5, "SLIFE", "Portefeuille")
local Mportefeuilleli = RageUI.CreateSubMenu(Mportefeuille, "SLIFE", "Interaction")
local Mportefeuillesale = RageUI.CreateSubMenu(Mportefeuille, "SLIFE", "Interaction")
local Mfacture = RageUI.CreateSubMenu(Menu5, "SLIFE", "Factures")
local Mgestveh = RageUI.CreateSubMenu(Menu5, "SLIFE", "Géstion Véhicule")
local Mgestentreprise = RageUI.CreateSubMenu(Menu5, "SLIFE", "Gestion Entreprise")
local Mgestoraga = RageUI.CreateSubMenu(Menu5, "SLIFE", "Gestion Gang")
local Mdivers = RageUI.CreateSubMenu(Menu5, "SLIFE", "Divers")
local Mclef = RageUI.CreateSubMenu(Menu5, "SLIFE", "Clefs")
local Madmin = RageUI.CreateSubMenu(Menu5, "SLIFE", "Developpement")
local Mreport = RageUI.CreateSubMenu(Menu5, "SLIFE", "Report")
local Mhistoriquereport = RageUI.CreateSubMenu(Mreport, "SLIFE", "Historiques de vos Reports")
Menu5.Display.Glare = false;
Menu5.Display.Header = true
Menu5.Display.PageCounter = false;
Menu5.Closed = function()
  open = false
  playerX = nil
  playerY = nil
  playerZ = nil
  playerH = nil
end

function OpenMenuPersonnel()

    if open then
        open = false
        RageUI.CloseAll()
        RageUI.Visible(Menu5, false)
        return
    else
        open = true
        RageUI.CloseAll()
        RageUI.Visible(Menu5, true)
        CreateThread(function ()
            while open do
                RageUI.IsVisible(Menu5, function()

                    RageUI.Button("Portefeuille", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, Mportefeuille)

                    RageUI.Button("Factures", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, Mfacture)

                    RageUI.Button("Animations", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                            RageUI.CloseAll()
                            ExecuteCommand("emotemenu")
                        end
                    })


                    if IsPedSittingInAnyVehicle(PlayerPedId()) then
                        RageUI.Button("Gestion Véhicule", nil, {RightLabel = "→"}, true , {
                            onSelected = function()
                            end
                        }, Mgestveh)
                    else
                    end

                    if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' then
                        RageUI.Button("Gestion Entreprise", nil, {RightLabel = "→"}, true , {
                            onSelected = function()
                            end
                        }, Mgestentreprise)
                    else
                    end

                    if ESX.PlayerData.job2 ~= nil and ESX.PlayerData.job2.grade_name == 'boss' then
                        RageUI.Button("Gestion Gang", nil, {RightLabel = "→"}, true , {
                            onSelected = function()
                            end
                        }, Mgestoraga)
                    else
                    end

                    RageUI.Button("Vos Clés", nil, {RightLabel = "→"}, true, {
                        onSelected = function()
                            OpenMenuKeys()
                        end
                    })

                    RageUI.Button("Options Joueur", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, Mdivers)

                    RageUI.Button("Assitance", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, Mreport)

                    if playergroup == "admin" or playergroup == "superadmin" then
                        RageUI.Button("Administration", nil, {RightLabel = "→"}, true , {
                            onSelected = function()
                                TriggerServerEvent("OTEXO:ouvrirmenu1")
                            end
                        })
                    else
                    end

                    if playergroup == "admin" or playergroup == "superadmin" then
                        RageUI.Button("Développement", nil, {RightLabel = "→"}, true , {
                            onSelected = function()
                            end
                        }, Madmin)
                    else
                    end

                end)

                RageUI.IsVisible(Mportefeuille, function()
                    RageUI.Separator("Liquide:")
                    RageUI.Separator("")
                    RageUI.Separator("Métier: "..ESX.PlayerData.job.label.." - "..ESX.PlayerData.job.grade_label)
                    RageUI.Separator("Gang: "..ESX.PlayerData.job2.label.." - "..ESX.PlayerData.job2.grade_label)


                    RageUI.List("Carte d'Identité", { "Regarder", "Montrer" }, Rperso.CardIndex, nil, {}, true , {
                        onListChange = function(Index, Item)
                            Rperso.CardIndex = Index;
                        end,
                        onSelected = function(Index, Item)
                            if Index == 1 then
                                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
                            elseif Index == 2 then
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

					            if closestDistance ~= -1 and closestDistance <= 3.0 then
						            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer))
					            else
						            ESX.ShowNotification("Il n'y à personne aux alentours")
					            end
                            end
                        end
                    })

                    RageUI.List("Permis de Conduire", { "Regarder", "Montrer" }, Rperso.PermisIndex, nil, {}, true , {
                        onListChange = function(Index, Item)
                            Rperso.PermisIndex = Index;
                        end,
                        onSelected = function(Index, Item)
                            if Index == 1 then
                                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
                            elseif Index == 2 then
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

					            if closestDistance ~= -1 and closestDistance <= 3.0 then
						            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'driver')
					            else
						            ESX.ShowNotification("Il n'y à personne aux alentours")
					            end
                            end
                        end
                    })

                    RageUI.List("Permis de port d'Armes", { "Regarder", "Montrer" }, Rperso.PPAIndex, nil, {}, true , {
                        onListChange = function(Index, Item)
                            Rperso.PPAIndex = Index;
                        end,
                        onSelected = function(Index, Item)
                            if Index == 1 then
                                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
                            elseif Index == 2 then
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

					            if closestDistance ~= -1 and closestDistance <= 3.0 then
						            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'weapon')
					            else
						            ESX.ShowNotification("Il n'y à personne aux alentours")
					            end
                            end
                        end
                    })
                end)

                RageUI.IsVisible(Mfacture, function()
                    RageUI.Separator("Aucunes Factures Impayées")

                    RageUI.Separator("")

                    RageUI.Button("Historiques des Factures", "Historiques des factures payés au cours de la semaine. (Peut serveir de prevues en cas de remboursment ou de report au près du Satff)", {RightLabel = "→"}, true, {
                        onSelected = function()
                            RageUI.CloseAll()
                        end
                    })

                end)

                RageUI.IsVisible(Mgestveh, function()

                    local Ped = GetPlayerPed(-1)
                    local GetSourcevehicle = GetVehiclePedIsIn(Ped, false)
                    local Vengine = GetVehicleEngineHealth(GetSourcevehicle)/10
                    local Vengine = math.floor(Vengine)
                    local VehPed = GetVehiclePedIsIn(PlayerPedId(), false)

                    if IsPedSittingInAnyVehicle(PlayerPedId()) then
                        RageUI.Separator("Plaque d'immatriculation = "..GetVehicleNumberPlateText(VehPed).." ")
                    else
                        RageUI.GoBack()
                    end

                    RageUI.Separator("Etat du moteur~s~ = "..Vengine.."%")

                    RageUI.Button("Allumer/Eteindre le Moteur", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                            if IsPedSittingInAnyVehicle(PlayerPedId()) then
                                local plyVeh = GetVehiclePedIsIn(PlayerPedId(), false)

                                if GetIsVehicleEngineRunning(plyVeh) then
                                    SetVehicleEngineOn(plyVeh, false, false, true)
                                    SetVehicleUndriveable(plyVeh, true)
                                elseif not GetIsVehicleEngineRunning(plyVeh) then
                                    SetVehicleEngineOn(plyVeh, true, false, true)
                                    SetVehicleUndriveable(plyVeh, false)
                                end
                            else
                                ESX.ShowNotification("Vous n'êtes pas dans un véhicule")
                            end
                        end
                    })

                    RageUI.Button("Ouvrir/Fermer Coffre", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                            if IsPedSittingInAnyVehicle(PlayerPedId()) then
                                local plyVeh = GetVehiclePedIsIn(PlayerPedId(), false)

                                if not Rperso.DoorState.Trunk then
                                    Rperso.DoorState.Trunk = true
                                    SetVehicleDoorOpen(plyVeh, 5, false, false)
                                elseif Rperso.DoorState.Trunk then
                                    Rperso.DoorState.Trunk = false
                                    SetVehicleDoorShut(plyVeh, 5, false, false)
                                end
                            else
                                ESX.ShowNotification("Vous n'êtes pas dans un véhicule")
                            end
                        end
                    })

                    RageUI.List("Ouvrir/Fermer Porte", Rperso.DoorList, Rperso.DoorIndex, nil, {}, true , {
                        onListChange = function(Index, Item)
                            Rperso.DoorIndex = Index;
                        end,
                        onSelected = function(Index, Item)
                            if IsPedSittingInAnyVehicle(PlayerPedId()) then
                                local plyVeh = GetVehiclePedIsIn(PlayerPedId(), false)

                                if Index == 1 then
                                    if not Rperso.DoorState.FrontLeft then
                                        Rperso.DoorState.FrontLeft = true
                                        SetVehicleDoorOpen(plyVeh, 0, false, false)
                                    elseif Rperso.DoorState.FrontLeft then
                                        Rperso.DoorState.FrontLeft = false
                                        SetVehicleDoorShut(plyVeh, 0, false, false)
                                    end
                                elseif Index == 2 then
                                    if not Rperso.DoorState.FrontRight then
                                        Rperso.DoorState.FrontRight = true
                                        SetVehicleDoorOpen(plyVeh, 1, false, false)
                                    elseif Rperso.DoorState.FrontRight then
                                        Rperso.DoorState.FrontRight = false
                                        SetVehicleDoorShut(plyVeh, 1, false, false)
                                    end
                                elseif Index == 3 then
                                    if not Rperso.DoorState.BackLeft then
                                        Rperso.DoorState.BackLeft = true
                                        SetVehicleDoorOpen(plyVeh, 2, false, false)
                                    elseif Rperso.DoorState.BackLeft then
                                        Rperso.DoorState.BackLeft = false
                                        SetVehicleDoorShut(plyVeh, 2, false, false)
                                    end
                                elseif Index == 4 then
                                    if not Rperso.DoorState.BackRight then
                                        Rperso.DoorState.BackRight = true
                                        SetVehicleDoorOpen(plyVeh, 3, false, false)
                                    elseif Rperso.DoorState.BackRight then
                                        Rperso.DoorState.BackRight = false
                                        SetVehicleDoorShut(plyVeh, 3, false, false)
                                    end
                                end
                            else
                                ESX.ShowNotification("Vous n'êtes pas dans un véhicule")
                            end
                        end
                    })
                end)

                RageUI.IsVisible(Mgestentreprise, function()
                    RageUI.Separator("Societé : "..ESX.PlayerData.job.label)
                    if societymoney ~= nil then
                        RageUI.Separator("Coffre Entreprise : "..societymoney.." $")
                    end
                    RageUI.Button("Recruter une Personne", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                            if ESX.PlayerData.job.grade_name == 'boss' then
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                                if closestPlayer == -1 or closestDistance > 3.0 then
                                    ESX.ShowNotification('Aucun joueur proche')
                                else
                                    TriggerServerEvent('rPersonalmenu:Boss_recruterplayer', GetPlayerServerId(closestPlayer))
                                    --TriggerServerEvent('rPersonalmenu:Boss_recruterplayer', GetPlayerServerId(closestPlayer), ESX.PlayerData.job.name, 0)
                                end
                            else
                                ESX.ShowNotification('Vous n\'avez pas les ~r~droits~w~')
                            end
                        end
                    })

                    RageUI.Button("Virer une Personne", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                            if ESX.PlayerData.job.grade_name == 'boss' then
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                                if closestPlayer == -1 or closestDistance > 3.0 then
                                    ESX.ShowNotification('Aucun joueur proche')
                                else
                                    TriggerServerEvent('rPersonalmenu:Boss_virerplayer', GetPlayerServerId(closestPlayer))
                                end
                            else
                                ESX.ShowNotification('Vous n\'avez pas les ~r~droits~w~')
                            end
                        end
                    })

                    RageUI.Button("Promouvoir une Personne", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                            if ESX.PlayerData.job.grade_name == 'boss' then
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                                if closestPlayer == -1 or closestDistance > 3.0 then
                                    ESX.ShowNotification('Aucun joueur proche')
                                else
                                    TriggerServerEvent('rPersonalmenu:Boss_promouvoirplayer', GetPlayerServerId(closestPlayer))
                                end
                            else
                                ESX.ShowNotification('Vous n\'avez pas les ~r~droits~w~')
                            end
                        end
                    })

                    RageUI.Button("Destituer une Personne", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                            if ESX.PlayerData.job.grade_name == 'boss' then
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                                if closestPlayer == -1 or closestDistance > 3.0 then
                                    ESX.ShowNotification('Aucun joueur proche')
                                else
                                    TriggerServerEvent('rPersonalmenu:Boss_destituerplayer', GetPlayerServerId(closestPlayer))
                                end
                            else
                                ESX.ShowNotification('Vous n\'avez pas les ~r~droits~w~')
                            end
                        end
                    })

                    RageUI.Button("Message aux Employés", nil, {RightLabel = ""}, true , {
                        onSelected = function()
                            local info = 'patron'
                            local message = rPersonalmenuKeyboardInput('Veuillez mettre le messsage à envoyer', '', 40)
                            TriggerServerEvent('rPersonalmenu:envoyeremployer', info, message)
                        end
                    })
                end)

                RageUI.IsVisible(Mgestoraga, function()
                    RageUI.Separator("Gang : "..ESX.PlayerData.job2.label)
                    if societymoney2 ~= nil then
                        RageUI.Separator("Coffre Gang : "..societymoney2.." $")
                    end
                    RageUI.Button("Recruter une Personne", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                            if ESX.PlayerData.job2.grade_name == 'boss' then
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                                if closestPlayer == -1 or closestDistance > 3.0 then
                                    ESX.ShowNotification('Aucun joueur proche')
                                else
                                    TriggerServerEvent('rPersonalmenu:Boss_recruterplayer2', GetPlayerServerId(closestPlayer))
                                    --TriggerServerEvent('rPersonalmenu:Boss_recruterplayer', GetPlayerServerId(closestPlayer), ESX.PlayerData.job.name, 0)
                                end
                            else
                                ESX.ShowNotification('Vous n\'avez pas les ~r~droits~w~')
                            end
                        end
                    })

                    RageUI.Button("Virer une Personne", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                            if ESX.PlayerData.job2.grade_name == 'boss' then
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                                if closestPlayer == -1 or closestDistance > 3.0 then
                                    ESX.ShowNotification('Aucun joueur proche')
                                else
                                    TriggerServerEvent('rPersonalmenu:Boss_virerplayer2', GetPlayerServerId(closestPlayer))
                                end
                            else
                                ESX.ShowNotification('Vous n\'avez pas les ~r~droits~w~')
                            end
                        end
                    })

                    RageUI.Button("Promouvoir une Personne", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                            if ESX.PlayerData.job2.grade_name == 'boss' then
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                                if closestPlayer == -1 or closestDistance > 3.0 then
                                    ESX.ShowNotification('Aucun joueur proche')
                                else
                                    TriggerServerEvent('rPersonalmenu:Boss_promouvoirplayer2', GetPlayerServerId(closestPlayer))
                                end
                            else
                                ESX.ShowNotification('Vous n\'avez pas les ~r~droits~w~')
                            end
                        end
                    })

                    RageUI.Button("Destituer une Personne", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                            if ESX.PlayerData.job2.grade_name == 'boss' then
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                                if closestPlayer == -1 or closestDistance > 3.0 then
                                    ESX.ShowNotification('Aucun joueur proche')
                                else
                                    TriggerServerEvent('rPersonalmenu:Boss_destituerplayer2', GetPlayerServerId(closestPlayer))
                                end
                            else
                                ESX.ShowNotification('Vous n\'avez pas les ~r~droits~w~')
                            end
                        end
                    })
                end)

                RageUI.IsVisible(Mdivers, function()
                    RageUI.List("Hud", { "Activé", "Désactive", "Désactivé Map" }, Rperso.HUDIndex, nil, {}, true , {
                        onListChange = function(Index, Item)
                            Rperso.HUDIndex = Index;
                        end,
                        onSelected = function(Index, Item)
                            if Index == 1 then
                                DisplayRadar(true)
                            elseif Index == 2 then
                                DisplayRadar(false)
                            elseif Index == 3 then
                                DisplayRadar(false)
                            end
                        end
                    })

                    RageUI.List("Mode Cinématique", { "Activé", "Désactive" }, Rperso.CINEMATICIndex, nil, {}, true , {
                        onListChange = function(Index, Item)
                            Rperso.CINEMATICIndex = Index;
                        end,
                        onSelected = function(Index, Item)
                            if Index == 1 then
                                DisplayRadar(true)
                            elseif Index == 2 then
                                DisplayRadar(false)
                            elseif Index == 3 then
                                DisplayRadar(false)
                            end
                        end
                    })

                end)

                RageUI.IsVisible(Mreport, function()

                    RageUI.Button("Informations", "Tous abus sera sévermeent sanctionée.", {RightLabel = "!"}, true, {
                    })

                    RageUI.Separator("Vos Reports:")

                    RageUI.Button("Effectuer un Report", nil, {RightLabel = "→"}, true, {
                        onSelected = function()
                            local raisonreport = KeyboardInput('SANDJI_REPORT_RAISON', "Raison de votre Report", '', 150)
                            ExecuteCommand("report "..raisonreport)
                        end
                    })

                    RageUI.Button("Historique de vos Reports", nil, {RightLabel = "→"}, true, {
                   },Mhistoriquereport)

                end)

                RageUI.IsVisible(Mhistoriquereport, function()

                end)

                RageUI.IsVisible(Madmin, function()
                    RageUI.Button("Envoyer vos Coordonées", "Envoyez vos Coordonnées sur Discord pour les récupérer plus facilement.", {RightLabel = "→"}, true , {
                        onSelected = function()
                            local playerPed = PlayerPedId()
			                playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
			                playerH = GetEntityHeading(playerPed)

                            ESX.ShowNotification(("~g~X~w~: %s ~g~Y~w~: %s ~g~Z~w~: %s ~g~H~w~: %s"):format(FormatCoord(playerX), FormatCoord(playerY), FormatCoord(playerZ), FormatCoord(playerH)))

                            TriggerServerEvent("Admin:Coord", playerX, playerY, playerZ, playerH)
                            ESX.ShowNotification("Coordonées Envoyées")
                            playerX = nil
                            playerY = nil
                            playerZ = nil
                            playerH = nil
                        end
                    })
                end)

                Wait(0)
            end
         end)
      end
    end


    Keys.Register('F5', 'SLife', 'Ouvrir le Menu Personnel', function()
        OpenMenuPersonnel()
    end)

    FormatCoord = function(coord)
        if coord == nil then
            return "unknown"
        end

        return tonumber(string.format("%.2f", coord))
    end



    function CheckQuantity(number)
        number = tonumber(number)

        if type(number) == 'number' then
          number = ESX.Math.Round(number)

          if number > 0 then
            return true, number
          end
        end

        return false, number
    end

    --- Animations

    function startAttitude(lib, anim)
        ESX.Streaming.RequestAnimSet(lib, function()
            SetPedMovementClipset(PlayerPedId(), anim, true)
        end)
    end

    function startAnim(lib, anim)
        ESX.Streaming.RequestAnimDict(lib, function()
            TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
        end)
    end

    function startScenario(anim)
        TaskStartScenarioInPlace(PlayerPedId(), anim, 0, false)
    end


    ---


    RegisterNetEvent('rPersonalmenu:envoyeremployer')
    AddEventHandler('rPersonalmenu:envoyeremployer', function(service, nom, message)
        if service == 'patron' then
            PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
            ESX.ShowAdvancedNotification('INFO '..ESX.PlayerData.job.label, '~b~A lire', 'Patron: ~g~'..nom..'\n~w~Message: ~g~'..message..'', 'CHAR_MINOTAUR', 8)
            Wait(1000)
            PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
        end
    end)


    -- pour les Vétements Mettre/Enlever

    RegisterNetEvent('rPersonalmenu:actionhaut')
    AddEventHandler('rPersonalmenu:actionhaut', function()
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skina)
            TriggerEvent('skinchanger:getSkin', function(skinb)
                local lib, anim = 'clothingtie', 'try_tie_neutral_a'
                ESX.Streaming.RequestAnimDict(lib, function()
                    TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                Citizen.Wait(1000)
                ClearPedTasks(PlayerPedId())

                if skina.torso_1 ~= skinb.torso_1 then
                    vethaut = true
                    TriggerEvent('skinchanger:loadClothes', skinb, {['torso_1'] = skina.torso_1, ['torso_2'] = skina.torso_2, ['tshirt_1'] = skina.tshirt_1, ['tshirt_2'] = skina.tshirt_2, ['arms'] = skina.arms})
                else
                    TriggerEvent('skinchanger:loadClothes', skinb, {['torso_1'] = 15, ['torso_2'] = 0, ['tshirt_1'] = 15, ['tshirt_2'] = 0, ['arms'] = 15})
                    vethaut = false
                end
            end)
        end)
    end)

    RegisterNetEvent('rPersonalmenu:actionpantalon')
    AddEventHandler('rPersonalmenu:actionpantalon', function()
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skina)
            TriggerEvent('skinchanger:getSkin', function(skinb)
                local lib, anim = 'clothingtrousers', 'try_trousers_neutral_c'

                ESX.Streaming.RequestAnimDict(lib, function()
                    TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                Citizen.Wait(1000)
                ClearPedTasks(PlayerPedId())

                if skina.pants_1 ~= skinb.pants_1 then
                    TriggerEvent('skinchanger:loadClothes', skinb, {['pants_1'] = skina.pants_1, ['pants_2'] = skina.pants_2})
                    vetbas = true
                else
                    vetbas = false
                    if skina.sex == 1 then
                        TriggerEvent('skinchanger:loadClothes', skinb, {['pants_1'] = 15, ['pants_2'] = 0})
                    else
                        TriggerEvent('skinchanger:loadClothes', skinb, {['pants_1'] = 61, ['pants_2'] = 1})
                    end
                end
            end)
        end)
    end)


    RegisterNetEvent('rPersonalmenu:actionchaussure')
    AddEventHandler('rPersonalmenu:actionchaussure', function()
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skina)
            TriggerEvent('skinchanger:getSkin', function(skinb)
                local lib, anim = 'clothingshoes', 'try_shoes_positive_a'
                ESX.Streaming.RequestAnimDict(lib, function()
                    TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                Citizen.Wait(1000)
                ClearPedTasks(PlayerPedId())
                if skina.shoes_1 ~= skinb.shoes_1 then
                    TriggerEvent('skinchanger:loadClothes', skinb, {['shoes_1'] = skina.shoes_1, ['shoes_2'] = skina.shoes_2})
                    vetch = true
                else
                    vetch = false
                    if skina.sex == 1 then
                        TriggerEvent('skinchanger:loadClothes', skinb, {['shoes_1'] = 35, ['shoes_2'] = 0})
                    else
                        TriggerEvent('skinchanger:loadClothes', skinb, {['shoes_1'] = 34, ['shoes_2'] = 0})
                    end
                end
            end)
        end)
    end)

    RegisterNetEvent('rPersonalmenu:actionsac')
    AddEventHandler('rPersonalmenu:actionsac', function()
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skina)
            TriggerEvent('skinchanger:getSkin', function(skinb)
                local lib, anim = 'clothingtie', 'try_tie_neutral_a'
                ESX.Streaming.RequestAnimDict(lib, function()
                    TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                Citizen.Wait(1000)
                ClearPedTasks(PlayerPedId())
                if skina.bags_1 ~= skinb.bags_1 then
                    TriggerEvent('skinchanger:loadClothes', skinb, {['bags_1'] = skina.bags_1, ['bags_2'] = skina.bags_2})
                    vetsac = true
                else
                    TriggerEvent('skinchanger:loadClothes', skinb, {['bags_1'] = 0, ['bags_2'] = 0})
                    vetsac = false
                end
            end)
        end)
    end)


    RegisterNetEvent('rPersonalmenu:actiongiletparballe')
    AddEventHandler('rPersonalmenu:actiongiletparballe', function()
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skina)
            TriggerEvent('skinchanger:getSkin', function(skinb)
                local lib, anim = 'clothingtie', 'try_tie_neutral_a'
                ESX.Streaming.RequestAnimDict(lib, function()
                    TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                Citizen.Wait(1000)
                ClearPedTasks(PlayerPedId())
                if skina.bproof_1 ~= skinb.bproof_1 then
                    TriggerEvent('skinchanger:loadClothes', skinb, {['bproof_1'] = skina.bproof_1, ['bproof_2'] = skina.bproof_2})
                    vetgilet = true
                else
                    TriggerEvent('skinchanger:loadClothes', skinb, {['bproof_1'] = 0, ['bproof_2'] = 0})
                    vetgilet = false
                end
            end)
        end)
    end)

    -- Admin

    local MainColor = {
        r = 225,
        g = 55,
        b = 55,
        a = 255
    }

    Citizen.CreateThread(function()
        while true do
            if Rperso.Admin.showcoords then
                x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
                roundx=tonumber(string.format("%.2f",x))
                roundy=tonumber(string.format("%.2f",y))
                roundz=tonumber(string.format("%.2f",z))
                DrawTxt("~r~X:~s~ "..roundx,0.05,0.00)
                DrawTxt("     ~r~Y:~s~ "..roundy,0.11,0.00)
                DrawTxt("        ~r~Z:~s~ "..roundz,0.17,0.00)
                DrawTxt("             ~r~Angle:~s~ "..GetEntityHeading(PlayerPedId()),0.21,0.00)
            end
            if invisible then
                SetEntityVisible(GetPlayerPed(-1), 0, 0)
                NetworkSetEntityInvisibleToNetwork(GetPlayerPed(-1), 1)
            else
                SetEntityVisible(GetPlayerPed(-1), 1, 0)
                NetworkSetEntityInvisibleToNetwork(GetPlayerPed(-1), 0)
            end
            Citizen.Wait(0)
        end
    end)

    --DrawTxt
    function DrawTxt(text,r,z)
        SetTextColour(MainColor.r, MainColor.g, MainColor.b, 255)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextScale(0.0,0.4)
        SetTextDropshadow(1,0,0,0,255)
        SetTextEdge(1,0,0,0,255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        AddTextComponentString(text)
        DrawText(r,z)
    end


    --NoClip
    local noclip = false
    local noclip_speed = 1.0

    function rPersoNoClip()
      noclip = not noclip
      local ped = GetPlayerPed(-1)
      if noclip then -- activé
        SetEntityInvincible(ped, true)
        SetEntityVisible(ped, false, false)
        invisible = true
        ESX.ShowNotification("Noclip ~g~activé")
      else -- désactivé
        SetEntityInvincible(ped, false)
        SetEntityVisible(ped, true, false)
        invisible = false
        ESX.ShowNotification("Noclip ~r~désactivé")
      end
    end

    function getPosition()
        local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
        return x,y,z
      end

      function getCamDirection()
        local heading = GetGameplayCamRelativeHeading()+GetEntityHeading(GetPlayerPed(-1))
        local pitch = GetGameplayCamRelativePitch()

        local x = -math.sin(heading*math.pi/180.0)
        local y = math.cos(heading*math.pi/180.0)
        local z = math.sin(pitch*math.pi/180.0)

        local len = math.sqrt(x*x+y*y+z*z)
        if len ~= 0 then
          x = x/len
          y = y/len
          z = z/len
        end

        return x,y,z
    end

    Citizen.CreateThread(function()
        while true do
            local Timer = 500
            if noclip then
            local ped = GetPlayerPed(-1)
            local x,y,z = getPosition()
            local dx,dy,dz = getCamDirection()
            local speed = noclip_speed

            -- reset du velocity
            SetEntityVelocity(ped, 0.0001, 0.0001, 0.0001)
            Timer = 0
            -- aller vers le haut
            if IsControlPressed(0,32) then -- MOVE UP
                x = x+speed*dx
                y = y+speed*dy
                z = z+speed*dz
            end

            -- aller vers le bas
            if IsControlPressed(0,269) then -- MOVE DOWN
                x = x-speed*dx
                y = y-speed*dy
                z = z-speed*dz
            end

            SetEntityCoordsNoOffset(ped,x,y,z,true,true,true)
            end
            Citizen.Wait(Timer)
        end
    end)

    --Argent cash
    function GiveArgentCash()
        local amount = rPersonalmenuKeyboardInput("Combien?", "", 8)

        if amount ~= nil then
            amount = tonumber(amount)

            if type(amount) == 'number' then
                TriggerServerEvent('rPersonalmenu:GiveArgentCash', amount)
                ESX.ShowNotification("~g~Give argent cash effectué~w~ "..amount.." €")
            end
        end
    end

     --Argent sale
    function GiveArgentSale()
        local amount = rPersonalmenuKeyboardInput("Combien?", "", 8)

        if amount ~= nil then
            amount = tonumber(amount)

            if type(amount) == 'number' then
                TriggerServerEvent('rPersonalmenu:GiveArgentSale', amount)
                ESX.ShowNotification("~g~Give argent sale effectué~w~ "..amount.." €")
            end
        end
    end

     --Argent banque
    function GiveArgentBanque()
        local amount = rPersonalmenuKeyboardInput("Combien?", "", 8)

        if amount ~= nil then
            amount = tonumber(amount)

            if type(amount) == 'number' then
                TriggerServerEvent('rPersonalmenu:GiveArgentBanque', amount)
                ESX.ShowNotification("~g~Give argent banque effectué~w~ "..amount.." €")
            end
        end
    end

    --Custom véhicule
    function FullVehicleBoost()
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
            SetVehicleModKit(vehicle, 0)
            SetVehicleMod(vehicle, 14, 0, true)
            SetVehicleNumberPlateTextIndex(vehicle, 5)
            ToggleVehicleMod(vehicle, 18, true)
            SetVehicleColours(vehicle, 0, 0)
            SetVehicleCustomPrimaryColour(vehicle, 0, 0, 0)
            SetVehicleModColor_2(vehicle, 5, 0)
            SetVehicleExtraColours(vehicle, 111, 111)
            SetVehicleWindowTint(vehicle, 2)
            ToggleVehicleMod(vehicle, 22, true)
            SetVehicleMod(vehicle, 23, 11, false)
            SetVehicleMod(vehicle, 24, 11, false)
            SetVehicleWheelType(vehicle, 12)
            SetVehicleWindowTint(vehicle, 3)
            ToggleVehicleMod(vehicle, 20, true)
            SetVehicleTyreSmokeColor(vehicle, 0, 0, 0)
            LowerConvertibleRoof(vehicle, true)
            SetVehicleIsStolen(vehicle, false)
            SetVehicleIsWanted(vehicle, false)
            SetVehicleHasBeenOwnedByPlayer(vehicle, true)
            SetVehicleNeedsToBeHotwired(vehicle, false)
            SetCanResprayVehicle(vehicle, true)
            SetPlayersLastVehicle(vehicle)
            SetVehicleFixed(vehicle)
            SetVehicleDeformationFixed(vehicle)
            SetVehicleTyresCanBurst(vehicle, false)
            SetVehicleWheelsCanBreak(vehicle, false)
            SetVehicleCanBeTargetted(vehicle, false)
            SetVehicleExplodesOnHighExplosionDamage(vehicle, false)
            SetVehicleHasStrongAxles(vehicle, true)
            SetVehicleDirtLevel(vehicle, 0)
            SetVehicleCanBeVisiblyDamaged(vehicle, false)
            IsVehicleDriveable(vehicle, true)
            SetVehicleEngineOn(vehicle, true, true)
            SetVehicleStrong(vehicle, true)
            RollDownWindow(vehicle, 0)
            RollDownWindow(vehicle, 1)
            SetVehicleNeonLightEnabled(vehicle, 0, true)
            SetVehicleNeonLightEnabled(vehicle, 1, true)
            SetVehicleNeonLightEnabled(vehicle, 2, true)
            SetVehicleNeonLightEnabled(vehicle, 3, true)
            SetVehicleNeonLightsColour(vehicle, 0, 0, 255)
            SetPedCanBeDraggedOut(PlayerPedId(), false)
            SetPedStayInVehicleWhenJacked(PlayerPedId(), true)
            SetPedRagdollOnCollision(PlayerPedId(), false)
            ResetPedVisibleDamage(PlayerPedId())
            ClearPedDecorations(PlayerPedId())
            SetIgnoreLowPriorityShockingEvents(PlayerPedId(), true)
            for i = 0,14 do
                SetVehicleExtra(veh, i, 0)
            end
            SetVehicleModKit(veh, 0)
            for i = 0,49 do
                local custom = GetNumVehicleMods(veh, i)
                for j = 1,custom do
                    SetVehicleMod(veh, i, math.random(1,j), 1)
                end
            end
        end
    end