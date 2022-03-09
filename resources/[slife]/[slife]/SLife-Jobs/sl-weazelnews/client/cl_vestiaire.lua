Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
    end
    if ESX.IsPlayerLoaded() then

		ESX.PlayerData = ESX.GetPlayerData()

    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

-- Tenue Journaliste --

function vcivil()

  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
  
  TriggerEvent('skinchanger:loadSkin', skin)
  
  end)
  
  end


function journaliste()

  local model = GetEntityModel(GetPlayerPed(-1))

  TriggerEvent('skinchanger:getSkin', function(skin)

      if model == GetHashKey("mp_m_freemode_01") then

          clothesSkin = {

            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 111,   ['torso_2'] = 1,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 4,
            ['pants_1'] = 13,   ['pants_2'] = 0,
            ['shoes_1'] = 57,   ['shoes_2'] = 10,
            ['chain_1'] = 0,  ['chain_2'] = 0

          }

      else

          clothesSkin = {

            ['tshirt_1'] = 14,   ['tshirt_2'] = 0,
            ['torso_1'] = 27,    ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 0,
            ['pants_1'] = 0,   ['pants_2'] = 8,
            ['shoes_1'] = 3,    ['shoes_2'] = 2,
            ['chain_1'] = 2,    ['chain_2'] = 1

          }

      end

      TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

  end)

end

function journaliste2()

  local model = GetEntityModel(GetPlayerPed(-1))

  TriggerEvent('skinchanger:getSkin', function(skin)

      if model == GetHashKey("mp_m_freemode_01") then

          clothesSkin = {

            ['tshirt_1'] = 6,  ['tshirt_2'] = 1,
            ['torso_1'] = 25,   ['torso_2'] = 3,
            ['decals_1'] = 8,   ['decals_2'] = 0,
            ['arms'] = 11,
            ['pants_1'] = 13,   ['pants_2'] = 0,
            ['shoes_1'] = 51,   ['shoes_2'] = 1,
            ['chain_1'] = 24,  ['chain_2'] = 5

          }

      else

          clothesSkin = {

            ['glasses_1'] = 5,	['glasses_2'] = 0,
            ['tshirt_1'] = 24,   ['tshirt_2'] = 0,
            ['torso_1'] = 28,   ['torso_2'] = 4,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 0,
            ['pants_1'] = 6,   ['pants_2'] = 0,
            ['shoes_1'] = 13,   ['shoes_2'] = 0,
            ['chain_1'] = 0,   ['chain_2'] = 0

          }

      end

      TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

  end)

end

function journaliste3()

  local model = GetEntityModel(GetPlayerPed(-1))

  TriggerEvent('skinchanger:getSkin', function(skin)

      if model == GetHashKey("mp_m_freemode_01") then

          clothesSkin = {

            ['tshirt_1'] = 33,  ['tshirt_2'] = 0,
            ['torso_1'] = 77,   ['torso_2'] = 1,
            ['decals_1'] = 8,   ['decals_2'] = 0,
            ['arms'] = 11,
            ['pants_1'] = 13,   ['pants_2'] = 0,
            ['shoes_1'] = 51,   ['shoes_2'] = 1,
            ['chain_1'] = 27,  ['chain_2'] = 5

          }

      else

          clothesSkin = {

            ['glasses_1'] = 5,	['glasses_2'] = 0,
            ['tshirt_1'] = 40,   ['tshirt_2'] = 7,
            ['torso_1'] = 64,   ['torso_2'] = 1,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 0,
            ['pants_1'] = 6,   ['pants_2'] = 0,
            ['shoes_1'] = 13,   ['shoes_2'] = 0,
            ['chain_1'] = 0,   ['chain_2'] = 0

          }

      end

      TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

  end)

end

function journaliste4()

  local model = GetEntityModel(GetPlayerPed(-1))

  TriggerEvent('skinchanger:getSkin', function(skin)

      if model == GetHashKey("mp_m_freemode_01") then

          clothesSkin = {

            ['tshirt_1'] = 33,  ['tshirt_2'] = 0,
            ['torso_1'] = 31,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 4,
            ['pants_1'] = 10,   ['pants_2'] = 0,
            ['shoes_1'] = 10,   ['shoes_2'] = 0,
            ['chain_1'] = 27,  ['chain_2'] = 5

          }

      else

          clothesSkin = {

            ['glasses_1'] = 5,	['glasses_2'] = 0,
            ['tshirt_1'] = 20,   ['tshirt_2'] = 2,
            ['torso_1'] = 24,   ['torso_2'] = 3,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 5,
            ['pants_1'] = 6,   ['pants_2'] = 0,
            ['shoes_1'] = 13,   ['shoes_2'] = 0,
            ['chain_1'] = 0,   ['chain_2'] = 0

          }

      end

      TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

  end)

end

-- MENU FUNCTION --

local open = false 
local mainMenu6 = RageUI.CreateMenu('~r~Vestaire', '~r~Ouverture du cassier..')
mainMenu6.Display.Header = true 
mainMenu6.Closed = function()
  open = false
end

function OpenVestiaire()
     if open then 
         open = false
         RageUI.Visible(mainMenu6, false)
         return
     else
         open = true 
         RageUI.Visible(mainMenu6, true)
         CreateThread(function()
         while open do 
            RageUI.IsVisible(mainMenu6,function() 

              RageUI.Separator("↓ ~y~   Vestiaire  ~s~↓")

              RageUI.Button("Mettre sa tenue : ~r~Civile", nil, {RightLabel = "→→"}, true , {
                onSelected = function()
                    vcivil()
                  end
                })	

                RageUI.Button("Mettre sa tenue : ~g~Journaliste", nil, {RightLabel = "→→"}, true , {
                  onSelected = function()
                    journaliste()
                    end
                  })	

                  RageUI.Button("Mettre sa tenue : ~g~Reporterre", nil, {RightLabel = "→→"}, true , {
                    onSelected = function()
                      journaliste2()
                      end
                    })	

                    RageUI.Button("Mettre sa tenue : ~g~Reporterre 2", nil, {RightLabel = "→→"}, true , {
                      onSelected = function()
                        journaliste3()
                        end
                      })	

                      RageUI.Button("Mettre sa tenue : ~g~Rendez-Vous", nil, {RightLabel = "→→"}, true , {
                        onSelected = function()
                          journaliste4()
                          end
                        })	
            
            end)
          Wait(0)
         end
      end)
   end
end

----OUVRIR LE MENU------------

local position = {
	{x = -589.08, y = -937.58, z = 23.82}
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'journaliste' then 
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 5.0 then
            wait = 0
            DrawMarker(22, -589.08, -937.58, 23.82, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 183, 28, 28, 255, true, true, p19, true)  

        
            if dist <= 1.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour intéragir avec les ~r~vestiaire", 1) 
                if IsControlJustPressed(1,51) then
                  OpenVestiaire()
            end
        end
    end
    end
    Citizen.Wait(wait)
    end
end
end)


