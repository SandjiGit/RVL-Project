ESX = nil Citizen.CreateThread(function() while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)  Citizen.Wait(0) end end)

local open = false
local Main = RageUI.CreateMenu("Magasin", "Categories")
local dressing = RageUI.CreateSubMenu(Main,"Magasin", "Dressing")
local dressing = RageUI.CreateSubMenu(Main,"Magasin", "Dressing")
local eregister = RageUI.CreateSubMenu(Main, "Magasin", "Lunette")
local tshirt = RageUI.CreateSubMenu(Main, "Magasin", "Tshirt")
local torse = RageUI.CreateSubMenu(Main, "Magasin", "Torse")
local pantalon = RageUI.CreateSubMenu(Main, "Magasin", "Pantalon")
local chaussure = RageUI.CreateSubMenu(Main, "Magasin", "Chaussure")
local bras = RageUI.CreateSubMenu(Main, "Magasin", "Bras")
local chapeau = RageUI.CreateSubMenu(Main, "Magasin", "Chapeau")
local chaine = RageUI.CreateSubMenu(Main, "Magasin", "Chaine")
local lunette = RageUI.CreateSubMenu(Main, "Magasin", "Lunette")
local sac = RageUI.CreateSubMenu(Main,"Magasin", "Sac")
lunette.EnableMouse = true
chaine.EnableMouse = true
chapeau.EnableMouse = true
bras.EnableMouse = true
chaussure.EnableMouse = true
pantalon.EnableMouse = true
tshirt.EnableMouse = true
torse.EnableMouse = true
sac.EnableMouse = true
Main.Closed = function()
    RageUI.Visible(Main, false)
    open = false
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        TriggerEvent('skinchanger:loadSkin', skin)
    end)
end


local Vetement = {
SliderPannelTorso = {
  Minimum = 0,
  Index = 0,
  },
SliderPannelTshirt = {
  Minimum = 0,
  Index = 0,
   },
SliderPannelPatanlon = {
  Minimum = 0,
  Index = 0,
  },
SliderPannelChaussure = {
  Minimum = 0,
  Index = 0,
},
SliderPannelChapeau = {
  Minimum = 0,
  Index = 0,
},
SliderPannelChaine = {
  Minimum = 0,
  Index = 0,
},
SliderPannelLunette = {
  Minimum = 0,
  Index = 0,
},
SliderPannelSac = {
  Minimum = 0,
  Index = 0,
},
dressing = {
  DressingList = {'Equiper', 'Renommer', 'Supprimer'},
	DressingIndex = 1,
  liste = {},
	tenue = {};
},
}

local SliderProgressTorse = 0
local SliderProgressTshirt = 0
local SliderProgressPatanlon = 0
local SliderProgressChaussure = 0
local SliderProgressBras = 0
local SliderProgressChapeau = 0
local SliderProgressChaine = 0
local SliderProgressLunette = 0
local SliderProgressSac = 0

