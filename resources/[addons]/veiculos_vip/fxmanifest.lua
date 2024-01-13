shared_script "@ThnAC/natives.lua"
shared_script "@vrp/lib/lib.lua" --Para remover esta pendencia de todos scripts, execute no console o comando "uninstall"

 fx_version 'adamant'
game 'gta5'

files {
	"data/**/*",
	"data/**",
	"data/*",
	"data/**/handling.meta",
	"data/**/vehiclelayouts.meta",
	"data/**/vehicles.meta",
	"data/**/carcols.meta",
	"data/**/carvariations.meta",
	"audio/*",
	"audio/**/*",
}

client_script "tuning.lua"

-- METAS
data_file "HANDLING_FILE" "data/**/handling.meta"
data_file "VEHICLE_LAYOUTS_FILE" "data/**/vehiclelayouts.meta"
data_file "VEHICLE_METADATA_FILE" "data/**/vehicles.meta"
data_file "CARCOLS_FILE" "data/**/carcols.meta"
data_file "VEHICLE_VARIATION_FILE" "data/**/carvariations.meta"

              


files {
	'audio/r34new/audioconfig/r34sound_game.dat151.rel',
	'audio/r34new/audioconfig/r34sound_sounds.dat54.rel',
	'audio/r34new/sfx/dlc_r34sound/r34sound.awc',
	'audio/r34new/sfx/dlc_r34sound/r34sound_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audio/r34new/audioconfig/r34sound_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/r34new/audioconfig/r34sound_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'audio/r34new/sfx/dlc_r34sound'



files {
	'audio/r35sound/audioconfig/r35sound_game.dat151.rel',
	'audio/r35sound/audioconfig/r35sound_sounds.dat54.rel',
	'audio/r35sound/sfx/dlc_r35sound/r35sound.awc',
	'audio/r35sound/sfx/dlc_r35sound/r35sound_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audio/r35sound/audioconfig/r35sound_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/r35sound/audioconfig/r35sound_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'audio/r35sound/sfx/dlc_r35sound'



files {
	'audio/s15sound/audioconfig/s15sound_game.dat151.rel',
	'audio/s15sound/audioconfig/s15sound_sounds.dat54.rel',
	'audio/s15sound/sfx/dlc_s15sound/s15sound.awc',
	'audio/s15sound/sfx/dlc_s15sound/s15sound_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audio/s15sound/audioconfig/s15sound_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/s15sound/audioconfig/s15sound_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'audio/s15sound/sfx/dlc_s15sound'

files {
		'audio/ta013vq35/audioconfig/ta013vq35_game.dat151.rel',
		'audio/ta013vq35/audioconfig/ta013vq35_sounds.dat54.rel',
		'audio/ta013vq35/sfx/dlc_ta013vq35/ta013vq35.awc',
		'audio/ta013vq35/sfx/dlc_ta013vq35/ta013vq35_npc.awc'
  }
  
  data_file 'AUDIO_GAMEDATA' 'audio/ta013vq35/audioconfig/ta013vq35_game.dat'
  data_file 'AUDIO_SOUNDDATA' 'audio/ta013vq35/audioconfig/ta013vq35_sounds.dat'
  data_file 'AUDIO_WAVEPACK' 'audio/ta013vq35/sfx/dlc_ta013vq35'

  files {
		'audio/ta4b11/audioconfig/ta4b11_game.dat151.rel',
		'audio/ta4b11/audioconfig/ta4b11_sounds.dat54.rel',
		'audio/ta4b11/sfx/dlc_ta4b11/ta4b11.awc',
		'audio/ta4b11/sfx/dlc_ta4b11/ta4b11_npc.awc'
  }
  
  data_file 'AUDIO_GAMEDATA' 'audio/ta4b11/audioconfig/ta4b11_game.dat'
  data_file 'AUDIO_SOUNDDATA' 'audio/ta4b11/audioconfig/ta4b11_sounds.dat'
  data_file 'AUDIO_WAVEPACK' 'audio/ta4b11/sfx/dlc_ta4b11'


  files {
		'audio/lamborghini52v10/audioconfig/lamborghini52v10_game.dat151.rel',
		'audio/lamborghini52v10/audioconfig/lamborghini52v10_sounds.dat54.rel',
		'audio/lamborghini52v10/sfx/dlc_lamborghini52v10/lamborghini52v10.awc',
		'audio/lamborghini52v10/sfx/dlc_lamborghini52v10/lamborghini52v10_npc.awc'
  }
  
  data_file 'AUDIO_GAMEDATA' 'audio/lamborghini52v10/audioconfig/lamborghini52v10_game.dat'
  data_file 'AUDIO_SOUNDDATA' 'audio/lamborghini52v10/audioconfig/lamborghini52v10_sounds.dat'
  data_file 'AUDIO_WAVEPACK' 'audio/lamborghini52v10/sfx/dlc_lamborghini52v10'

  files {
		'audio/ferrarif140fe/audioconfig/ferrarif140fe_game.dat151.rel',
		'audio/ferrarif140fe/audioconfig/ferrarif140fe_sounds.dat54.rel',
		'audio/ferrarif140fe/sfx/dlc_ferrarif140fe/ferrarif140fe.awc',
		'audio/ferrarif140fe/sfx/dlc_ferrarif140fe/ferrarif140fe_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audio/ferrarif140fe/audioconfig/ferrarif140fe_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/ferrarif140fe/audioconfig/ferrarif140fe_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'audio/ferrarif140fe/sfx/dlc_ferrarif140fe'

files {
		'audio/audicrdb/audioconfig/audicrdb_game.dat151.rel',
		'audio/audicrdb/audioconfig/audicrdb_sounds.dat54.rel',
		'audio/audicrdb/sfx/dlc_audicrdb/audicrdb.awc',
		'audio/audicrdb/sfx/dlc_audicrdb/audicrdb_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audio/audicrdb/audioconfig/audicrdb_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/audicrdb/audioconfig/audicrdb_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'audio/audicrdb/sfx/dlc_audicrdb'

files {
		'audio/subaruej20/audioconfig/subaruej20_game.dat151.rel',
		'audio/subaruej20/audioconfig/subaruej20_sounds.dat54.rel',
		'audio/subaruej20/sfx/dlc_subaruej20/subaruej20.awc',
		'audio/subaruej20/sfx/dlc_subaruej20/subaruej20_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audio/subaruej20/audioconfig/subaruej20_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/subaruej20/audioconfig/subaruej20_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'audio/subaruej20/sfx/dlc_subaruej20'

files {
		'audio/audiea839/audioconfig/audiea839_game.dat151.rel',
		'audio/audiea839/audioconfig/audiea839_sounds.dat54.rel',
		'audio/audiea839/sfx/dlc_audiea839/audiea839.awc',
		'audio/audiea839/sfx/dlc_audiea839/audiea839_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audio/audiea839/audioconfig/audiea839_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/audiea839/audioconfig/audiea839_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'audio/audiea839/sfx/dlc_audiea839'

files {
		'audio/ta019b58/audioconfig/ta019b58_game.dat151.rel',
		'audio/ta019b58/audioconfig/ta019b58_sounds.dat54.rel',
		'audio/ta019b58/sfx/dlc_ta019b58/ta019b58.awc',
		'audio/ta019b58/sfx/dlc_ta019b58/ta019b58_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audio/ta019b58/audioconfig/ta019b58_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/ta019b58/audioconfig/ta019b58_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'audio/ta019b58/sfx/dlc_ta019b58'

files {
		'audio/ta022s54/audioconfig/ta022s54_game.dat151.rel',
		'audio/ta022s54/audioconfig/ta022s54_sounds.dat54.rel',
		'audio/ta022s54/sfx/dlc_ta022s54/ta022s54.awc',
		'audio/ta022s54/sfx/dlc_ta022s54/ta022s54_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audio/ta022s54/audioconfig/ta022s54_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/ta022s54/audioconfig/ta022s54_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'audio/ta022s54/sfx/dlc_ta022s54'

files {
	'audio/ta006bmws65/audioconfig/ta006bmws65_game.dat151.rel',
	'audio/ta006bmws65/audioconfig/ta006bmws65_sounds.dat54.rel',
	'audio/ta006bmws65/sfx/dlc_ta006bmws65/ta006bmws65.awc',
	'audio/ta006bmws65/sfx/dlc_ta006bmws65/ta006bmws65_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audio/ta006bmws65/audioconfig/ta006bmws65_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/ta006bmws65/audioconfig/ta006bmws65_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'audio/ta006bmws65/sfx/dlc_ta006bmws65'

files {
		'audio/hemisound/audioconfig/hemisound_game.dat151.rel',
		'audio/hemisound/audioconfig/hemisound_sounds.dat54.rel',
		'audio/hemisound/sfx/dlc_hemisound/hemisound.awc',
		'audio/hemisound/sfx/dlc_hemisound/hemisound_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audio/hemisound/audioconfig/hemisound_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/hemisound/audioconfig/hemisound_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'audio/hemisound/sfx/dlc_hemisound'

files {
		'audio/ta011mit4g63/audioconfig/ta011mit4g63_game.dat151.rel',
		'audio/ta011mit4g63/audioconfig/ta011mit4g63_sounds.dat54.rel',
		'audio/ta011mit4g63/sfx/dlc_ta011mit4g63/ta011mit4g63.awc',
		'audio/ta011mit4g63/sfx/dlc_ta011mit4g63/ta011mit4g63_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audio/ta011mit4g63/audioconfig/ta011mit4g63_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/ta011mit4g63/audioconfig/ta011mit4g63_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'audio/ta011mit4g63/sfx/dlc_ta011mit4g63'

files {
		'audio/ta023l539/audioconfig/ta023l539_game.dat151.rel',
		'audio/ta023l539/audioconfig/ta023l539_sounds.dat54.rel',
		'audio/ta023l539/sfx/dlc_ta023l539/ta023l539.awc',
		'audio/ta023l539/sfx/dlc_ta023l539/ta023l539_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audio/ta023l539/audioconfig/ta023l539_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/ta023l539/audioconfig/ta023l539_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'audio/ta023l539/sfx/dlc_ta023l539'

files {
		'audio/ta488f154/audioconfig/ta488f154_game.dat151.rel',
		'audio/ta488f154/audioconfig/ta488f154_sounds.dat54.rel',
		'audio/ta488f154/sfx/dlc_ta488f154/ta488f154.awc',
		'audio/ta488f154/sfx/dlc_ta488f154/ta488f154_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audio/ta488f154/audioconfig/ta488f154_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/ta488f154/audioconfig/ta488f154_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'audio/ta488f154/sfx/dlc_ta488f154'

files {
		'audio/tagt3flat6/audioconfig/tagt3flat6_game.dat151.rel',
		'audio/tagt3flat6/audioconfig/tagt3flat6_sounds.dat54.rel',
		'audio/tagt3flat6/sfx/dlc_tagt3flat6/tagt3flat6.awc',
		'audio/tagt3flat6/sfx/dlc_tagt3flat6/tagt3flat6_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audio/tagt3flat6/audioconfig/tagt3flat6_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/tagt3flat6/audioconfig/tagt3flat6_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'audio/tagt3flat6/sfx/dlc_tagt3flat6'

files {
		'audio/gallardov10/audioconfig/gallardov10_game.dat151.rel',
		'audio/gallardov10/audioconfig/gallardov10_sounds.dat54.rel',
		'audio/gallardov10/sfx/dlc_gallardov10/gallardov10.awc',
		'audio/gallardov10/sfx/dlc_gallardov10/gallardov10_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audio/gallardov10/audioconfig/gallardov10_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/gallardov10/audioconfig/gallardov10_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'audio/gallardov10/sfx/dlc_gallardov10'

files {
		'audio/chevroletlt4/audioconfig/chevroletlt4_game.dat151.rel',
		'audio/chevroletlt4/audioconfig/chevroletlt4_sounds.dat54.rel',
		'audio/chevroletlt4/sfx/dlc_chevroletlt4/chevroletlt4.awc',
		'audio/chevroletlt4/sfx/dlc_chevroletlt4/chevroletlt4_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audio/chevroletlt4/audioconfig/chevroletlt4_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/chevroletlt4/audioconfig/chevroletlt4_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'audio/chevroletlt4/sfx/dlc_chevroletlt4'

files {
		'audio/ta028viper/audioconfig/ta028viper_game.dat151.rel',
		'audio/ta028viper/audioconfig/ta028viper_sounds.dat54.rel',
		'audio/ta028viper/sfx/dlc_ta028viper/ta028viper.awc',
		'audio/ta028viper/sfx/dlc_ta028viper/ta028viper_npc.awc'
	}

data_file 'AUDIO_GAMEDATA' 'audio/ta028viper/audioconfig/ta028viper_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/ta028viper/audioconfig/ta028viper_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'audio/ta028viper/sfx/dlc_ta028viper'

files {
		'audio/hondaf20c/audioconfig/hondaf20c_game.dat151.rel',
		'audio/hondaf20c/audioconfig/hondaf20c_sounds.dat54.rel',
		'audio/hondaf20c/sfx/dlc_hondaf20c/hondaf20c.awc',
		'audio/hondaf20c/sfx/dlc_hondaf20c/hondaf20c_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audio/hondaf20c/audioconfig/hondaf20c_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/hondaf20c/audioconfig/hondaf20c_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'audio/hondaf20c/sfx/dlc_hondaf20c'

files {
		'audio/rb26dett/audioconfig/rb26dett_game.dat151.rel',
		'audio/rb26dett/audioconfig/rb26dett_sounds.dat54.rel',
		'audio/rb26dett/sfx/dlc_rb26dett/rb26dett.awc',
		'audio/rb26dett/sfx/dlc_rb26dett/rb26dett_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audio/rb26dett/audioconfig/rb26dett_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/rb26dett/audioconfig/rb26dett_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'audio/rb26dett/sfx/dlc_rb26dett'

files {
	'audio/s63b44/audioconfig/s63b44_game.dat151.rel',
	'audio/s63b44/audioconfig/s63b44_sounds.dat54.rel',
	'audio/s63b44/sfx/dlc_s63b44/s63b44.awc',
	'audio/s63b44/sfx/dlc_s63b44/s63b44_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audio/s63b44/audioconfig/s63b44_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/s63b44/audioconfig/s63b44_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'audio/s63b44/sfx/dlc_s63b44'

files {
		'audio/aq2jzgterace/audioconfig/aq2jzgterace_game.dat151.rel',
		'audio/aq2jzgterace/audioconfig/aq2jzgterace_sounds.dat54.rel',
		'audio/aq2jzgterace/sfx/dlc_aq2jzgterace/aq2jzgterace.awc',
		'audio/aq2jzgterace/sfx/dlc_aq2jzgterace/aq2jzgterace_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audio/aq2jzgterace/audioconfig/aq2jzgterace_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/aq2jzgterace/audioconfig/aq2jzgterace_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'audio/aq2jzgterace/sfx/dlc_aq2jzgterace'

files {
		'audio/ea888/audioconfig/ea888_game.dat151.rel',
		'audio/ea888/audioconfig/ea888_sounds.dat54.rel',
		'audio/ea888/sfx/dlc_ea888/ea888.awc',
		'audio/ea888/sfx/dlc_ea888/ea888_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audio/ea888/audioconfig/ea888_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/ea888/audioconfig/ea888_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'audio/ea888/sfx/dlc_ea888'

files {
		'audio/a80ffeng/audioconfig/a80ffeng_game.dat151.rel',
		'audio/a80ffeng/audioconfig/a80ffeng_sounds.dat54.rel',
		'audio/a80ffeng/sfx/dlc_a80ffeng/a80ffeng.awc',
		'audio/a80ffeng/sfx/dlc_a80ffeng/a80ffeng_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audio/a80ffeng/audioconfig/a80ffeng_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/a80ffeng/audioconfig/a80ffeng_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'audio/a80ffeng/sfx/dlc_a80ffeng'

files {
		'audio/rotary7/audioconfig/rotary7_game.dat151.rel',
		'audio/rotary7/audiovconfig/rotary7_sounds.dat54.rel',
		'audio/rotary7/sfx/dlc_rotary7/rotary7.awc',
		'audio/rotary7/sfx/dlc_rotary7/rotary7_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audio/rotary7/audioconfig/rotary7_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/rotary7/audioconfig/rotary7_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'audio/rotary7/sfx/dlc_rotary7'

files {
		'audio/mercm177/audioconfig/mercm177_game.dat151.rel',
		'audio/mercm177/audioconfig/mercm177_sounds.dat54.rel',
		'audio/mercm177/sfx/dlc_mercm177/mercm177.awc',
		'audio/mercm177/sfx/dlc_mercm177/mercm177_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audio/mercm177/audioconfig/mercm177_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/mercm177/audioconfig/mercm177_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'audio/mercm177/sfx/dlc_mercm177'       

files {
	'audio/rb28dett/audioconfig/rb28dett_game.dat151.rel',
	'audio/rb28dett/audioconfig/rb28dett_sounds.dat54.rel',
	'audio/rb28dett/sfx/dlc_rb28dett/rb28dett.awc',
	'audio/rb28dett/sfx/dlc_rb28dett/rb28dett_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audio/rb28dett/audioconfig/rb28dett_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/rb28dett/audioconfig/rb28dett_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'audio/rb28dett/sfx/dlc_rb28dett' 

files {
	'audio/bmws1krreng/audioconfig/bmws1krreng_game.dat151.rel',
	'audio/bmws1krreng/audioconfig/bmws1krreng_sounds.dat54.rel',
	'audio/bmws1krreng/sfx/dlc_bmws1krreng/bmws1krreng.awc',
	'audio/bmws1krreng/sfx/dlc_bmws1krreng/bmws1krreng_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audio/bmws1krreng/audioconfig/bmws1krreng_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/bmws1krreng/audioconfig/bmws1krreng_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'audio/bmws1krreng/sfx/dlc_bmws1krreng' 

files {
	'audio/suzukigsxr1k/audioconfig/suzukigsxr1k_game.dat151.rel',
	'audio/suzukigsxr1k/audioconfig/suzukigsxr1k_sounds.dat54.rel',
	'audio/suzukigsxr1k/sfx/dlc_suzukigsxr1k/suzukigsxr1k.awc',
	'audio/suzukigsxr1k/sfx/dlc_suzukigsxr1k/suzukigsxr1k_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audio/suzukigsxr1k/audioconfig/suzukigsxr1k_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/suzukigsxr1k/audioconfig/suzukigsxr1k_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'audio/suzukigsxr1k/sfx/dlc_suzukigsxr1k' 