fx_version 'cerulean'
game 'gta5'

name 'Flux Notify'
author 'Flux Solutions'
description 'Modern notification system with glowing effects and smooth animations'
version '1.0.0'
url 'https://fluxscripts.dev'

lua54 'yes'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}

shared_script 'config.lua'
client_script 'client.lua'