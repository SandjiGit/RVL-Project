TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_society:registerSociety', 'tacos', 'tacos', 'society_tacos', 'society_tacos', 'society_tacos', {type = 'public'})

RegisterServerEvent('Ouvre:tacos')
AddEventHandler('Ouvre:tacos', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Tacos', '~p~Annonce', 'Le OTacos est désormais ~g~Ouvert~s~!', 'CHAR_TACOS', 8)
	end
end)

RegisterServerEvent('Ferme:tacos')
AddEventHandler('Ferme:tacos', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Tacos', '~p~Annonce', 'Le OTacos est désormais ~r~Fermer~s~!', 'CHAR_TACOS', 8)
	end
end)

RegisterServerEvent('Recru:tacos')
AddEventHandler('Recru:tacos', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Tacos', '~g~Annonce', '~y~Recrutement en cours, rendez-vous a OTacos !', 'CHAR_TACOS', 8)
	end
end)

RegisterServerEvent('Giga:tacos')
AddEventHandler('Giga:tacos', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Tacos', '~g~Annonce', '~y~Vous savez quels jours sommes nous ? MARDI ! aujourd\'hui journée exclusive! journée giga tacos !', 'CHAR_TACOS', 8)
	end
end)

RegisterServerEvent('esx_tacosjob:prendreitems')
AddEventHandler('esx_tacosjob:prendreitems', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_tacos', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- is there enough in the society?
		if count > 0 and inventoryItem.count >= count then

			-- can the player carry the said amount of x item?
			if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
				TriggerClientEvent('esx:showNotification', _source, "quantité invalide")
			else
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('esx:showNotification', _source, 'Objet retiré', count, inventoryItem.label)
			end
		else
			TriggerClientEvent('esx:showNotification', _source, "quantité invalide")
		end
	end)
end)


RegisterNetEvent('esx_tacosjob:stockitem')
AddEventHandler('esx_tacosjob:stockitem', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_tacos', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- does the player have enough of the item?
		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('esx:showNotification', _source, "Objet déposé "..count..""..inventoryItem.label.."")
		else
			TriggerClientEvent('esx:showNotification', _source, "quantité invalide")
		end
	end)
end)

RegisterNetEvent('aurezia:Buytacosfroid2')
AddEventHandler('aurezia:Buytacosfroid2', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 750
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_tacos', function(account)
        societyAccount = account
        end)
        xPlayer.removeMoney(price)
        societyAccount.addMoney (price)
        xPlayer.addInventoryItem('tacosfroid2', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('aurezia:Buytacosfroid3')
AddEventHandler('aurezia:Buytacosfroid3', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 620
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_tacos', function(account)
        societyAccount = account
        end)
        xPlayer.removeMoney(price)
        societyAccount.addMoney (price)
        xPlayer.addInventoryItem('vingttacosfroid3', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)


ESX.RegisterServerCallback('esx_tacosjob:inventairejoueur', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb({items = items})
end)

ESX.RegisterServerCallback('esx_tacosjob:prendreitem', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_tacos', function(inventory)
		cb(inventory.items)
	end)
end)


