extends Area2D
## The fuckang abstract parent class of all the boxes or whatever
class_name Box 

static var boxes_amount : int = 0

var id : int = 0
var velocity : Vector2

const X_SCALE_RANGE : Vector2 = Vector2(0.7, 1.3)

func slice() -> void:
	pass

func _move(delta: float) -> void:
	if not Global.current_game_state == Global.game_states.FIGHT: 
		return
	
	global_position += velocity * delta * Global.defend_box_speed_multiplier

func _exit_tree() -> void:
	boxes_amount -= 1
