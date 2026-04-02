extends Item
class_name Phone

func _ready() -> void:
	GlobalSignals.ItemEfficiencyChanged.connect(_item_efficiency_changed)
	_item_efficiency_changed()

func _item_efficiency_changed() -> void:
	final_combo_cost = combo_cost - Global.item_efficiency
	%combo_cost_txt.text = str(final_combo_cost)

func use() -> void:
	if Global.cursor.combo >= final_combo_cost:
		Global.cursor.combo -= final_combo_cost
		
		Global.current_game_state = Global.game_states.USING_ITEM
		
		var item_effect : ItemEffect = item_effect_scn.instantiate()
		Global.item_effects.add_child(item_effect)
		
		queue_free()
