extends Item
class_name CS5

func _ready() -> void:
	GlobalSignals.ItemEfficiencyChanged.connect(_item_efficiency_changed)
	_item_efficiency_changed()

func _item_efficiency_changed() -> void:
	await get_tree().process_frame
	
	final_combo_cost = combo_cost - Global.item_efficiency
	%combo_cost_txt.text = str(final_combo_cost)

func use() -> void:
	if Global.cursor.combo >= final_combo_cost:
		Global.cursor.combo -= final_combo_cost
		
		Global.current_game_state = Global.game_states.USING_ITEM
		
		var item_effect : ItemEffect = item_effect_scn.instantiate()
		Global.item_effects.add_child(item_effect)
		
		queue_free()
