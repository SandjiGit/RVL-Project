ESX = nil
TriggerEvent(Config.esxEvent, function(obj) ESX = obj end)

enterCoffre = {}
playersEnter = {}
weightCoffre = {}
local nameItem = ""
local countItem = 0
local id = 0
local beforeCount = 0
local totalTake = 0

RegisterServerEvent("kCoffre:enter")
AddEventHandler("kCoffre:enter", function(plate) -- à sécu
     if not plate then return end
     if enterCoffre[plate] then
          print("Coffre is ^2ready^0 ! ("..plate..")")
          enterCoffre[plate] = false
          playersEnter[source] = false
     else
          print("Coffre is ^1not ready^0 ! ("..plate..")")
          enterCoffre[plate] = true
          playersEnter[source] = true
     end
end)

ESX.RegisterServerCallback('kCoffre:getEnterCoffre', function(source, cb, plate)
     local _src = source
     if _src then
          if enterCoffre[plate] then
               cb(false)
          else
               cb(true)
          end
     end
end)

ESX.RegisterServerCallback('kCoffre:MyInventory', function(source, cb)
     local xPlayer = ESX.GetPlayerFromId(source)
     local item = xPlayer.getInventory()
     local weapon = xPlayer.getLoadout()
     local money = xPlayer.getAccount('black_money').money
     cb({
          item = item,
          weapon = weapon,
          money = money
     }) 
 end)

ESX.RegisterServerCallback('kCoffre:getVeh', function(source, cb, plate)
     print("Go event from  plate ^3"..plate.."^0")
     local FinalWeight = 0
     local _src = source
     if _src then
          local player = ESX.GetPlayerFromId(_src)
          if weightCoffre[plate] == nil then
               weightCoffre[plate] = 0
          end
          MySQL.Async.fetchAll("SELECT * FROM "..Config.Table.." WHERE plate = @plate ORDER BY id", {["@plate"] = plate}, function(result)
               if result[1] then
                    for i = 1, #result, 1 do
                         AvvFinalWeight = Config.Vehicle.itemWeight[result[i].name] * result[i].count
                         AvFinalWeight = weightCoffre[plate] + AvvFinalWeight
                         if weightCoffre[plate] ~= AvFinalWeight then
                              FinalWeight = FinalWeight+AvFinalWeight
                              TriggerClientEvent("kCoffre:RefreshWeightTrunk", player.source, FinalWeight)
                         end
                    end
                    cb(result)
               else
                    TriggerClientEvent("kCoffre:RefreshWeightTrunk", player.source, 0)
                    cb(0)
               end
          end)
     end
end)



