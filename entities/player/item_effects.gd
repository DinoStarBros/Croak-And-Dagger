extends CanvasLayer
## THe node where all the ItemEffects get added to
class_name ItemEffects

func _ready() -> void:
	Global.item_effects = self
