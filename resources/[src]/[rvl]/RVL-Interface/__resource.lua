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


loadscreen 'LoadScreen/html/index.html'
ui_page 'Hud/html/ui.html'

files {
	-- Load Index Page
	'LoadScreen/html/index.html',
	-- Load Bootstrap & Custom Styles
	'LoadScreen/html/css/bootstrap.min.css',
	'LoadScreen/html/css/custom.css',
	'LoadScreen/html/css/morphext.css',
	-- Load jQuery, Bootstrap and JavaScript 
	'LoadScreen/html/js/jquery.min.js',
	'LoadScreen/html/js/bootstrap.min.js',
	'LoadScreen/html/js/popper.min.js',
	'LoadScreen/html/js/app.js',
	'LoadScreen/html/js/morphext.min.js',
	-- Load Image Resources
	'LoadScreen/html/img/logo.png',
	'LoadScreen/html/img/back.png',
	-- Load Audio Source
	'LoadScreen/html/song.mp3'
}


files {
    'Hud/html/ui.html',
    'Hud/html/script.js',
    'Hud/html/style.css',
    'Hud/html/loading-bar.js',
}


client_scripts {
    'Hud/client.lua',
    'Hud/config.lua'
}



