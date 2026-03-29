extends ItemEffect
class_name CardFX

@onready var sprite: Sprite2D = %sprite

var rotation_speed : float
var duration : float = 3

func _ready() -> void:
	item_duration_timer.start(duration)

func _process(delta: float) -> void:
	_rotate_move(delta)
	
	rotation_speed += delta * 300

func _rotate_move(delta: float) -> void:
	sprite.rotation_degrees += rotation_speed * delta
