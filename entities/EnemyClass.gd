extends Node2D
## Abstract class for enemies 
class_name  Enemy

@export var stats_allocator : StatsAllocator

const HEALTHBAR_POSITION : Vector2 = Vector2(880, 138)

var stat_headstart : float = 0

func _ready() -> void:
	pass