RegisterNetEvent('aurezia:Buytacosfroid2')
AddEventHandler('aurezia:Buytacosfroid2', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 25
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('tacosfroid2', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('aurezia:Buytacosfroid3')
AddEventHandler('aurezia:Buytacosfroid3', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 20
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('tacosfroid3', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('aurezia:Buytacosfroidxll')
AddEventHandler('aurezia:Buytacosfroidxll', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 20
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('tacosfroidxll', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('aurezia:Buypetitefroidfrite')
AddEventHandler('aurezia:Buypetitefroidfrite', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 14
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('petitefroidfrite', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('aurezia:Buymoyennefroidfrite')
AddEventHandler('aurezia:Buymoyennefroidfrite', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 14
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('moyennefroidfrite', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('aurezia:Buygrandefroidfrite')
AddEventHandler('aurezia:Buygrandefroidfrite', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 8
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('grandefroidfrite', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('aurezia:Buysundaynature')
AddEventHandler('aurezia:Buysundaynature', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 8
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('sundaynature', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('aurezia:Buysundayfraise')
AddEventHandler('aurezia:Buysundayfraise', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 8
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('sundayfraise', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)


RegisterNetEvent('craftduntacos2')
AddEventHandler('craftduntacos2', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local tacosfroid2 = xPlayer.getInventoryItem('tacosfroid2').count
    local tacos2 = xPlayer.getInventoryItem('tacos2').count

    if tacos2 > 50 then
        TriggerClientEvent('esx:showNotification', source, '~r~Tu à ateint la limite')
    elseif tacosfroid2 < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de tacos 2 viande froid pour faire ceci')
    else
        xPlayer.removeInventoryItem('tacosfroid2', 1)
        xPlayer.addInventoryItem('tacos2', 1)    
    end
end)

RegisterNetEvent('craftdunetacos3')
AddEventHandler('craftdunetacos3', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local tacosfroid2 = xPlayer.getInventoryItem('tacosfroid2').count
    local tacos3 = xPlayer.getInventoryItem('tacos3').count

    if tacos3 > 60 then
        TriggerClientEvent('esx:showNotification', source, '~r~Tu à ateint la limite')
    elseif tacosfroid2 < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de tacos 3 viande froid pour faire ceci')
    else
        xPlayer.removeInventoryItem('tacosfroid2', 1)
        xPlayer.addInventoryItem('tacos3', 1)    
    end
end)

RegisterNetEvent('craftdunetacosxll')
AddEventHandler('craftdunetacosxll', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local tacosfroidxll = xPlayer.getInventoryItem('tacosfroidxll').count
    local tacosxll = xPlayer.getInventoryItem('tacosxll').count

    if tacosxll > 60 then
        TriggerClientEvent('esx:showNotification', source, '~r~Tu à ateint la limite')
    elseif tacosfroidxll < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de tacos xll froid pour faire ceci')
    else
        xPlayer.removeInventoryItem('tacosfroidxll', 1)
        xPlayer.addInventoryItem('tacosxll', 1)    
    end
end)

RegisterNetEvent('craftdunepetitefrite')
AddEventHandler('craftdunepetitefrite', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local petitefroidfrite = xPlayer.getInventoryItem('petitefroidfrite').count
    local petitefrite = xPlayer.getInventoryItem('petitefrite').count

    if petitefrite > 60 then
        TriggerClientEvent('esx:showNotification', source, '~r~Tu à ateint la limite')
    elseif petitefroidfrite < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de petit frite froid pour faire ceci')
    else
        xPlayer.removeInventoryItem('petitefroidfrite', 1)
        xPlayer.addInventoryItem('petitefrite', 1)    
    end
end)

RegisterNetEvent('craftdunemoyennefrite')
AddEventHandler('craftdunemoyennefrite', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local moyennefroidfrite = xPlayer.getInventoryItem('moyennefroidfrite').count
    local moyennefrite = xPlayer.getInventoryItem('moyennefrite').count

    if moyennefrite > 60 then
        TriggerClientEvent('esx:showNotification', source, '~r~Tu à ateint la limite')
    elseif moyennefroidfrite < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de moyenne frite froid pour faire ceci')
    else
        xPlayer.removeInventoryItem('moyennefroidfrite', 1)
        xPlayer.addInventoryItem('moyennefrite', 1)    
    end
end)

RegisterNetEvent('craftdunegrandefrite')
AddEventHandler('craftdunegrandefrite', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local grandefroidfrite = xPlayer.getInventoryItem('grandefroidfrite').count
    local grandefrite = xPlayer.getInventoryItem('grandefrite').count

    if grandefrite > 60 then
        TriggerClientEvent('esx:showNotification', source, '~r~Tu à ateint la limite')
    elseif grandefroidfrite < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de grande frite froid pour faire ceci')
    else
        xPlayer.removeInventoryItem('grandefroidfrite', 1)
        xPlayer.addInventoryItem('grandefrite', 1)    
    end
end)

RegisterNetEvent('recoltegigatacosfroid')
AddEventHandler('recoltegigatacosfroid', function()
    local item = "gigatacosfroid"
    local limiteitem = 50
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count
    

    if nbitemdansinventaire >= limiteitem then
        TriggerClientEvent('esx:showNotification', source, "Ta pas assez de place dans ton inventaire!")
        recoltepossible = false
    else
        xPlayer.addInventoryItem(item, 1)
        TriggerClientEvent('esx:showNotification', source, "Récolte en cours...")
		return
    end
end)

RegisterNetEvent('traitementgigatacosfroid')
AddEventHandler('traitementgigatacosfroid', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local gigatacosfroid = xPlayer.getInventoryItem('gigatacosfroid').count
    local gigatacos = xPlayer.getInventoryItem('gigatacos').count

    if gigatacos > 50 then
        TriggerClientEvent('esx:showNotification', source, '~r~Il semble que tu ne puisses plus porter de giga tacos...')
    elseif gigatacosfroid < 3 then
        TriggerClientEvent('esx:showNotification', source, '~r~Pas assez de giga tacos froid pour traiter...')
    else
        xPlayer.removeInventoryItem('gigatacosfroid', 5)
        xPlayer.addInventoryItem('gigatacos', 1)    
    end
end)


RegisterServerEvent('sellgigatacos')
AddEventHandler('sellgigatacos', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local gigatacos = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "gigatacos" then
			gigatacos = item.count
		end
	end
    
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_tacos', function(account)
        societyAccount = account
    end)
    
    if gigatacos > 0 then
        xPlayer.removeInventoryItem('gigatacos', 1)
        xPlayer.addMoney(40)
        societyAccount.addMoney(40)
        TriggerClientEvent('esx:showNotification', xPlayer.source, "~g~Vous avez gagner ~b~40$~g~ pour chaque vente de giga tacos")
        TriggerClientEvent('esx:showNotification', xPlayer.source, "~g~La société gagne ~b~40$~g~ pour chaque vente de giga tacos")
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, "Vous n'avez plus rien à vendre")
    end
end)

-- Gigatacos

RegisterNetEvent('aurezia:Buygobeletvide')
AddEventHandler('aurezia:Buygobeletvide', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 750
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_tacos', function(account)
        societyAccount = account
        end)
        xPlayer.removeMoney(price)
        societyAccount.addMoney (price)
        xPlayer.addInventoryItem('gobeletvide', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Goble-vide~w~ donner !")
    else
         TriggerClientEvent('esx:showNotification', source, "il y a plus de Goble-vide")
    end
end)

-- Craft boission

RegisterNetEvent('craftdunegobeletdecoca')
AddEventHandler('craftdunegobeletdecoca', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local gobeletvide = xPlayer.getInventoryItem('gobeletvide').count
    local gobeletdecoca = xPlayer.getInventoryItem('gobeletdecoca').count

    if gobeletdecoca > 60 then
        TriggerClientEvent('esx:showNotification', source, '~r~Tu à ateint la limite')
    elseif gobeletvide < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de boission pour faire ceci')
    else
        xPlayer.removeInventoryItem('gobeletvide', 1)
        xPlayer.addInventoryItem('gobeletdecoca', 1)    
    end
end)

RegisterNetEvent('craftdunegobeletdeicetea')
AddEventHandler('craftdunegobeletdeicetea', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local gobeletvide = xPlayer.getInventoryItem('gobeletvide').count
    local gobeletdeicetea = xPlayer.getInventoryItem('gobeletdeicetea').count

    if gobeletdeicetea > 60 then
        TriggerClientEvent('esx:showNotification', source, '~r~Tu à ateint la limite')
    elseif gobeletvide < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de boission pour faire ceci')
    else
        xPlayer.removeInventoryItem('gobeletvide', 1)
        xPlayer.addInventoryItem('gobeletdeicetea', 1)    
    end
end)

RegisterNetEvent('craftdunegobeletdehawai')
AddEventHandler('craftdunegobeletdehawai', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local gobeletvide = xPlayer.getInventoryItem('gobeletvide').count
    local gobeletdehawai = xPlayer.getInventoryItem('gobeletdehawai').count

    if gobeletdehawai > 60 then
        TriggerClientEvent('esx:showNotification', source, '~r~Tu à ateint la limite')
    elseif gobeletvide < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de boission pour faire ceci')
    else
        xPlayer.removeInventoryItem('gobeletvide', 1)
        xPlayer.addInventoryItem('gobeletdehawai', 1)    
    end
end)
