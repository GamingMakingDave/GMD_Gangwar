fx_version 'adamant'
game 'gta5'

author 'GMD_Scripts'
name 'GMD_Gangwar'
version '1.0.0'
description ''

server_script {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua'
}

client_scripts {
	'client/*.lua'
}

shared_scripts {
	'config.lua'
}

dependencies {

}