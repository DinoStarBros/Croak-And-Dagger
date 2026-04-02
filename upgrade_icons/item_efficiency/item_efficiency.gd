extends Upgrade
class_name ItemEfficiency

func _ready() -> void:
	Global.item_efficiency = min(Global.item_efficiency + 1, 3)
