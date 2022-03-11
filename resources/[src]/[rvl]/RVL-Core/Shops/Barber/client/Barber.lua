eDBarber = {
    GetESX = "esx:getSharedObject",
    NameMenu = "Baber Shop", 
    Barber = {
        Price = 80,
        Position = {
            {pos = vector3(-814.3, -183.8, 37.0)},
            {pos = vector3(136.8, -1708.4, 29.0)},
            {pos = vector3(-1282.6, -1116.8, 6.70)},
            {pos = vector3(1931.5, 3729.7, 32.4)},
            {pos = vector3(1212.8, -472.9, 65.8)},
            {pos = vector3(-32.9, -152.3, 56.8)},
            {pos = vector3(-278.1, 6228.5, 31.3)},    
        },
        Liste = {
            CheveuxIndex = 1,
            CheveuxListe = {"Aucun","Rasé","Faux faucon","Plaqué en arrière","Brossé","Brossé 2","Motard","Queue de cheval","Tresse","Bouclé","Court Brosser","Cheveux Herisses","Plaqué en avant","Bieber","Dread","Cheveux longs","Long bouclé","Mec Surfer","Sur le coté","Brossé 3","Long Slicked","Hipster Youth","Mullet","Lunettes thermique","Dread Motif","Dread Motif 2","Dread Motif 3","Dread Motif 4","Dread Motif 5","Dread Motif 6","Cheveux en hauteur","Cheveux en long","Cheveux en long rasé","Cheveux en long rasé","Piquée","Étalée","Moine"},
            BarberIndex = 1,
            BarbeListe = {"Aucun","Arc","Bouc enrobée","Bouc libre","Bouc","Bouc long","Rasé de près","Rasée de haut","Russe","Chapeau","Pas rasé","Chapeau rasé","Chinoise","Année 50","Mafieux long","Mafieux court","Yakouza","Année 80","Longue","Chapeau incurver","Chapeau incurver long","Pablo","Jefe","Washington","Algérien","Anglais","Français","Vieux","Moine"},
            SourcilIndex = 1,
            SourcilsListe = {"Aucun", "Sourcils n°1","Sourcils n°2","Sourcils n°3","Sourcils n°4","Sourcils n°5","Sourcils n°6","Sourcils n°7","Sourcils n°8","Sourcils n°9","Sourcils n°10","Sourcils n°11","Sourcils n°12","Sourcils n°13","Sourcils n°14","Sourcils n°15","Sourcils n°16","Sourcils n°17","Sourcils n°18","Sourcils n°19","Sourcils n°20","Sourcils n°21","Sourcils n°22","Sourcils n°23","Sourcils n°24","Sourcils n°25","Sourcils n°26","Sourcils n°27","Sourcils n°28","Sourcils n°29","Sourcils n°30","Sourcils n°31","Sourcils n°32","Sourcils n°33","Sourcils n°34"};
            LentillesIndex = 1,
            LentillesListe = {"Aucun", "Lentilles n°1","Lentilles n°2","Lentilles n°3","Lentilles n°4","Lentilles n°5","Lentilles n°6","Lentilles n°7","Lentilles n°8","Lentilles n°9","Lentilles n°10","Lentilles n°11","Lentilles n°12","Lentilles n°13","Lentilles n°14","Lentilles n°15","Lentilles n°16","Lentilles n°17","Lentilles n°18","Lentilles n°19","Lentilles n°20","Lentilles n°21","Lentilles n°22","Lentilles n°23","Lentilles n°24","Lentilles n°25","Lentilles n°26","Lentilles n°27","Lentilles n°28","Lentilles n°29","Lentilles n°30","Lentilles n°31","Lentilles n°32","Lentilles n°33"};
            MakeupIndex = 1,
            RougeLevre = 1,
        },
        CouleurCheveux = {
            Primaire = {1, 5},
            Secondaire = {1, 5}
        },
        CouleurBarbes = {
            OpaPercent = 0,
            Primaire = {1, 1},
        },
        CouleurSourcil = {
            OpaPercent = 0,
            Primaire = {1, 1},
            Secondaire = {1, 1}
        },
        CouleurMakeup = {
            OpaPercent = 0,
        },
        CouleurRougeLevre = {
            OpaPercent = 0,
            Primaire = {1, 1},
            Secondaire = {1, 1}
        },
    },
}


