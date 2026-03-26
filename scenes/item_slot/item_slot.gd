extends PanelContainer
class_name ItemSlot

@export var use_button : String

var item_held : Item

func _unhandled_key_input(event: InputEvent) -> void:
	
	if not Global.current_game_state == Global.game_states.FIGHT:
		return
	
	if Input.is_action_just_pressed(use_button):
		
		if get_child_count() >= 1:
			item_held = get_child(0)
			
			item_held.use()
