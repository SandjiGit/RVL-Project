ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
TriggerEvent('esx_phone:registerNumber', 'banquier', 'alerte banquier', true, true)
TriggerEvent('esx_society:registerSociety', 'banquier', 'banquier', 'society_banquier', 'society_banquier', 'society_banquier', {type = 'public'})

RegisterServerEvent('open:banquier')
AddEventHandler('open:banquier', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Banquier', 'Annonce', 'La banque est ~g~ouverte~s~, un banquier est actuellement disponible.', 'CHAR_BANK_FLEECA', 9)
    end
end)

RegisterServerEvent('close:banquier')
AddEventHandler('close:banquier', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Banquier', 'Annonce', 'La banque est ~r~fermé~s~, aucun banquier n\'est disponible.', 'CHAR_BANK_FLEECA', 9)
	end
end) 

RegisterServerEvent('esx_banquierjob:getStockItem')
AddEventHandler('esx_banquierjob:getStockItem', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_banquier', function(inventory)
		local item = inventory.getItem(itemName)
		if count > 0 and item.count >= count then inventory.removeItem(itemName, count) xPlayer.addInventoryItem(itemName, count)
			TriggerClientEvent('esx:showNotification', source, "Vous avez retiré x~g~"..count.."~s~ "..item.label.."")
        else TriggerClientEvent('esx:showNotification', source, "quantité invalide")
		end
	end)
end)

ESX.RegisterServerCallback('esx_banquierjob:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_banquier', function(inventory)
		cb(inventory.items)
	end)
end)

RegisterServerEvent('esx_banquierjob:putStockItems')
AddEventHandler('esx_banquierjob:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_banquier', function(inventory)
		local item = inventory.getItem(itemName)
		local playerItemCount = xPlayer.getInventoryItem(itemName).count
		if item.count >= 0 and count <= playerItemCount then xPlayer.removeInventoryItem(itemName, count) inventory.addItem(itemName, count)
        else TriggerClientEvent('esx:showNotification', source, "quantité invalide")
		end
		TriggerClientEvent('esx:showNotification', source, "Vous avez déposé ~g~x"..count.."~s~ "..item.label.."")
	end)
end)

ESX.RegisterServerCallback('esx_banquierjob:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items = xPlayer.inventory
	cb({items = items})
end)

RegisterNetEvent("G_Banquier:appel")
AddEventHandler("G_Banquier:appel", function()
	local xPlayers = ESX.GetPlayers()
	for i = 1, #xPlayers, 1 do
		local target = ESX.GetPlayerFromId(xPlayers[i])
		if target.job.name == 'banquier' then
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], "Appel Banquier", nil, "Une personne vient de faire un appel, un banquier est demandé à l'accueil", "CHAR_BANK_FLEECA", 9)
		end
	end
end)

RegisterNetEvent("G_Banquier:appelembed")
AddEventHandler("G_Banquier:appelembed", function(np, tel, dis, rai)
	local webhooks = ""
	PerformHttpRequest(webhooks, function(err, text, headers) end, 'POST', json.encode({embeds={{title="Rendez-vous / Banquier",description="**Nom : **``"..np.."``\n\n**Numéro de Téléphone : **``"..tel.."``\n\n**Disponibilité : **``"..dis.."``\n\n**Raison : **``"..rai.."``",color= 3066993}}}), { ['Content-Type'] = 'application/json' })
end)

RegisterNetEvent('G_Banquier:cb')
AddEventHandler('G_Banquier:cb', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local money = xPlayer.getMoney()
	local prix = 0
	if money >= prix then
		xPlayer.removeMoney(prix)
		xPlayer.addInventoryItem('cartebancaire', 1)
		TriggerClientEvent('esx:showNotification', source, "Vous venez de recevoir votre ~b~Carte Bancaire")
	else
		TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez d'argent")
	end
end)


RegisterServerEvent("G_Bank:pf") AddEventHandler("G_Bank:pf", function(fct, amount) TriggerClientEvent("G_Bank:portefeuille", source, ESX.GetPlayerFromId(source).getMoney()) end)
RegisterServerEvent("G_Bank:banque") AddEventHandler("G_Bank:banque", function(fct, amount) TriggerClientEvent("G_Bank:compte", source, ESX.GetPlayerFromId(source).getBank()) end)

RegisterServerEvent("deposer")
AddEventHandler("deposer", function(somme)
    if ESX.GetPlayerFromId(source).getMoney() >= somme then
    	ESX.GetPlayerFromId(source).addAccountMoney('bank', somme)
    	ESX.GetPlayerFromId(source).removeMoney(somme)
        TriggerClientEvent('esx:showAdvancedNotification', source, 'Banque', 'Fleeca Bank', "Vous avez déposé ~g~"..somme.."$", 'CHAR_BANK_FLEECA', 9)
    else
        TriggerClientEvent('esx:showNotification', source, "Le montant est trop élevé")
    end    
end)