OpenMenuBarber = function()
    local main = RageUI.CreateMenu(("Menu %s"):format(eDBarber.NameMenu), "Shop "..eDBarber.NameMenu);
    main.EnableMouse = true
    main:AddInstructionButton({[1] = GetControlInstructionalButton(0, 44, 0), [2] = "Rotation Droite"})
    main:AddInstructionButton({[1] = GetControlInstructionalButton(0, 51, 0), [2] = "Rotation Gauche"})
    RageUI.Visible(main, not RageUI.Visible(main))
    while main do
        FreezeEntityPosition(PlayerPedId(), true)
        CreateFace()
        Citizen.Wait(0)
        RageUI.IsVisible(main, function()

            RageUI.Separator("↓ ~b~Bienvenue a la boutique ~s~↓")

            RageUI.List("Cheveux",  eDBarber.Barber.Liste.CheveuxListe, eDBarber.Barber.Liste.CheveuxIndex,nil,{},true,{
                onActive = function()
                    OnRenderCam()
                end,
                onListChange = function(Index, Item)
                    eDBarber.Barber.Liste.CheveuxIndex = Index
                    TriggerEvent("skinchanger:change", "hair_1", eDBarber.Barber.Liste.CheveuxIndex)
                end
            })

            RageUI.List("Barbe",eDBarber.Barber.Liste.BarbeListe, eDBarber.Barber.Liste.BarberIndex, nil,{},true,{
                onActive = function()
                    OnRenderCam()
                end,
                onListChange = function(Index, Item)
                    eDBarber.Barber.Liste.BarberIndex = Index
                    TriggerEvent("skinchanger:change", "beard_1", eDBarber.Barber.Liste.BarberIndex)
                end
            })

            RageUI.List("Sourcils",eDBarber.Barber.Liste.SourcilsListe, eDBarber.Barber.Liste.SourcilIndex,nil,{},true,{
                onActive = function()
                    OnRenderCam()
                end,
                onListChange = function(Index, Item)
                    eDBarber.Barber.Liste.SourcilIndex = Index
                    TriggerEvent("skinchanger:change", "eyebrows_1", eDBarber.Barber.Liste.SourcilIndex)
                end
            })

            RageUI.List("Lentilles",eDBarber.Barber.Liste.LentillesListe, eDBarber.Barber.Liste.LentillesIndex,nil,{},true,{
                onActive = function()
                    OnRenderCam()
                end,
                onListChange = function(Index, Item)
                    eDBarber.Barber.Liste.LentillesIndex = Index
                    TriggerEvent("skinchanger:change", "eye_color", eDBarber.Barber.Liste.LentillesIndex)
                end
            })

            RageUI.List("Maquillage ",MaquillageListe, eDBarber.Barber.Liste.MakeupIndex,nil,{},true,{
                onActive = function()
                    OnRenderCam()
                end,
                onListChange = function(Index, Item)
                    eDBarber.Barber.Liste.MakeupIndex = Index
                     TriggerEvent("skinchanger:change", "makeup_1", eDBarber.Barber.Liste.MakeupIndex)
                end
            })

            RageUI.List("Rouge a levre",LipsListe, eDBarber.Barber.Liste.RougeLevre,nil,{},true,{
                onActive = function()
                    OnRenderCam()
                end,
                onListChange = function(Index, Item)
                    eDBarber.Barber.Liste.RougeLevre = Index
                     TriggerEvent("skinchanger:change", "lipstick_1", eDBarber.Barber.Liste.RougeLevre)
                end
            })

            RageUI.Button("Valider et payer : ~g~"..eDBarber.Barber.Price.."$" , false, { Color = { BackgroundColor = { 0, 140, 0, 160 } } }, true, {
                onActive = function()
                    OnRenderCam()
                end,
                onSelected = function()
                    RageUI.CloseAll()
                    TriggerServerEvent("</eDen:Achat", eDBarber.Barber.Price)
                end
            })
       
        end,function()
            RageUI.ColourPanel("Couleur principale", RageUI.PanelColour.HairCut,  eDBarber.Barber.CouleurCheveux.Primaire[1],  eDBarber.Barber.CouleurCheveux.Primaire[2], {
                onColorChange = function(MinimumIndex, CurrentIndex)
                    eDBarber.Barber.CouleurCheveux.Primaire[1] = MinimumIndex
                    eDBarber.Barber.CouleurCheveux.Primaire[2] = CurrentIndex
                    TriggerEvent("skinchanger:change", "hair_color_1",  eDBarber.Barber.CouleurCheveux.Primaire[2])
                end
            }, 2)

            RageUI.ColourPanel("Couleur secondaire", RageUI.PanelColour.HairCut, eDBarber.Barber.CouleurCheveux.Secondaire[1], eDBarber.Barber.CouleurCheveux.Secondaire[2], {
                onColorChange = function(MinimumIndex, CurrentIndex)
                    eDBarber.Barber.CouleurCheveux.Secondaire[1] = MinimumIndex
                    eDBarber.Barber.CouleurCheveux.Secondaire[2] = CurrentIndex
                    TriggerEvent("skinchanger:change", "hair_color_2", eDBarber.Barber.CouleurCheveux.Secondaire[2])
                end
            }, 2)

            RageUI.PercentagePanel(eDBarber.Barber.CouleurBarbes.OpaPercent, 'Opacité', '0%', '100%', {
                onProgressChange = function(Percentage)
                    eDBarber.Barber.CouleurBarbes.OpaPercent = Percentage
                    TriggerEvent('skinchanger:change', 'beard_2',Percentage*10)
                end
            }, 3) 

            RageUI.ColourPanel("Couleur de barbe", RageUI.PanelColour.HairCut, eDBarber.Barber.CouleurBarbes.Primaire[1],  eDBarber.Barber.CouleurBarbes.Primaire[2], {
                onColorChange = function(MinimumIndex, CurrentIndex)
                    eDBarber.Barber.CouleurBarbes.Primaire[1] = MinimumIndex
                    eDBarber.Barber.CouleurBarbes.Primaire[2] = CurrentIndex
                    TriggerEvent("skinchanger:change", "beard_3",  eDBarber.Barber.CouleurBarbes.Primaire[2])
                end
            }, 3)

            RageUI.PercentagePanel(eDBarber.Barber.CouleurSourcil.OpaPercent, 'Opacité', '0%', '100%', {
                onProgressChange = function(Percentage)
                    eDBarber.Barber.CouleurSourcil.OpaPercent = Percentage
                    TriggerEvent('skinchanger:change', 'eyebrows_2',Percentage*10)
                end
            }, 4) 

            RageUI.ColourPanel("Couleur Primaire",RageUI.PanelColour.HairCut,eDBarber.Barber.CouleurSourcil.Primaire[1],eDBarber.Barber.CouleurSourcil.Primaire[2],{
                onColorChange = function(MinimumIndex, CurrentIndex)
                    eDBarber.Barber.CouleurSourcil.Primaire[1] = MinimumIndex
                    eDBarber.Barber.CouleurSourcil.Primaire[2] = CurrentIndex
                    TriggerEvent("skinchanger:change", "eyebrows_3",  eDBarber.Barber.CouleurSourcil.Primaire[2])
                end
            },4)

            RageUI.PercentagePanel(eDBarber.Barber.CouleurMakeup.OpaPercent, 'Opacité', '0%', '100%', {
                onProgressChange = function(Percentage)
                    eDBarber.Barber.CouleurMakeup.OpaPercent = Percentage
                    TriggerEvent('skinchanger:change', 'makeup_2',Percentage*10)
                end
            }, 6) 

            RageUI.PercentagePanel(eDBarber.Barber.CouleurRougeLevre.OpaPercent, 'Opacité', '0%', '100%', {
                onProgressChange = function(Percentage)
                    eDBarber.Barber.CouleurRougeLevre.OpaPercent = Percentage
                    TriggerEvent('skinchanger:change', 'lipstick_2',Percentage*10)
                end
            }, 7) 

            RageUI.ColourPanel("Couleur principale", RageUI.PanelColour.HairCut,  eDBarber.Barber.CouleurRougeLevre.Primaire[1],  eDBarber.Barber.CouleurRougeLevre.Primaire[2], {
                onColorChange = function(MinimumIndex, CurrentIndex)
                    eDBarber.Barber.CouleurRougeLevre.Primaire[1] = MinimumIndex
                    eDBarber.Barber.CouleurRougeLevre.Primaire[2] = CurrentIndex
                    TriggerEvent("skinchanger:change", "lipstick_3",  eDBarber.Barber.CouleurRougeLevre.Primaire[2])
                end
            }, 7)

            RageUI.ColourPanel("Couleur secondaire", RageUI.PanelColour.HairCut, eDBarber.Barber.CouleurRougeLevre.Secondaire[1], eDBarber.Barber.CouleurRougeLevre.Secondaire[2], {
                onColorChange = function(MinimumIndex, CurrentIndex)
                    eDBarber.Barber.CouleurRougeLevre.Secondaire[1] = MinimumIndex
                    eDBarber.Barber.CouleurRougeLevre.Secondaire[2] = CurrentIndex
                    TriggerEvent("skinchanger:change", "lipstick_4", eDBarber.Barber.CouleurRougeLevre.Secondaire[2])
                end
            }, 7)

    end)
        if not RageUI.Visible(main) then main = RMenu:DeleteType('main', true, nosave()) end
    end
end




