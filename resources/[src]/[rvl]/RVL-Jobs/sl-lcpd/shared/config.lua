ConfigWebhookRendezVousPolice = "https://discord.com/api/webhooks/884483438206406716/u0gsQAI2OfgVT51lPMPDoZB5VkFusrhzubX9sUjkgjLL62Cmc8UE4839VUMOCzkOOsRx" -- Metez le webhook de votre salon disocrd configure pour le job ems 


Config = {

     MarkerType = 22, -- Pour voir les différents type de marker: https://docs.fivem.net/docs/game-references/markers/
     MarkerSizeLargeur = 0.7, -- Largeur du marker
     MarkerSizeEpaisseur = 0.6, -- Épaisseur du marker
     MarkerSizeHauteur = 0.6, -- Hauteur du marker
     MarkerDistance = 10.0, -- Distane de visibiliter du marker (1.0 = 1 mètre)
     MarkerColorR = 69, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
     MarkerColorG = 112, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
     MarkerColorB = 246, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
     MarkerOpacite = 180, -- Opacité du marker (min: 0, max: 255)
     MarkerSaute = true, -- Si le marker saute (true = oui, false = non)
     MarkerTourne = true, -- Si le marker tourne (true = oui, false = non)

     TextCoffre = "Appuyez sur ~b~[E] ~s~pour accèder au ~b~coffre ~s~!",  -- Text Menu coffre
     TextVestaire = "Appuyez sur ~b~[E] ~s~pour pour accèder au ~b~vestaire ~s~!", -- Text Menu Vestaire
     TextBoss = "Appuyez sur ~b~[E] ~s~pour pour accèder au ~b~action patron ~s~!",  -- Text Menu Boss
     TextGarageVehicule = "Appuyez sur ~b~[E] ~s~pour accèder au ~b~garage ~s~!",  -- Text Garage Voiture
     TextGarageHeli = "Appuyez sur ~b~[E] ~s~pour accèder au ~b~garage ~s~!",  -- Text Garage Hélico
     TextAccueil = "Appuyez sur ~b~[E] ~s~pour parler a la secrétaire ~s~!",  -- Text Ascenseur
	

 VehiculesPolice = { 
 	{buttoname = "4x4 K-9 Police departement", rightlabel = "→→", spawnname = "police6", spawnzone = vector3(437.0840, -986.215, 25.69), headingspawn = 270.174}, -- Garage Voiture
 	{buttoname = "Dodge Chargeur", rightlabel = "→→", spawnname = "police2", spawnzone = vector3(437.47036, -988.77545, 25.69), headingspawn = 272.6509}, -- Garage Voiture
 	{buttoname = "4x4 Cruiser", rightlabel = "→→", spawnname = "police3", spawnzone = vector3(437.4174, -991.760498, 25.69), headingspawn = 268.764}, -- Garage Voiture
     {buttoname = "Maserati - VIR", rightlabel = "→→", spawnname = "ghispo2", spawnzone = vector3(437.3968, -994.3691, 25.6999), headingspawn = 271.0013}, -- Garage Voiture
     {buttoname = "Porsche - VIR", rightlabel = "→→", spawnname = "police3", spawnzone = vector3(437.2534, -997.0614, 25.6999), headingspawn = 266.504}, -- Garage Voiture
 },

HelicoPolice = { 
 	{buttonameheli = "Hélicoptère", rightlabel = "→→", spawnnameheli = "supervolito", spawnzoneheli = vector3(449.1641, -981.3759, 43.6913), headingspawnheli = 93.3062}, -- Garage Hélico
 },

 amende = {
    ["amende "] = {
        {label = 'Usage abusif du klaxon', price = 1500},
        {label = 'Franchir une ligne continue', price = 1500},
        {label = 'Circulation à contresens', price = 1500},
        {label = 'Demi-tour non autorisé', price = 1500},
        {label = 'Circulation hors-route', price = 1500},
        {label = 'Non-respect des distances de sécurité', price = 1500},
        {label = 'Arrêt dangereux / interdit', price = 1500},
        {label = 'Stationnement gênant / interdit', price = 1500},
        {label = 'Non respect  de la priorité à droite', price = 1500},
        {label = 'Non-respect à un véhicule prioritaire', price = 1500},
        {label = 'Non-respect d\'un stop', price = 1500},
        {label = 'Non-respect d\'un feu rouge', price = 1500},
        {label = 'Dépassement dangereux', price = 1500},
        {label = 'Véhicule non en état', price = 1500},
        {label = 'Conduite sans permis', price = 1500},
        {label = 'Délit de fuite', price = 1500},
        {label = 'Excès de vitesse < 5 kmh', price = 1500},
        {label = 'Excès de vitesse 5-15 kmh', price = 1500},
        {label = 'Excès de vitesse 15-30 kmh', price = 1500},
        {label = 'Excès de vitesse > 30 kmh', price = 1500},
        {label = 'Entrave de la circulation', price = 1500},
        {label = 'Dégradation de la voie publique', price = 1500},
        {label = 'Trouble à l\'ordre publique', price = 1500},
        {label = 'Entrave opération de police', price = 1500},
        {label = 'Insulte envers / entre civils', price = 1500},
        {label = 'Outrage à agent de police', price = 1500},
        {label = 'Menace verbale ou intimidation envers civil', price = 1500},
        {label = 'Menace verbale ou intimidation envers policier', price = 1500},
        {label = 'Manifestation illégale', price = 1500},
        {label = 'Tentative de corruption', price = 1500},
        {label = 'Arme blanche sortie en ville', price = 1500},
        {label = 'Arme léthale sortie en ville', price = 1500},
        {label = 'Port d\'arme non autorisé (défaut de license)', price = 1500},
        {label = 'Port d\'arme illégal', price = 1500},
        {label = 'Pris en flag lockpick', price = 1500},
        {label = 'Vol de voiture', price = 1500},
        {label = 'Vente de drogue', price = 1500},
        {label = 'Fabriquation de drogue', price = 1500},
        {label = 'Possession de drogue', price = 1500},
        {label = 'Prise d\'ôtage civil', price = 1500},
        {label = 'Prise d\'ôtage agent de l\'état', price = 1500},
        {label = 'Braquage particulier', price = 1500},
        {label = 'Braquage magasin', price = 1500},
        {label = 'Braquage de banque', price = 1500},
        {label = 'Tir sur civil', price = 1500},
        {label = 'Tir sur agent de l\'état', price = 1500},
        {label = 'Tentative de meurtre sur civil', price = 1500},
        {label = 'Tentative de meurtre sur agent de l\'état', price = 1500},
        {label = 'Meurtre sur civil', price = 1500},
        {label = 'Meurte sur agent de l\'état', price = 1500}, 
        {label = 'Escroquerie à l\'entreprise', price = 1500},
    }
},

PoliceCloak = {
    clothes = {
        specials = {
                [0] = {
                    label = "Reprendre sa tenue : ~y~Civile",
                    minimum_grade = 0,
                    variations = {male = {}, female = {}},
                    onEquip = function()
                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin) TriggerEvent('skinchanger:loadSkin', skin) end)
                        SetPedArmour(PlayerPedId(), 0)
                    end
                },
                [1] = {
                    minimum_grade = 0,
                    label = "S'équiper de la tenue : ~b~Cadet",
                    variations = {
                    male = {
                       ['tshirt_1'] = 41,  ['tshirt_2'] = 0,
                       ['torso_1'] = 185,   ['torso_2'] = 0,
                       ['decals_1'] = 0,   ['decals_2'] = 0,
                       ['arms'] = 0,
                       ['pants_1'] = 34,   ['pants_2'] = 0,
                       ['shoes_1'] = 45,   ['shoes_2'] = 0,
                       ['helmet_1'] = -1,  ['helmet_2'] = 0,
                       ['chain_1'] = 0,    ['chain_2'] = 0,
                       ['ears_1'] = -1,     ['ears_2'] = 0,
                   },
                   female = {
                       ['bags_1'] = 0, ['bags_2'] = 0,
                           ['tshirt_1'] = 32,['tshirt_2'] = 0,
                           ['torso_1'] = 143, ['torso_2'] = 0,
                           ['arms'] = 14, ['arms_2'] = 0,
                           ['pants_1'] = 28, ['pants_2'] = 0,
                           ['shoes_1'] = 37, ['shoes_2'] = 0,
                           ['mask_1'] = 0, ['mask_2'] = 0,
                           ['bproof_1'] = 0,
                           ['chain_1'] = 0,
                           ['helmet_1'] = 26, ['helmet_2'] = 0,
					       ['mask_1'] = 0,  ['mask_2'] = 0,
                    }
                },
                onEquip = function()  
                end
                }
            },
            grades = {
                [2] = {
                    label = "S'équiper de la tenue : ~b~Officier",
                    minimum_grade = 1,
                    variations = {
                    male = {
                       ['tshirt_1'] = 55,  ['tshirt_2'] = 0,
                       ['torso_1'] = 85,   ['torso_2'] = 13,
                       ['decals_1'] = 0,   ['decals_2'] = 0,
                       ['arms'] = 14,
                       ['pants_1'] = 34,   ['pants_2'] = 0,
                       ['shoes_1'] = 45,   ['shoes_2'] = 0,
                       ['helmet_1'] = -1,  ['helmet_2'] = 0,
                       ['chain_1'] = 0,    ['chain_2'] = 0,
                       ['mask_1'] = -1,  ['mask_2'] = 0,
                       ['bproof_1'] = 0,  ['bproof_2'] = 4,
                       ['ears_1'] = -1,     ['ears_2'] = 0,
                    },
                    female = {
                       ['tshirt_1'] = 53,  ['tshirt_2'] = 0,
                       ['torso_1'] = 102,   ['torso_2'] = 0,
                       ['decals_1'] = 0,   ['decals_2'] = 0,
                       ['arms'] = 0,
                       ['pants_1'] = 59,   ['pants_2'] = 0,
                       ['shoes_1'] = 25,   ['shoes_2'] = 0,
                       ['helmet_1'] = -1,  ['helmet_2'] = 0,
                       ['chain_1'] = 0,    ['chain_2'] = 0,
                       ['mask_1'] = -1,  ['mask_2'] = 0,
                       ['bproof_1'] = 7,  ['bproof_2'] = 4,
                       ['ears_1'] = 2,     ['ears_2'] = 0,
                    }
                },
                onEquip = function()
                end
            },
                [3] = {
                    minimum_grade = 2,
                    label = "S'équiper de la tenue : ~b~Sergent",
                    variations = {
                    male = {
                       ['tshirt_1'] = 54,  ['tshirt_2'] = 1,
                       ['torso_1'] = 85,   ['torso_2'] = 14,
                       ['decals_1'] = 0,   ['decals_2'] = 0,
                       ['arms'] = 14,
                       ['pants_1'] = 34,   ['pants_2'] = 0,
                       ['shoes_1'] = 45,   ['shoes_2'] = 0,
                       ['helmet_1'] = -1,  ['helmet_2'] = 0,
                       ['chain_1'] = 0,    ['chain_2'] = 0,
                       ['mask_1'] = -1,  ['mask_2'] = 0,
                       ['bproof_1'] = 0,  ['bproof_2'] = 4,
                       ['ears_1'] = 1,     ['ears_2'] = 0,
                    },
                    female = {
                       ['tshirt_1'] = 53,  ['tshirt_2'] = 0,
                       ['torso_1'] = 93,   ['torso_2'] = 1,
                       ['decals_1'] = 0,   ['decals_2'] = 0,
                       ['arms'] = 0,
                       ['pants_1'] = 59,   ['pants_2'] = 0,
                       ['shoes_1'] = 25,   ['shoes_2'] = 0,
                       ['helmet_1'] = -1,  ['helmet_2'] = 0,
                       ['chain_1'] = 0,    ['chain_2'] = 0,
                       ['mask_1'] = -1,  ['mask_2'] = 0,
                       ['bproof_1'] = 0,  ['bproof_2'] = 0,
                       ['ears_1'] = 2,     ['ears_2'] = 0,
                   }
               },
                onEquip = function()
                end
            },
            [4] = {
               minimum_grade = 3,
               label = "S'équiper de la tenue : ~b~Lieutenant",
               variations = {
               male = {
                   ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                   ['torso_1'] = 50,   ['torso_2'] = 0,
                   ['decals_1'] = 0,   ['decals_2'] = 0,
                   ['arms'] = 41,
                   ['pants_1'] = 40,   ['pants_2'] = 1,
                   ['shoes_1'] = 25,   ['shoes_2'] = 0,
                   ['helmet_1'] = 75,  ['helmet_2'] = 0,
                   ['mask_1'] = 52,  ['mask_2'] = 0,
                   ['chain_1'] = 0,    ['chain_2'] = 0,
                   ['bproof_1'] = 7,  ['bproof_2'] = 0,
               },
               female = {
                   ['tshirt_1'] = 53,  ['tshirt_2'] = 0,
                           ['torso_1'] = 93,   ['torso_2'] = 1,
                           ['decals_1'] = 0,   ['decals_2'] = 0,
                           ['arms'] = 0,
                           ['pants_1'] = 59,   ['pants_2'] = 0,
                           ['shoes_1'] = 25,   ['shoes_2'] = 0,
                           ['helmet_1'] = -1,  ['helmet_2'] = 0,
                           ['chain_1'] = 0,    ['chain_2'] = 0,
                           ['mask_1'] = -1,  ['mask_2'] = 0,
                           ['bproof_1'] = 0,  ['bproof_2'] = 0,
                           ['ears_1'] = 2,     ['ears_2'] = 0,
              }
          },
           onEquip = function()
           end
       }
},
        [1] = {
           minimum_grade = 4,
           label = "Tenue Commandant",
           variations = {
           male = {
               tshirt_1 = 58,  tshirt_2 = 0,
               torso_1 = 55,   torso_2 = 0,
               decals_1 = 8,   decals_2 = 3,
               arms = 41,
               pants_1 = 25,   pants_2 = 0,
               shoes_1 = 25,   shoes_2 = 0,
               helmet_1 = -1,  helmet_2 = 0,
               chain_1 = 0,    chain_2 = 0,
               ears_1 = 2,     ears_2 = 0
           },
           female = {
               tshirt_1 = 35,  tshirt_2 = 0,
               torso_1 = 48,   torso_2 = 0,
               decals_1 = 7,   decals_2 = 3,
               arms = 44,
               pants_1 = 34,   pants_2 = 0,
               shoes_1 = 27,   shoes_2 = 0,
               helmet_1 = -1,  helmet_2 = 0,
               chain_1 = 0,    chain_2 = 0,
               ears_1 = 2,     ears_2 = 0
          }
      },
       onEquip = function()
       end
      },
    }
},


Position = {
 	    Boss = {vector3(-1112.75, -834.83, 30.76)}, -- Menu boss
 	    Coffre = {vector3(-1089.03, -821.0, 11.04)}, -- Menu coffre
        Vestaire = {vector3(-1097.89, -831.21, 14.28)}, -- Menu Vestaire
        Accueil = {vector3(-1098.9, -840.82, 19.0)}, -- Menu Pour Accueil
        GarageVehicule = {vector3(-1077.3, -846.53, 4.88)}, -- Menu Garage Vehicule
 	    GarageHeli = {vector3(449.17761, -981.4251, 43.6913)}, -- Menu Garage Helico
    }
}

