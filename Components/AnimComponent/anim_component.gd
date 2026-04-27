extends EntityComponentClass
## Handles the animations & stuff for the enemies.
## I definitely didnt have a mental breakdown
## over working on this fucking game.
class_name AnimComponent

@onready var anim: AnimationPlayer = %AnimCompPlayer

@export var idle_frame_idx : int = 0
@export var attack_frame_idx : int = 1
@export var hurt_frame_idx : int = 2

var sprite : Sprite2D

func _ready() -> void:
	for child in get_children():
		if child is Sprite2D:
			sprite = child
	
	sprite.use_parent_material = true

func attack() -> void:
	sprite.frame = attack_frame_idx
	anim.stop()
	anim.play("attack")
	await anim.animation_finished
	idle()

func idle() -> void:
	sprite.frame = idle_frame_idx
	anim.play("idle")

func hurt() -> void:
	sprite.frame = hurt_frame_idx
	_spawn_hitspark()
	anim.stop()
	anim.play("hurt")
	await anim.animation_finished
	idle()

func death() -> void:
	sprite.frame = hurt_frame_idx
	anim.stop()
	anim.play("death")
	await anim.animation_finished
	# This means the death animation is done
	GlobalSignals.StartUpgrade.emit()
	get_parent().queue_free()

func _spawn_hitspark() -> void:
	var hitspark : Hitspark = References.hitspark_scn.instantiate()
	hitspark.scale_mult = 1.5
	add_child(hitspark)
	hitspark.global_position = global_position
