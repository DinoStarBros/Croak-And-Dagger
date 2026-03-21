extends Node2D
## Handles spawning enemies/entities
class_name EntityParentSpawnerComponent

func _ready() -> void:
	GlobalSignals.UpgradeDone.connect(_upgrade_done)

func _upgrade_done() -> void:
	pass
