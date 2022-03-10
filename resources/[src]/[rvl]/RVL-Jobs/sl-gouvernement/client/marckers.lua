CreateThread(function()
    while true do
        local pCoords = GetEntityCoords(PlayerPedId())
        local spam = false
        if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' then
        for _,v in pairs(Config.Boss) do
            if servicegouv then
            if #(pCoords - v.pos) < Config.MarkerDistance then
                spam = true
                Visual.Subtitle("Appuyer sur [~b~E~s~] pour accéder au ~b~Menu Boss")
                DrawMarker(Config.MarkerType, v.pos, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, Config.MarkerColorR, Config.MarkerColorG, Config.MarkerColorB, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)               
                if IsControlJustReleased(0, 38) then
                    OpenMenuBossGouv()
                end                
            elseif #(pCoords - v.pos) < Config.MarkerDistance then
                spam = false 
                RageUI.CloseAll()
            end
            end
        end
    end
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'gouvernement' then  
    for _,v in pairs(Config.Coffre) do
        if servicegouv then
        if #(pCoords - v.pos) < Config.MarkerDistance then
            spam = true
            Visual.Subtitle("Appuyer sur [~b~E~s~] pour accéder au ~b~Menu Coffre")
            DrawMarker(Config.MarkerType, v.pos,  0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, Config.MarkerColorR, Config.MarkerColorG, Config.MarkerColorB, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)               
            if IsControlJustReleased(0, 38) then
                OpenChestGouv()
            end                
        elseif #(pCoords - v.pos) < Config.MarkerDistance then
            spam = false 
            RageUI.CloseAll()
        end
        end
           end
        end
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'gouvernement' then  
        for _,v in pairs(Config.Garage) do
            if servicegouv then
            if #(pCoords - v.pos) < Config.MarkerDistance then
                spam = true
                Visual.Subtitle("Appuyer sur [~b~E~s~] pour accéder au ~b~Menu Garage")
                DrawMarker(Config.MarkerType, v.pos,  0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, Config.MarkerColorR, Config.MarkerColorG, Config.MarkerColorB, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)               
                if IsControlJustReleased(0, 38) then
                    OpenMenuGarageGouv()
                    local playerPed = GetPlayerPed(-1)
                end                
            elseif #(pCoords - v.pos) < Config.MarkerDistance then
                spam = false 
                RageUI.CloseAll()
            end
            end
               end
            end
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'gouvernement' then  
            for _,v in pairs(Config.Ranger) do
                if servicegouv then
                if #(pCoords - v.pos) < Config.MarkerDistance then
                    spam = true
                    Visual.Subtitle("Appuyer sur [~b~E~s~] pour accéder au ~b~Menu Ranger")
                    DrawMarker(Config.MarkerType, v.pos,  0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, Config.MarkerColorR, Config.MarkerColorG, Config.MarkerColorB, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)               
                    if IsPedSittingInAnyVehicle(PlayerPedId()) then
                    if IsControlJustReleased(0, 38) then
                     DoScreenFadeOut(1500)
                     Wait(1500)
                     local veh,dist4 = ESX.Game.GetClosestVehicle(playerCoords)
                      if dist4 < 4 then
                      DeleteEntity(veh)
                      DoScreenFadeIn(1500)
                     Wait(1500)
                      end
                    end
                    end
                    end                
                elseif #(pCoords - v.pos) < Config.MarkerDistance then
                    spam = false 
                    RageUI.CloseAll()
                end
                   end
                end
             if ESX.PlayerData.job and ESX.PlayerData.job.name == 'gouvernement' then  
            for _,v in pairs(Config.Vestiaire) do
                if servicegouv then
                if #(pCoords - v.pos) < Config.MarkerDistance then
                    spam = true
                    Visual.Subtitle("Appuyer sur [~b~E~s~] pour accéder au ~b~Menu Vestiaire")
                    DrawMarker(Config.MarkerType, v.pos,  0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, Config.MarkerColorR, Config.MarkerColorG, Config.MarkerColorB, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)               
                    if IsControlJustReleased(0, 38) then
                        VestiaireGouv()
                        local playerPed = GetPlayerPed(-1)
                    end                
                elseif #(pCoords - v.pos) < Config.MarkerDistance then
                    spam = false 
                    RageUI.CloseAll()
                end
                end
                   end
                end
        if spam then
            Wait(1)
        else
            Wait(500)
        end
    end
end)
