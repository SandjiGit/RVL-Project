function SetData()
	players = {}
	for _, player in ipairs(GetActivePlayers()) do
		local ped = GetPlayerPed(player)
		table.insert( players, player )
end

	
	local name = GetPlayerName(PlayerId())
	local id = GetPlayerServerId(PlayerId())
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), 'FE_THDR_GTAO', "SLife Béta ~w~|~p~ Discord : discord.link/slife~p~ | ~p~"..#players .." ~p~connecté(e)s")
end

 ----- Pas de drop d'armes voitures flics.

 Citizen.CreateThread(function()

    while true do

        Citizen.Wait(10)

        DisablePlayerVehicleRewards(PlayerId())

    end
end)


-- Desactiver le drop d'armes : 

function SetWeaponDrops()
    local handle, ped = FindFirstPed()
    local finished = false

    repeat
        if not IsEntityDead(ped) then
            SetPedDropsWeaponsWhenDead(ped, false)
        end
        finished, ped = FindNextPed(handle)
    until not finished

    EndFindPed(handle)
end

Citizen.CreateThread(function()
    while true do
        SetWeaponDrops()
        Citizen.Wait(500)
    end
end)

-- Enlever le réticule

Citizen.CreateThread(function()
    local isSniper = false
    while true do
        Citizen.Wait(0)

        local ped = GetPlayerPed(-1)
        local currentWeaponHash = GetSelectedPedWeapon(ped)

        if currentWeaponHash == 100416529 then
            isSniper = true
        elseif currentWeaponHash == 205991906 then
            isSniper = true
        elseif currentWeaponHash == -952879014 then
            isSniper = true
        elseif currentWeaponHash == GetHashKey('WEAPON_HEAVYSNIPER_MK2') then
            isSniper = true
        else
            isSniper = false
        end

        if not isSniper then
            HideHudComponentThisFrame(14)
        end
    end
end)


-- Drfit 


local kmh, mph = 3.6, 2.23693629
local carSpeed = 0
local speed = kmh -- or mph
local speedLimit = 1000.0 
local driftMode

-- Thread
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(250)
		if not driftMode then
			if IsPedInAnyVehicle(PlayerPedId(), false) then
				carSpeed = GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId())) * speed
				if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), -1) == PlayerPedId() then
					if (carSpeed <= speedLimit) then  
						if IsControlPressed(0, 21) then
							SetVehicleReduceGrip(GetVehiclePedIsIn(PlayerPedId(), false), true)
						else
							SetVehicleReduceGrip(GetVehiclePedIsIn(PlayerPedId(), false), false)
						end
					end
				end
			end
		end
	end
end)

RegisterCommand('driftmode', function()
	if not driftMode then
		SetVehicleReduceGrip(GetVehiclePedIsIn(PlayerPedId(), false), true)
		driftMode = true
	else
		SetVehicleReduceGrip(GetVehiclePedIsIn(PlayerPedId(), false), false)
		driftMode = false
	end
end)

RegisterKeyMapping('driftmode', 'Toggle driftmode', 'keyboard', 'k')