extends Control
class_name TitleScreen

func _ready() -> void:
	%play.pressed.connect(_play_pressed)
	%settings.pressed.connect(_settings_pressed)
	%credits.pressed.connect(_credits_pressed)
	%quit.pressed.connect(_quit_pressed)
	MusicManager.play_song("title")

func _play_pressed() -> void:
	SceneManager.change_scene("res://Screens/level_select/level_select.tscn")

func _settings_pressed() -> void:
	pass

func _credits_pressed() -> void:
	%credits_panel.visible = !%credits_panel.visible

func _quit_pressed() -> void:
	get_tree().quit()
