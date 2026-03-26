extends Item
class_name Zarchivas

func _ready() -> void:
	%combo_cost_txt.text = str(combo_cost)

func use() -> void:
	if Global.cursor.combo >= combo_cost:
		Global.cursor.combo -= combo_cost
		
		Global.current_game_state = Global.game_states.USING_ITEM
		
		var item_effect : ItemEffect = item_effect_scn.instantiate()
		Global.item_effects.add_child(item_effect)
		
		queue_free()
