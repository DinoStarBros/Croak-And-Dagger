extends ProductBox
class_name CS5Box

var damage : float

func _ready() -> void:
	boxes_amount += 1
	id = boxes_amount
	z_index = id
	%Label.text = str(z_index)
	
	scale.x *= randf_range(X_SCALE_RANGE.x, X_SCALE_RANGE.y)

func _exit_tree() -> void:
	boxes_amount -= 1

func slice() -> void:
	%cs.disabled = true
	%anim.play("break")
	
	GlobalSignals.DamageEnemy.emit(damage)
