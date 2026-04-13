extends RefCounted
## Contains the data of the settings menu that gets saved & loaded
class_name SettingsData

var master_volume : float = 0.0
var music_volume : float = 0.0
var sfx_volume : float = 0.0

var screen_shake_value : bool = true
var frame_freeze_value : bool = true
var crt_effect_value : bool = false:
	set(value):
		crt_effect_value = value
		ScreenFx.update_crt(crt_effect_value)

var resolution_index : int = 0
