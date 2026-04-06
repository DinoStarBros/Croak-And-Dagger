extends TextureRect
class_name Item

## The amount of combo points needed to use the item
@export var combo_cost : int = 6
## The scene for the Item effect
@export var item_effect_scn : PackedScene

var final_combo_cost : int

func _init() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE

func use() -> void:
	pass
