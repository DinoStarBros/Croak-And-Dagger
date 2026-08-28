extends CanvasLayer

func _ready() -> void:
	if !(SaveLoad.SaveFileData.crt_effect_value_changed.is_connected(update_crt)):
		SaveLoad.SaveFileData.crt_effect_value_changed.connect(update_crt)
	update_crt()

func _process(delta: float) -> void:
	print(
		SaveLoad.SaveFileData.crt_effect_value_changed.is_connected(update_crt)
		)

func update_crt() -> void:
	%crt.visible = SaveLoad.SaveFileData.crt_effect_value

#func update_crt(value: bool) -> void:
	#%crt.visible = value
