extends Node2D
## Item and ItemEffect are different.
## Item is the item that's in your inventory
## while ItemEffect is the effect that shows up when using the item
class_name ItemEffect

@export var item_duration_timer : ItemDurationTimer

@onready var item_effects : ItemEffects = get_parent()

func intro_over() -> void:
	pass
