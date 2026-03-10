extends Box
class_name AttackBox

func _ready() -> void:
	boxes_amount += 1
	id = boxes_amount
	z_index = id
	
	scale.x *= randf_range(0.5, 2)

func _process(delta: float) -> void:
	%Label.text = str(id)

func _exit_tree() -> void:
	boxes_amount -= 1
