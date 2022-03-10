---------------- Vetements ----------------------

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
		Menu = "Magasin de Vêtement",
	},
 
	Vetement = {
		{pos = vector3( 72.254,    -1399.102, 28.376)},
		{pos = vector3( -703.776,   -152.258,  36.415)},
		{pos = vector3( -167.863,   -298.969,  38.733)},
		{pos = vector3( 428.694,    -800.106,  28.491)},
		{pos = vector3( -829.413,   -1073.710, 10.328)},
		{pos = vector3( -1447.797,  -242.461,  48.820)},
		{pos = vector3( 11.632,     6514.224,  30.877)},
		{pos = vector3( 123.646,    -219.440,  53.557)},
		{pos = vector3( 1696.291,   4829.312,  41.063)},
		{pos = vector3( 618.093,    2759.629,  41.088)},
		{pos = vector3( 1190.550,   2713.441,  37.222)},
		{pos = vector3( -1193.429,  -772.262,  16.324)},
		{pos = vector3( -3172.496,  1048.133,  19.863)},
		{pos = vector3( -1108.441,  2708.923,  18.107)},
	},
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