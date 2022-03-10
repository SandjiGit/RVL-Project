TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_society:registerSociety', 'sl-immo', 'sl-immo', 'society_sl-immo', 'society_sl-immo', 'society_sl-immo', {type = 'public'})

RegisterServerEvent('Ouvre:sl-immo')
AddEventHandler('Ouvre:sl-immo', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Taxi', '~p~Annonce', 'Le taxi est désormais ~g~Ouvert~s~!', 'CHAR_FLOYD', 8)
	end
end)

RegisterServerEvent('Ferme:sl-immo')
AddEventHandler('Ferme:sl-immo', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Taxi', '~p~Annonce', 'Le taxi est désormais ~r~Fermer~s~!', 'CHAR_FLOYD', 8)
	end
end)


-- Mission 

--RegisterNetEvent("taxi:FinishMission")
--AddEventHandler("taxi:FinishMission", function(bonus)
    --local xPlayer = ESX.GetPlayerFromId(source)

    --if xPlayer.job.name ~= "taxi" then
        --TriggerEvent("AC:Violations", 24, "Event: taxi:FinishMission job: "..xPlayer.job.name, source)
        --return
    --end

    --local gain = math.random(70,150) + bonus
    --xPlayer.addAccountMoney('bank', gain)

    --TriggerEvent('esx_addonaccount:getSharedAccount', 'society_taxi', function(account)
        ---if account ~= nil then
           -- societyAccount = account
           -- societyAccount.addMoney(gain * 2)
       -- end
 ---   end)

---    TriggerClientEvent("esx:showNotification", source, "Vous avez terminé votre mission.\nGain: ~g~"..gain.."~s~€\nGain entreprise: ~g~".. tostring(gain * 2) .."~s~€", "CHAR_FLOYD", 5000, "danger")
--end)