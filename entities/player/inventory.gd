extends CanvasLayer
class_name Inventory

func _ready() -> void:
	Global.inventory = self

func add_item(item_scn: PackedScene) -> void:
	for i in %items.get_children(): if i is ItemSlot:
		if i.get_child_count() == 0:
			
			var item : Item = item_scn.instantiate()
			i.add_child(item)
			break
