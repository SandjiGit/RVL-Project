local accueil = false 
local mainMenu = RageUI.CreateMenu('Accueil', 'MENU')
local subMenu = RageUI.CreateSubMenu(mainMenu, 'Rendez-vous', 'MENU')
local subMenu2 = RageUI.CreateSubMenu(mainMenu, "Carte Bancaire", "MENU")
mainMenu.Closed = function() accueil = false end

local PlayerInfos = {
    infos = {
      list = {},
        playerbankinfos = {};
    },
}

function Accueil()
	if accueil then accueil = false RageUI.Visible(mainMenu, false) return else accueil = true RageUI.Visible(mainMenu, true)
		CreateThread(function()
		    while accueil do 
		        RageUI.IsVisible(mainMenu, function() 
			        RageUI.Button("Prendre un rendez-vous", nil, {RightLabel = "→"}, true, {onSelected = function() end}, subMenu)
                    RageUI.Button("Appeler un banquier", nil, {RightLabel = "→"}, true, {
				        onSelected = function()
                            TriggerServerEvent("G_Banquier:appel") 
                            ESX.ShowNotification("Votre appel est bien passé")
				        end
			        })
                    ESX.TriggerServerCallback('RVL:load_bank_infos', function(playerbankinfos)
                        PlayerInfos.infos.list = playerbankinfos
                    end)
                    for i = 1, #PlayerInfos.infos.list, 1 do
                        ESX.ShowNotification(PlayerInfos.infos.list[i].pin)
                    if PlayerInfos.infos.list[i].pin == nil then
                        RageUI.Button("Acheter une carte bancaire", nil, {RightLabel = "→"}, true, {onSelected = function() end}, subMenu2)
                    else
                        RageUI.Separator("Options de Carte")
                        RageUI.Button("Recevoir une Novelle Carte", nil, {RightLabel = "→"}, true, {onSelected = function()
                            TriggerServerEvent('G_Banquier:cb', source)
                        end})
                        RageUI.Button("Modifier votre Code Pin", nil, {RightLabel = "→"}, true, {
                            onSelected = function()
                                local pin2 = KeyboardInput("Code Pin", nil, 4)
                                if pin2 == nil then ESX.ShowNotification("Vous devez définir un Code Pin")
                                else 
                                    ESX.ShowNotification("Votre Code Pin à été défini sur ~g~"..pin2)
                                    TriggerServerEvent('RVL:bank_pin_redefine', pin2)
                                end
                            end
                        })
                        RageUI.Button("Supprimer votre Code Pin", nil, {RightLabel = "→"}, true, {
                            onSelected = function()
                                TriggerServerEvent('RVL:bank_pin_delete')
                            end
                        })
                    end
                end
		        end)
                RageUI.IsVisible(subMenu2, function()
                    RageUI.Button("Informations", "Lors de la création de votre carte bancair, nous vous demandons de lui assigner un Code Pin, celui-çi servira à vous connecter à votre compte depuis la banque ou un distributeur.", {RightBadge = RageUI.BadgeStyle.Card}, true, {onSelected = function() end})
                    
                    RageUI.Separator("Actions:")

                    RageUI.Button("Définir votre Code Pin:", "Vous pourrez le modifier à n'importe quel moment.", {RightLabel = pin}, true, {
                        onSelected = function()
                            local pin = KeyboardInput("Code Pin", nil, 4)
                            if pin == nil then ESX.ShowNotification("Vous devez définir un Code Pin")
                            else 
                                d9 = true
                                ESX.ShowNotification("Votre Code Pin à été défini sur ~g~"..pin)
                                TriggerServerEvent('RVL:bank_pin_set', pin)

                            end
                        end
                    })
                    RageUI.Button("Sauvegarder", false, {RightBadge = RageUI.BadgeStyle.Tick, Color = {BackgroundColor = {120,255,0,100}}}, d9, {
                        onSelected = function()
                            TriggerServerEvent('G_Banquier:cb', source)
                        end
                    })
                end)
                RageUI.IsVisible(subMenu, function ()
                    RageUI.Button("Nom & Prénom :", nil, {RightLabel = np2}, true, {
                        onSelected = function() 
                            local np = KeyboardInput("Nom & Prénom ", nil, 15)
                            if np == nil then ESX.ShowNotification("Vous devez mettre un nom et un prénom")
                            else np1 = np np2 = "~g~"..np1.."" d1 = true
                            end
                        end
                    })
                    RageUI.Button("Numéro de téléphone :", nil, {RightLabel = tel2}, d1, {
                        onSelected = function() 
                            local tel = KeyboardInput("Numéro de téléphone ", nil, 15)
                            if tel == nil then ESX.ShowNotification("Vous devez mettre un numéro de téléphone")
                            else tel1 = tel tel2 = "~g~"..tel1.."" d2 = true
                            end
                        end
                    })
                    RageUI.Button("Disponibilité :", nil, {RightLabel = dis2}, d2, {
                        onSelected = function() 
                            local dis = KeyboardInput("Disponibilité ", nil, 25)
                            if dis == nil then ESX.ShowNotification("Vous devez mettre vos disponibilités")
                            else dis1 = dis dis2 = "~g~"..dis1.."" d3 = true
                            end
                        end
                    })
                    RageUI.Button("Raison :", nil, {RightLabel = rai2}, d3, {
                        onSelected = function() 
                            local rai = KeyboardInput("Raison ", nil, 100)
                            if rai == nil then ESX.ShowNotification("Vous devez mettre une raison")
                            else rai1 = rai rai2 = "~g~"..rai1.."" d4 = true
                            end
                        end
                    })
                    RageUI.Button("Valider", false, {RightBadge = RageUI.BadgeStyle.Tick, Color = {BackgroundColor = {120,255,0,100}}}, d4, {
                        onSelected = function()
                            np,tel,dis,rai = np1,tel1,dis1,rai1
                            TriggerServerEvent("G_Banquier:appelembed", np, tel, dis, rai) 
                            np2,tel2,dis2,rai2 = "","","",""
                            d1,d2,d3,d4 = false,false,false,false
                            RageUI.CloseAll()
                            accueil = false 
                        end
                    })
                end)
		    Wait(0)
		    end
	    end)
    end
end

local pos = {{x = 246.42, y = 223.30, z = 106.29}}

Citizen.CreateThread(function()
    while true do
        local wait = 900
        for k in pairs(pos) do
                local coords = GetEntityCoords(GetPlayerPed(-1), false)
                local dist = Vdist(coords.x, coords.y, coords.z, pos[k].x, pos[k].y, pos[k].z)
                if dist <= 2.0 then
                    wait = 0
                    DrawMarker(6, 246.42, 223.30, 105.29, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0, 255, 66, 255, false, false, p19, false) 
                    if dist <= 1.0 then
                        wait = 0
                        ESX.ShowHelpNotification("~INPUT_TALK~ pour ouvrir l'~g~Accueil")
                        if IsControlJustPressed(1,51) then
					        Accueil()
                        end
                    end
                end
        Citizen.Wait(wait)
        end
    end
end)
