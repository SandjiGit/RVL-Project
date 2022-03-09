resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'


client_scripts {
	'Emotes/NativeUI.lua',
	'Emotes/Config.lua',
	'Emotes/Client/*.lua'
}

server_scripts {
	'Emotes/Config.lua',
	'Emotes/Server/*.lua'
}

server_script {
    '@async/async.lua',
    '@mysql-async/lib/MySQL.lua',
    '@es_extended/server/shared/common.lua',
}



