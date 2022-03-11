fx_version 'adamant'
games { 'gta5' };


------------- Config

client_scripts {
	'Config.lua'
}

server_scripts {
	'Config.lua'
}

----------------------

----------------------------------------------------------

-- Ressource: Identity

server_scripts {
    '@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
    'Identity/sv_clippy.lua',
}

client_scripts {
    '@es_extended/locale.lua',
    "Identity/pmenu.lua",
    "Identity/cl_charcreator.lua",
}
files {
    'Identity/html/ui.html',
    'Identity/html/img/image.png',
    'Identity/html/css/app.css',
    'Identity/html/scripts/app.js'
}

ui_page 'Identity/html/ui.html'


----------------------------------------------------------

-- Ressource: Menu Personnel

client_scripts {
    "RageUI//RMenu.lua",
    "RageUI//menu/RageUI.lua",
    "RageUI//menu/Menu.lua",
    "RageUI//menu/MenuController.lua",
    "RageUI//components/*.lua",
    "RageUI//menu/elements/*.lua",
    "RageUI//menu/items/*.lua",
    "RageUI//menu/panels/*.lua",
    "RageUI//menu/windows/*.lua",
}

client_scripts {
    'MenuPersonnel/menu.lua',
    'MenuPersonnel/divers.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'MenuPersonnel/server.lua',
}

----------------------------------------------------------

-- Ressource: Others

client_scripts {
    'Others/divers.lua',
    'Others/change_seat.lua',
    'Others/coffre.lua',
}

----------------------------------------------------------

-- Ressource: Admin

client_scripts {
    'Admin/config.lua',
    'Admin/client/client.lua'
}

server_scripts {
    'Admin/config.lua',
    'Admin/server/server.lua'
}

----------------------------------------------------------
-- Ressource: Keys


shared_scripts {
    "Vehicles/Keys/shared/config.lua",
}

client_scripts{
    "Vehicles/Keys/client/*.lua",
}

server_scripts{
    "Vehicles/Keys/server/*.lua",
}

----------------------------------------------------------
-- Ressource: Shops Vetements

client_scripts {
    "Shops/Vetements/client/*.lua",

}

server_scripts {
    "Shops/Vetements/server/*.lua",
}

shared_scripts {
    "Shops/Vetements/shared/shared.lua"
}

----------------------------------------------------------
-- Ressource: Bank

client_scripts {
    "Society/Bank/client/menu.lua",
    "Society/Bank/client/coffre.lua",
    "Society/Bank/client/accueil.lua",
    "Society/Bank/client/patron.lua",
    "Society/Bank/client/garage.lua",
    "Society/Bank/client/bank.lua",
}

server_script {
    "Society/Bank/server/server.lua",
}