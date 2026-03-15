extends CanvasLayer

@onready var settings_menu: Settings = %settingsMenu

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("esc"):
		get_tree().paused = not get_tree().paused
		if get_tree().paused:
			# Pause
			settings_menu.on_pause()
		else:
			# Resume
			settings_menu.on_resume()

func _process(delta: float) -> void:
	visible = get_tree().paused