RegisterServerEvent("retirer")
AddEventHandler("retirer", function(somme)
    if ESX.GetPlayerFromId(source).getBank() >= somme then
    	ESX.GetPlayerFromId(source).removeAccountMoney('bank', somme)
    	ESX.GetPlayerFromId(source).addMoney(somme)
        TriggerClientEvent('esx:showAdvancedNotification', source, 'Banque', 'Fleeca Bank', "Vous avez retiré ~g~"..somme.."$", 'CHAR_BANK_FLEECA', 9)
    else
        TriggerClientEvent('esx:showNotification', source, "Le montant est trop élevé")
    end    
end)

RegisterServerEvent('transfere')
AddEventHandler('transfere', function(iban2, montant2)
    local balance = 0
    if (ESX.GetPlayerFromId(iban2) == nil or ESX.GetPlayerFromId(iban2) == -1) then
        TriggerClientEvent('esx:showNotification', source, "Votre destinataire est introuvable")
    else
        balance = ESX.GetPlayerFromId(source).getAccount('bank').money
        zbalance = ESX.GetPlayerFromId(iban2).getAccount('bank').money
        if tonumber(source) == tonumber(iban2) then
            TriggerClientEvent('esx:showNotification', source, "Vous ne pouve pas transférer de l'argent à votre IBAN")
        else
            if balance <= 0 or balance < tonumber(montant2) or tonumber(montant2) <= 0 then
                TriggerClientEvent('esx:showAdvancedNotification', source, 'Fleeca Bank', "Infos Transfère", "Vous n'avez pas les fonds", 'CHAR_BANK_FLEECA', 9)
            else
                ESX.GetPlayerFromId(source).removeAccountMoney('bank', tonumber(montant2))
                ESX.GetPlayerFromId(iban2).addAccountMoney('bank', tonumber(montant2))
                TriggerClientEvent('esx:showAdvancedNotification', source, "Fleeca Bank", 'Infos Transfère', "Vous avez transféré ~g~"..montant2.."$\n~s~IBAN du destinataire : "..iban2..".", 'CHAR_BANK_FLEECA', 9)
                TriggerClientEvent('esx:showAdvancedNotification', iban2, "Fleeca Bank", 'Infos Transfère', "Vous avez reçu ~g~"..montant2.."$\n~s~IBAN de l'auteur : "..source..".", 'CHAR_BANK_FLEECA', 9)
            end
        end
    end
end)

ESX.RegisterServerCallback('G_Bank:getItemAmount', function(source, cb, item)
    local xPlayer = ESX.GetPlayerFromId(source)
    local items = xPlayer.getInventoryItem(item)
    if items == nil then
        cb(0)
    else
        cb(items.count)
    end
end)

RegisterServerEvent('RVL:bank_pin_redefine')
AddEventHandler('RVL:bank_pin_redefine', function(pin2)
	local xPlayer = ESX.GetPlayerFromId(source)
  	if pin2 ~= nil then
  		MySQL.Async.execute(
			'UPDATE rvl_users_infos SET bank_pin = @pin WHERE identifier = @identifier',
			{
				['@identifier'] = xPlayer.identifier,
				['@pin'] = pin2
			}
		)
		TriggerClientEvent('esx:showNotification', source, "RVL | Options Joueurs Modifiés avec succès.")
  	else
  		TriggerClientEvent('esx:showNotification', source, "Une erreur est survenus, contacter le Développeur du Serveur (Sandji).")
  	end

end)

RegisterServerEvent('RVL:bank_pin_set')
AddEventHandler('RVL:bank_pin_set', function(pin)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.execute('INSERT INTO rvl_users_infos (identifier, bank_pin) VALUES (@identifier, @pin)', {
        ['@identifier'] = xPlayer.identifier,
        ['@pin'] = pin
    }) 
end)

RegisterServerEvent('RVL:bank_pin_delete')
AddEventHandler('RVL:bank_pin_delete', function()
  	MySQL.Async.execute(
		'DELETE FROM rvl_users_infos WHERE identifier = @identifier',{
			['@identifier'] = xPlayer.identifier
		})
end)


ESX.RegisterServerCallback('RVL:load_bank_infos', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerbankinfos = {}
    MySQL.Async.fetchAll('SELECT * FROM rvl_users_infos WHERE (identifier = @identifier)', {
        ['@identifier'] = xPlayer.identifier
    }, function(result)
      for i = 1, #result, 1 do
      table.insert(playerbankinfos, {
      	pin = result[i].bank_pin
      })
    end
    cb(playerbankinfos)

    end)
end)