RegisterNetEvent("kCoffre:action")
AddEventHandler("kCoffre:action", function(class, model, plate, label, name, count, ammo, typeA, typeB) -- à sécu
     print("Go event from palte ^3"..plate.."^0")
     local _src = source
     if _src then
          if not playersEnter[_src] then return DropPlayer(_src, "Faille trouvé !") end
          local player = ESX.GetPlayerFromId(_src)
          if typeB == "put" then
                    MySQL.Async.fetchAll("SELECT * FROM "..Config.Table.." WHERE plate = @plate ORDER BY id", {["@plate"] = plate}, function(result)
                         for k,v in pairs(result) do
                              if v.type == "money" then
                                   if v.name == name then
                                        itemName = v.name
                                        countItem = v.count
                                        id = v.id
                                        hasItem = true
                                   end
                              elseif v.type == "item" then
                                   if v.name == name then
                                        itemName = v.name
                                        countItem = v.count
                                        id = v.id
                                        hasItem = true
                                   end
                              elseif v.type == "weapon" then
                                   if v.name == name then
                                        return
                                        TriggerClientEvent("esx:showNotification", player.source, "Il y a déjà cette arme !")
                                   end
                              end
                         end
                         if hasItem then
                              local total = tonumber(countItem+count)
                              print("J'additionne car l'item ("..label..") est existant !","Total : "..total,"Plaque : "..plate)
                              MySQL.Sync.execute("UPDATE "..Config.Table.." SET `count` = @a, ammo = @b WHERE id = @id", {
                                   ["@id"] = id,
                                   ["@a"] = total,
                                   ["@b"] = ammo
                              })
                              if typeA == "item" then
                                   TriggerClientEvent("esx:showNotification", player.source, "Vous venez de déposer ~b~"..count.."x "..label.."~s~ dans le coffre .")
                                   player.removeInventoryItem(name, count)
                                   hasItem = false
                              elseif typeA == "money" then
                                   TriggerClientEvent("esx:showNotification", player.source, "Vous venez de déposer "..count.."$ d'argent "..label.." dans le coffre .")
                                   player.removeAccountMoney("black_money", count)
                                   hasItem = false
                              end
                         else
                              MySQL.Async.execute("INSERT INTO "..Config.Table.." (label, name, count, ammo, type, plate, model) VALUES (@label, @name, @count, @ammo, @type, @plate, @model)", {
                                   ['@label'] = label,
                                   ['@name'] = name,
                                   ['@count'] = count,
                                   ["@ammo"] = ammo,
                                   ['@type'] = typeA,
                                   ['@plate'] = plate,
                                   ['@model'] = model
                              }, function()
                                   if typeA == "item" then
                                        TriggerClientEvent("esx:showNotification", player.source, "Vous venez de déposer ~b~"..count.."x "..label.."~s~ dans le coffre .")
                                        player.removeInventoryItem(name, count)
                                   elseif typeA == "weapon" then
                                        TriggerClientEvent("esx:showNotification", player.source, "Vous venez de déposer ~b~"..label.." "..ammo.."munition(s)~s~ dans le coffre .")
                                        player.removeWeapon(name, ammo)
                                   elseif typeA == "money" then
                                        TriggerClientEvent("esx:showNotification", player.source, "Vous venez de déposer "..count.."$ d'argent "..label.." dans le coffre .")
                                        player.removeAccountMoney("black_money", count)
                                   end
                                   hasItem = false
                              end)          
                         end
                    end)  
          elseif typeB == "take" then
               print("Event take form palte "..plate.." !")
               MySQL.Async.fetchAll("SELECT * FROM "..Config.Table.." WHERE plate = @plate ORDER BY id", {["@plate"] = plate}, function(result)
                    for _,v in pairs (result) do
                         if typeA == "item" then
                              if v.name == name then
                                   id = v.id
                                   beforeCount = v.count
                              end
                         elseif typeA == "money" then
                                   if v.name == name then
                                        id = v.id
                                        beforeCount = v.count
                                   end
                         elseif typeA == "weapon" then
                              local weapon = player.getWeapon(v.name)
                              if not weapon then
                                   if v.name == name then
                                        id = v.id
                                        beforeCount = v.count
                                   end
                              else
                                   return
                                   TriggerClientEvent("esx:showNotification", player.source, "Vous avez déjà l'arme sur vous !")
                              end
                         end
                    end
                    totalTake = beforeCount-count
                    if totalTake < 1 then
                         MySQL.Async.execute("DELETE FROM "..Config.Table.." WHERE id = @id",{["@id"] = id},function()
                              if typeA == "item" then
                                   player.addInventoryItem(name, count)
                                   TriggerClientEvent("esx:showNotification", player.source, "Vous venez de prendre ~b~"..count.."x "..label.."~s~ dans le coffre .")
                              elseif typeA == "weapon" then
                                   player.addWeapon(name, ammo)
                                   TriggerClientEvent("esx:showNotification", player.source, "Vous venez de prendre ~b~"..label.." "..ammo.."munition(s)~s~ dans le coffre .")
                              elseif typeA == "money" then
                                   player.addAccountMoney("black_money", count)
                                   TriggerClientEvent("esx:showNotification", player.source, "Vous venez de prendre "..count.."$ d'argent "..label.." dans le coffre .")
                              end
                              nameItem = ""
                              countItem = 0
                              beforeCount = 0
                              totalTake = 0
                         end)
                    else
                         MySQL.Async.execute("UPDATE "..Config.Table.." SET count = @count WHERE id=@id",{["@id"] = id, ["@count"] = totalTake},function()
                              if typeA == "item" then
                                   player.addInventoryItem(name, count)
                                   TriggerClientEvent("esx:showNotification", player.source, "Vous venez de prendre ~b~"..count.."x "..label.."~s~ dans le coffre .")
                              elseif typeA == "weapon" then
                                   player.addWeapon(name, count)
                                   TriggerClientEvent("esx:showNotification", player.source, "Vous venez de prendre ~b~"..label.." "..count.."munition(s)~s~ dans le coffre .")
                              elseif typeA == "money" then
                                   player.addAccountMoney("black_money", count)
                                   TriggerClientEvent("esx:showNotification", player.source, "Vous venez de prendre "..count.."$ d'argent "..label.." dans le coffre .")
                              end
                              nameItem = ""
                              countItem = 0
                              beforeCount = 0
                              totalTake = 0
                         end) 
                    end
               end)
          end
     end
end)