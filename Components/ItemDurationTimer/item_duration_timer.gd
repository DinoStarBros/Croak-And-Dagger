extends Timer
class_name ItemDurationTimer

func _ready() -> void:
	timeout.connect(_stop_item)

func _stop_item() -> void:
	Global.current_game_state = Global.game_states.FIGHT
	get_parent().queue_free()
