fx_version 'cerulean'
games { 'gta5' };

client_scripts {
    "RageUI/RMenu.lua",
    "RageUI/menu/RageUI.lua",
    "RageUI/menu/Menu.lua",
    "RageUI/menu/MenuController.lua",
    "RageUI/components/*.lua",
    "RageUI/menu/elements/*.lua",
    "RageUI/menu/items/*.lua",
    "RageUI/menu/panels/*.lua",
    "RageUI/menu/windows/*.lua",

}

client_scripts {
    '@es_extended/locale.lua',
    'client/cl_menu.lua',
    'client/cl_garage.lua',
    'client/cl_boss.lua',
    'client/cl_vestiaire.lua',
    'client/cl_coffre.lua',
}

server_script {
    'server/server.lua',
}