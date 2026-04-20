extends Box
class_name DefendBox

var damage : float
var sliced : bool = false

func _init() -> void:
	area_entered.connect(_area_entered)

func _ready() -> void:
	boxes_amount += 1
	id = boxes_amount
	z_index = Global.MAX_BOXES + id
	
	scale.x *= randf_range(0.5, 2)

func _exit_tree() -> void:
	boxes_amount -= 1

func _area_entered(area : Area2D) -> void:
	if area.name == "left_endpoint_area":
		deal_damage_to_player()

func deal_damage_to_player() -> void:
	GlobalSignals.DamagePlayer.emit(damage)
	queue_free()

func _physics_process(delta: float) -> void:
	
	if !sliced:
		_move(delta)
	
	if Global.current_game_state == Global.game_states.WIN:
		queue_free()

func slice() -> void:
	sliced = true
	
	for collider in get_children(): if collider is CollisionShape2D:
		collider.disabled = true
		break
	
	for anim in get_children(): if anim is AnimationPlayer:
		if anim.has_animation("break"):
			anim.play("break")
		else:
			queue_free()
