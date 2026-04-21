extends CanvasLayer

func _process(delta: float) -> void:
	visible = (
		Global.current_game_state == Global.game_states.LEVEL_WIN
		)
