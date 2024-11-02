fx_version 'adamant'
game 'gta5'

author 'Saaytex'
description 'bulletproof script'
version '1.0.0'

server_script '@oxmysql/lib/MySQL.lua'

client_scripts {
  '@es_extended/locale.lua',
  'client/client.lua'
}

server_scripts {
  '@es_extended/locale.lua',
  'server/server.lua'
}

shared_scripts {
  '@es_extended/imports.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html'
}