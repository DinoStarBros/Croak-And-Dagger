extends PanelContainer
class_name ItemSlot

@export var use_button : String

var key_text : String
var item_held : Item
var item_held_desire_pos_y : float

func _ready() -> void:
	GlobalSignals.ComboChanged.connect(_combo_changed)
	
	await get_tree().process_frame
	%text.text = key_text
	
	%Button.button_down.connect(determine_item)

func _unhandled_key_input(event: InputEvent) -> void:
	
	if Input.is_action_just_pressed(use_button):
		determine_item()

func determine_item() -> void:
	if not Global.current_game_state == Global.game_states.FIGHT:
		return
	
	if get_child_count() >= 1:
		for child in get_children():
			if child is Item:
				item_held = child
		
		#item_held = get_child(0)
		if item_held and Global.cursor.combo >= item_held.final_combo_cost:
			item_held.use()
		
			Global.cursor.cursor_speed = Global.cursor.base_speed

func _combo_changed() -> void:
	if get_child_count() >= 1:
		for child in get_children():
			if child is Item:
				item_held = child
	
	if !item_held: return
	
	if Global.cursor.combo >= item_held.final_combo_cost:
		tween_vec2(item_held, "position", Vector2(0, -10))
		tween_vec2(item_held, "scale", Vector2(1.1, 1.1))
	else:
		tween_vec2(item_held, "position", Vector2.ZERO)
		tween_vec2(item_held, "scale", Vector2.ONE)

var tween : Tween
func tween_vec2(item: Item, property: NodePath, vec2: Vector2, duration: float = 0.25) -> void:
	if tween: tween.kill()
	tween = get_tree().create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_BOUNCE)
	tween.tween_property(item, property, vec2, duration)
