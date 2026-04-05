extends Status
class_name PerfumeCritStatus

func _ready() -> void:
	_setup_timer()
	
	Global.player_crit_chance += perfume_crit_amnt

func _exit_tree() -> void:
	Global.player_crit_chance -= perfume_crit_amnt
