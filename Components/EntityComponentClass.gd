extends Node2D
class_name EntityComponentClass

#var enemy_stat_mult : float = 1

func get_stat_value() -> float:
	
	if get_parent() is Enemy:
		return (Global.enemy_idx + 1) + get_parent().stat_headstart
	else:
		return 1