OpenVetement = function()
    RageUI.CloseAll()
     if main then 
      main = false
         RageUI.Visible(Main, false)
         return
     else
      main = true 
         RageUI.Visible(Main, true)
         Citizen.CreateThread(function()
         while main do 
             RageUI.IsVisible(Main,function()

              RageUI.Button("Mon Dressing",nil,{RightBadge = RageUI.BadgeStyle.Clothes },true,{
                onSelected = function()
                end
              },dressing)

              RageUI.Button("Catégorie: Tshirts",nil,{RightLabel = "→"},true,{
              onSelected = function()
              end
            },tshirt)

            RageUI.Button("Catégorie: Sacs",nil,{RightLabel = "→"},true,{
              onSelected = function()
              end
            },sac)

            RageUI.Button("Catégorie: Torses",nil,{RightLabel = "→"},true,{
              onSelected = function()
              end
            },torse)

            RageUI.Button("Catégorie: Pantalons",nil,{RightLabel = "→"},true,{
              onSelected = function()
              end
            },pantalon)

            RageUI.Button("Catégorie: Chaussures",nil,{RightLabel = "→"},true,{
              onSelected = function()
              end
            },chaussure)

            RageUI.Button("Catégorie: Bras",nil,{RightLabel = "→"},true,{
              onSelected = function()
              end
            },bras)

            RageUI.Button("Catégorie: Chapeaux",nil,{RightLabel = "→"},true,{
              onSelected = function()
              end
            },chapeau)

            RageUI.Button("Catégorie: Chaines",nil,{RightLabel = "→"},true,{
              onSelected = function()
              end
            },chaine)


            RageUI.Button("Catégorie: Lunettes",nil,{RightLabel = "→"},true,{
              onSelected = function()
              end
            },lunette)


            RageUI.Button("Valider et payer : ~g~175$" , "Prix du Shopping : ~g~175$", { Color = { BackgroundColor = { 0, 140, 0, 160 } } }, true, {
              onSelected = function()
                    end
                },eregister)

          end)

      RageUI.IsVisible(dressing, function()
        ESX.TriggerServerCallback('Vetement:clothe_load', function(tenue)
          Vetement.dressing.liste = tenue
      end)
      for i = 1, #Vetement.dressing.liste, 1 do
      RageUI.List(Vetement.dressing.liste[i].nom, Vetement.dressing.DressingList, Vetement.dressing.DressingIndex, nil, {}, true, {
        onListChange = function(Index)
          Vetement.dressing.DressingIndex = Index
        end,
        onSelected = function(Index)
          tenuchoisi = Vetement.dressing.liste[i] 
            if Index == 1 then
              TriggerEvent('skinchanger:getSkin', function(skin)
                TriggerEvent('skinchanger:loadClothes', skin, json.decode(tenuchoisi.contenu))
                    TriggerEvent('skinchanger:getSkin', function(skin)
                    TriggerServerEvent('esx_skin:save', skin)
                    end)
                  end)
            elseif Index == 2 then
              local newname = gettxt2("Choisir un nom pour la tenue ", "", 15)
              TriggerServerEvent('Vetement:clothe_rename', newname, tenuchoisi.id)
                RageUI.GoBack()
                ESX.TriggerServerCallback('Vetement:clothe_load', function(tenue)
                  Vetement.dressing.liste = tenue
                end)
          elseif Index == 3 then
            TriggerServerEvent('Vetement:clothe_del_tenue', tenuchoisi.id)
            RageUI.GoBack()
              ESX.TriggerServerCallback('Vetement:clothe_load', function(tenue)
                dressing.liste = tenue
              end)
            end
        end
    })





end
      end)

      RageUI.IsVisible(eregister, function()

        RageUI.Separator("↓ ~h~~o~Eregister Votre tenue~s~ ↓")

          
	 RageUI.Button("Non" , nil, { Color = { BackgroundColor = { 183, 28, 28, 160 } } }, true, {
            onSelected = function()
                ESX.TriggerServerCallback('</eDen:GetPrice', function(priceee)
                    if priceee then 
                    TriggerServerEvent("Vetement:Buy")
                    RageUI.CloseAll()
                else
                      ESX.ShowNotification("~r~Tu n'a pas assez d'argent")
                  end
                  end, 75)
              end
            })

            RageUI.Button("Oui" , nil, { Color = { BackgroundColor = { 0, 140, 0, 160 } } }, true, {
                onSelected = function()
                ESX.TriggerServerCallback('</eDen:GetPrice', function(priceee)
                    if priceee then 
                        TriggerServerEvent("Vetement:Buy")
                        Wait(180)
                        local nom = gettxt2("Choisir un nom pour la tenue ", "", 15)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                        TriggerServerEvent('Vetement:clothe_save', nom, skin)
                        ESX.ShowNotification("~g~Tenue enregistrée !")
                        RageUI.CloseAll()
                    end)
                else
                    ESX.ShowNotification("~r~Tu n'a pas assez d'argent")
                end
                end, 75)
            end
          })




  end)


          RageUI.IsVisible(tshirt,function()

          RageUI.SliderProgress('List des Tshirt : '..SliderProgressTshirt..'', SliderProgressTshirt, 289, false, {
            ProgressBackgroundColor = { R = 255, G = 255, B = 255, A = 255 },
            ProgressColor = { R = 3, G = 169, B = 96, A = 244 },
        }, true, {
            onSliderChange = function(Index)
                SliderProgressTshirt = Index
                TriggerEvent("skinchanger:change", "tshirt_1", SliderProgressTshirt)
            end
        })


          RageUI.SliderProgress('Variations Couleur : '..Vetement.SliderPannelTshirt.Index..'', Vetement.SliderPannelTshirt.Index, 289, false, {
            ProgressBackgroundColor = { R = 255, G = 255, B = 255, A = 255 },
            ProgressColor = { R = 3, G = 169, B = 96, A = 244 },
        }, true, {
            onSliderChange = function(Index)
              Vetement.SliderPannelTshirt.Index = Index
              TriggerEvent("skinchanger:change", "tshirt_2", Vetement.SliderPannelTshirt.Index)
            end
        })
            
  
          end)
        

            RageUI.IsVisible(torse,function()

          RageUI.SliderProgress('List des Torse : '..SliderProgressTorse..'', SliderProgressTorse, 289, false, {
            ProgressBackgroundColor = { R = 255, G = 255, B = 255, A = 255 },
            ProgressColor = { R = 3, G = 169, B = 96, A = 244 },
        }, true, {
            onSliderChange = function(Index)
                SliderProgressTorse = Index
                TriggerEvent("skinchanger:change", "torso_1", SliderProgressTorse)
            end
        })

          RageUI.SliderProgress('Variations Couleur : '..Vetement.SliderPannelTorso.Index..'', Vetement.SliderPannelTorso.Index, 289, false, {
            ProgressBackgroundColor = { R = 255, G = 255, B = 255, A = 255 },
            ProgressColor = { R = 3, G = 169, B = 96, A = 244 },
        }, true, {
            onSliderChange = function(Index)
              Vetement.SliderPannelTorso.Index = Index
              TriggerEvent("skinchanger:change", "torso_2", Vetement.SliderPannelTorso.Index)
            end
        })




          end)

          RageUI.IsVisible(pantalon,function()

            RageUI.SliderProgress('List des Patanlon : '..SliderProgressPatanlon..'', SliderProgressPatanlon, 114, false, {
              ProgressBackgroundColor = { R = 255, G = 255, B = 255, A = 255 },
              ProgressColor = { R = 3, G = 169, B = 96, A = 244 },
          }, true, {
              onSliderChange = function(Index)
                SliderProgressPatanlon = Index
                  TriggerEvent("skinchanger:change", "pants_1", SliderProgressPatanlon)
              end
          })
          

          RageUI.SliderProgress('Variations Couleur : '..Vetement.SliderPannelPatanlon.Index..'', Vetement.SliderPannelPatanlon.Index, 289, false, {
            ProgressBackgroundColor = { R = 255, G = 255, B = 255, A = 255 },
            ProgressColor = { R = 3, G = 169, B = 96, A = 244 },
        }, true, {
            onSliderChange = function(Index)
              Vetement.SliderPannelPatanlon.Index = Index
              TriggerEvent("skinchanger:change", "pants_2", Vetement.SliderPannelPatanlon.Index)
            end
        })
  

          end)

          RageUI.IsVisible(chaussure,function()
          RageUI.SliderProgress('List des Chaussure : '..SliderProgressChaussure..'', SliderProgressChaussure, 90, false, {
            ProgressBackgroundColor = { R = 255, G = 255, B = 255, A = 255 },
            ProgressColor = { R = 3, G = 169, B = 96, A = 244 },
          }, true, {
              onSliderChange = function(Index)
                SliderProgressChaussure = Index
                  TriggerEvent("skinchanger:change", "shoes_1", SliderProgressChaussure)
                end
          })
  

          RageUI.SliderProgress('Variations Couleur : '..Vetement.SliderPannelChaussure.Index..'', Vetement.SliderPannelChaussure.Index, 289, false, {
            ProgressBackgroundColor = { R = 255, G = 255, B = 255, A = 255 },
            ProgressColor = { R = 3, G = 169, B = 96, A = 244 },
        }, true, {
            onSliderChange = function(Index)
              Vetement.SliderPannelChaussure.Index = Index
              TriggerEvent("skinchanger:change", "shoes_2", Vetement.SliderPannelChaussure.Index)
            end
        })

          end)


          RageUI.IsVisible(bras,function()

            RageUI.SliderProgress('List des Bras : '..SliderProgressBras..'', SliderProgressBras, 90, false, {
              ProgressBackgroundColor = { R = 255, G = 255, B = 255, A = 255 },
              ProgressColor = { R = 3, G = 169, B = 96, A = 244 },
          }, true, {
              onSliderChange = function(Index)
                SliderProgressBras = Index
                  TriggerEvent("skinchanger:change", "arms", SliderProgressBras)
              end
          })
  
          end)

          RageUI.IsVisible(chapeau,function()

            RageUI.SliderProgress('List des Chapeau : '..SliderProgressChapeau..'', SliderProgressChapeau, 90, false, {
              ProgressBackgroundColor = { R = 255, G = 255, B = 255, A = 255 },
              ProgressColor = { R = 3, G = 169, B = 96, A = 244 },
          }, true, {
              onSliderChange = function(Index)
                SliderProgressChapeau = Index
                  TriggerEvent("skinchanger:change", "helmet_1", SliderProgressChapeau)
              end
          })

          RageUI.SliderProgress('Variations Couleur : '..Vetement.SliderPannelChapeau.Index..'', Vetement.SliderPannelChapeau.Index, 289, false, {
            ProgressBackgroundColor = { R = 255, G = 255, B = 255, A = 255 },
            ProgressColor = { R = 3, G = 169, B = 96, A = 244 },
        }, true, {
            onSliderChange = function(Index)
              Vetement.SliderPannelChapeau.Index = Index
              TriggerEvent("skinchanger:change", "helmet_2", Vetement.SliderPannelChapeau.Index)
            end
        })

          end)

          RageUI.IsVisible(chaine,function()

            RageUI.SliderProgress('List des Chaine : '..SliderProgressChaine..'', SliderProgressChaine, 50, false, {
              ProgressBackgroundColor = { R = 255, G = 255, B = 255, A = 255 },
              ProgressColor = { R = 3, G = 169, B = 96, A = 244 },
          }, true, {
              onSliderChange = function(Index)
                SliderProgressChaine = Index
                  TriggerEvent("skinchanger:change", "chain_1", SliderProgressChaine)
              end
          })

          RageUI.SliderProgress('Variations Couleur : '..Vetement.SliderPannelChaine.Index..'', Vetement.SliderPannelChaine.Index, 289, false, {
            ProgressBackgroundColor = { R = 255, G = 255, B = 255, A = 255 },
            ProgressColor = { R = 3, G = 169, B = 96, A = 244 },
        }, true, {
            onSliderChange = function(Index)
              Vetement.SliderPannelChaine.Index = Index
              TriggerEvent("skinchanger:change", "chain_2", Vetement.SliderPannelChaine.Index)
            end
        })
          end)

          RageUI.IsVisible(lunette,function()

            RageUI.SliderProgress('List des Lunette : '..SliderProgressLunette..'', SliderProgressLunette, 26, false, {
              ProgressBackgroundColor = { R = 255, G = 255, B = 255, A = 255 },
              ProgressColor = { R = 3, G = 169, B = 96, A = 244 },
          }, true, {
              onSliderChange = function(Index)
                SliderProgressLunette = Index
                  TriggerEvent("skinchanger:change", "glasses_1", SliderProgressLunette)
              end
          })

          RageUI.SliderProgress('Variations Couleur : '..Vetement.SliderPannelLunette.Index..'', Vetement.SliderPannelLunette.Index, 289, false, {
            ProgressBackgroundColor = { R = 255, G = 255, B = 255, A = 255 },
            ProgressColor = { R = 3, G = 169, B = 96, A = 244 },
        }, true, {
            onSliderChange = function(Index)
              Vetement.SliderPannelLunette.Index = Index
              TriggerEvent("skinchanger:change", "glasses_2", Vetement.SliderPannelLunette.Index)
            end
        })

            end)
            RageUI.IsVisible(sac,function()

              RageUI.SliderProgress('List des Sac : '..SliderProgressSac..'', SliderProgressSac, 50, false, {
                ProgressBackgroundColor = { R = 255, G = 255, B = 255, A = 255 },
                ProgressColor = { R = 3, G = 169, B = 96, A = 244 },
            }, true, {
                onSliderChange = function(Index)
                  SliderProgressSac = Index
                    TriggerEvent("skinchanger:change", "bags_1", SliderProgressSac)
                end
            })
            
            RageUI.SliderProgress('Variations Couleur : '..Vetement.SliderPannelSac.Index..'', Vetement.SliderPannelSac.Index, 289, false, {
            ProgressBackgroundColor = { R = 255, G = 255, B = 255, A = 255 },
            ProgressColor = { R = 3, G = 169, B = 96, A = 244 },
        }, true, {
            onSliderChange = function(Index)
              Vetement.SliderPannelSac.Index = Index
              TriggerEvent("skinchanger:change", "bags_2", Vetement.SliderPannelSac.Index)
            end
        })




          end)
        Wait(0)
      end
    end)
  end
end      

