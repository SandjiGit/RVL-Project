--- LCHD 

local second = 1000
local minute = 60 * second

EarlyRespawnTimer          = 8 * minute  -- Temp de mort si les ambulancier sont pas venu

ConfigWebhookRendezVousAmbulance = "TONWEBHOOK" -- Metez le webhook de votre salon disocrd configure pour le job ems 



-- Gouvernement Config :


Config = {

    MarkerType = 22, -- Pour voir les différents type de marker: https://docs.fivem.net/docs/game-references/markers/
    MarkerSizeLargeur = 0.3, -- Largeur du marker
    MarkerSizeEpaisseur = 0.3, -- Épaisseur du marker
    MarkerSizeHauteur = 0.3, -- Hauteur du marker
    MarkerDistance = 1.3, -- Distane de visibiliter du marker (1.0 = 1 mètre)
    MarkerColorR = 69, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerColorG = 112, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerColorB = 246, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerOpacite = 180, -- Opacité du marker (min: 0, max: 255)
    MarkerSaute = true, -- Si le marker saute (true = oui, false = non)
    MarkerTourne = true, -- Si le marker tourne (true = oui, false = non)

    NomDesMenu = {
        cl_menu = "Gouvernement",
        cl_garage = "Garage Gouvernement",
        cl_boss = "Boss Gouvernement",
        cl_coffre = "Coffre Gouvernement",
    },

    VehiculesBanchisseur = { 
        {buttoname = "Voiture Gouv", rightlabel = "→→", spawnname = "stretch", spawnzone = vector3(-520.4052, -265.7148, 35.33), headingspawn = 110.532}, -- Garage Voiture
        {buttoname = "Baller", rightlabel = "→→", spawnname = "baller6", spawnzone = vector3(-520.4052, -265.7148, 35.33), headingspawn = 110.532}, -- Garage Voiture
        {buttoname = "Dubsta", rightlabel = "→→", spawnname = "dubsta2", spawnzone = vector3(-520.4052, -265.7148, 35.33), headingspawn = 110.532}, -- Garage Voiture
    },   

    
    Boss = {
        {pos = vector3(-546.73553, -202.9565, 47.41)},
    },
    Coffre = {
        {pos = vector3(-534.8607, -192.2799, 47.42)},
    },
    Garage = {
        {pos = vector3(-521.7024, -264.3309, 35.32)},
    },
    Ranger = {
        {pos = vector3(-520.4052, -265.7148, 35.33)},
    },
    Vestiaire = {
        {pos = vector3(-541.4768, -192.7113, 47.42)},
    },

    serviceWeapons = {
        {Label = "Lampe de poche", Name = "weapon_nightstick"},    
        {Label = "Matraque", Name = "weapon_stungun"},
        {Label = "Taser", Name = "weapon_flashlight"},
    },

    Gouvernement = {
        clothes = {
                grades = {
                    [0] = {
                        label = "S'équiper de la tenue : ~b~Sécurité ",
                        minimum_grade = 0,
                        variations = {
                        male = {
                           ['tshirt_1'] = 187,  ['tshirt_2'] = 0,
                           ['torso_1'] = 13,   ['torso_2'] = 0,
                           ['decals_1'] = 0,   ['decals_2'] = 0,
                           ['arms'] = 11,
                           ['pants_1'] = 34,   ['pants_2'] = 0,
                           ['shoes_1'] = 10,   ['shoes_2'] = 0,
                           ['helmet_1'] = -1,  ['helmet_2'] = 0,
                           ['chain_1'] = 120,    ['chain_2'] = 0,
                           ['mask_1'] = 0,  ['mask_2'] = 0,
                           ['bproof_1'] = 0,  ['bproof_2'] = 0,
                           ['ears_1'] = 2,     ['ears_2'] = 0,
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
                    [1] = {
                        minimum_grade = 1,
                        label = "S'équiper de la tenue : ~b~Président",
                        variations = {
                        male = {
                           ['tshirt_1'] = 13,  ['tshirt_2'] = 0,
                           ['torso_1'] = 4,   ['torso_2'] = 0,
                           ['decals_1'] = 0,   ['decals_2'] = 0,
                           ['arms'] = 1,
                           ['pants_1'] = 13,   ['pants_2'] = 0,
                           ['shoes_1'] = 10,   ['shoes_2'] = 0,
                           ['helmet_1'] = -1,  ['helmet_2'] = 0,
                           ['chain_1'] = 100,    ['chain_2'] = 0,
                           ['mask_1'] = 0,  ['mask_2'] = 0,
                           ['bproof_1'] = 0,  ['bproof_2'] = 0,
                           ['ears_1'] = 2,     ['ears_2'] = 0,
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

    },
        }
    },

                                            -------------------- Police -------------------------


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
    {buttoname = "Declasse Trafic (Cadet)", rightlabel = "→→", spawnname = "lcpd2", spawnzone = vector3(420.22381591796, 656.24499511718, 14.763904571534), headingspawn = 251.27963256836}, -- Garage Voiture 
 	{buttoname = "Vapid Cruiser (Officier)", rightlabel = "→→", spawnname = "lcpd5", spawnzone = vector3(420.22381591796, 656.24499511718, 14.763904571534), headingspawn = 251.27963256836}, -- Garage Voiture
 	{buttoname = "Vapid Cruiser S (Sergent)", rightlabel = "→→", spawnname = "lcpd3", spawnzone = vector3(420.22381591796, 656.24499511718, 14.763904571534), headingspawn = 251.27963256836}, -- Garage Voiture
 	{buttoname = "Dodge Charger", rightlabel = "→→", spawnname = "lcpd4", spawnzone = vector3(420.22381591796, 656.24499511718, 14.763904571534), headingspawn = 251.27963256836}, -- Garage Voiture
 },

HelicoPolice = { 
 	{buttonameheli = "Hélicoptère", rightlabel = "→→", spawnnameheli = "supervolito", spawnzoneheli = vector3(330.70364379882, 665.04779052734, 65.260704040528), headingspawnheli = 4.5076794624328}, -- Garage Hélico
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
 	    Boss = {vector3(336.16641235352, 658.17999267578, 14.764762878418)}, -- Menu boss
 	    Coffre = {vector3(336.88604736328, 657.78302001954, 18.2906665802)}, -- Menu coffre
        Vestaire = {vector3(338.36697387696, 675.78161621094, 9.8082361221314)}, -- Menu Vestaire
        Accueil = {vector3(306.30563354492, 680.32067871094, 14.762902259826)}, -- Menu Pour Accueil
        GarageVehicule = {vector3(401.39715576172, 658.02630615234, 14.772290229798)}, -- Menu Garage Vehicule
 	    GarageHeli = {vector3(330.52673339844, 664.85559082032, 65.260704040528)}, -- Menu Garage Helico
    }
    



    --------------------------------------- LCHD Config -----------------------------------------

    
}

---------------- Personel Menu ----------------------

local Keys = {
	['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57, 
	['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177, 
	['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
	['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
	['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
	['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70, 
	['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
	['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
	['NENTER'] = 201, ['N4'] = 108, ['N5'] = 60, ['N6'] = 107, ['N+'] = 96, ['N-'] = 97, ['N7'] = 117, ['N8'] = 61, ['N9'] = 118
}

Config.nomduserveur = "SLife"
Config.DoubleJob = true

Config.Controls = {
	HandsUP = {keyboard = Keys['~']},
	Pointing = {keyboard = Keys['B']},
	Crouch = {keyboard = Keys['LEFTCTRL']},
	StopTasks = {keyboard = Keys['X']},
}

------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- Text Config: