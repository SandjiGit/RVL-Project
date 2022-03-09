fx_version 'adamant'

game 'gta5'

shared_scripts {
    "config.lua",
    "config2.lua",
}

client_scripts {
    "config.lua",
    "config2.lua",
}

server_scripts {
    "config.lua",
    "config2.lua",
}
----------------------------------------------------------

-- Api: RageUI

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

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "log.lua",

}

----------------------------------------------------------

-- Dépendances: ES Extended

client_scripts {
    '@es_extended/locale.lua',
}


server_script {
    '@es_extended/locale.lua',
}

----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------


-- Job: Tacos
-- Source:

client_scripts {
    'sl-tacos/client/client/cl_boss.lua',
    'sl-tacos/client/client/cl_coffre.lua',
    'sl-tacos/client/client/cl_cuisine.lua',
    'sl-tacos/client/client/cl_garage.lua',
    'sl-tacos/client/client/cl_menu.lua',
    'sl-tacos/client/client/cl_shops.lua',
    'sl-tacos/client/client/cl_boisson.lua',
    'sl-tacos/client/farms/cl_farms.lua',
    'sl-tacos/client/farms/cl_ventes.lua'
}

server_script {
    'sl-tacos/server/server.lua',
}

----------------------------------------------------------

-- Job: Taxi
-- Source:

client_scripts {
    'sl-taxi/client/cl_menu.lua',
    'sl-taxi/client/cl_garage.lua',
    'sl-taxi/client/cl_boss.lua',
    'sl-taxi/client/cl_coffre.lua',
}

server_script {
    'sl-taxi/server/server.lua',
}

----------------------------------------------------------

-- Job: Gouvernement
-- Source:

client_scripts {
    "sl-gouvernement/client/*.lua",
}

server_scripts {
    "sl-gouvernement/server/*.lua",
}

----------------------------------------------------------

-- Job: SL Immo
-- Source:

client_scripts {
    'sl-immo/client/cl_menu.lua',
    'sl-immo/client/cl_garage.lua',
    'sl-immo/client/cl_boss.lua',
    'sl-immo/client/cl_coffre.lua',
}

server_script {
    'sl-immo/server/server.lua',
}

----------------------------------------------------------

-- Job: Lcpd
-- Source:

client_scripts {
    "sl-lcpd/client/*.lua",

}

server_scripts {
    "sl-lcpd/server/*.lua",
}

----------------------------------------------------------

-- Addon: Props Lcpd
-- Source:

client_scripts {
    'sl-lcpd-props/client.lua',
    'sl-lcpd-props/function.lua',
}

----------------------------------------------------------

-- Jobs: LCHD
-- Source:

client_scripts {
    'locales/fr.lua',
    'sl-lchd/client/cl_appel.lua',
    'sl-lchd/client/cl_boss.lua',
    'sl-lchd/client/cl_coffre.lua',
    'sl-lchd/client/cl_event.lua',
    'sl-lchd/client/cl_garage.lua',
    'sl-lchd/client/cl_menu.lua',
    'sl-lchd/client/cl_pharmaci.lua',
    'sl-lchd/client/cl_vestiaire.lua',
    'sl-lchd/client/cl_ascenseur.lua',
    'sl-lchd/client/cl_accueil.lua',
}

server_script {
    'locales/fr.lua',
    'sl-lchd/server/server.lua',
}



-- (Dépendance:)


client_scripts {
    "@es_extended/locale.lua",

}

server_scripts {
    "@es_extended/locale.lua",
}

dependencies {
	'es_extended'
}