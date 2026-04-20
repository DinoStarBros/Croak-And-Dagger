extends Box
## Abstract class for product boxes.
## Boxes that the player slashes open to reduce resell price,
## and have chance to drop item
## Also there should ONLY be 1 (ONE) CollisionShape2D, AnimationPlayer 
## and ItemSpawnerComponent for a box scene
class_name ProductBox

var damage : float

func _ready() -> void:
	boxes_amount += 1
	id = boxes_amount
	z_index = id
	
	scale.x *= randf_range(X_SCALE_RANGE.x, X_SCALE_RANGE.y)
	
	scale *= 1.2

func slice() -> void:
	
	for collider in get_children(): if collider is CollisionShape2D:
		collider.disabled = true
		break
	
	for anim in get_children(): if anim is AnimationPlayer:
		if anim.has_animation("break"):
			anim.play("break")
		else:
			queue_free()
		break
	
	GlobalSignals.DamageEnemy.emit(damage, true)
	
	for item_spawn_comp in get_children(): if item_spawn_comp is ItemSpawningComponent:
		item_spawn_comp.on_slash()
		break
