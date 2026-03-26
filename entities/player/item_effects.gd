extends CanvasLayer
## THe node where all the ItemEffects get added to
class_name ItemEffects

@onready var box_decider: BoxDecider = %BoxDecider

var final_damage : float

func _ready() -> void:
	Global.item_effects = self
	
	await get_tree().process_frame
	final_damage = box_decider.final_damage
