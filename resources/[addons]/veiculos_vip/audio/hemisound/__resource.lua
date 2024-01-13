resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

files {
	'audioconfig/hemisound_game.dat151.rel',
	'audioconfig/hemisound_sounds.dat54.rel',
	'sfx/dlc_hemisound/hemisound.awc',
	'sfx/dlc_hemisound/hemisound_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audioconfig/hemisound_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/hemisound_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_hemisound'

client_script {
    'vehicle_names.lua'
}