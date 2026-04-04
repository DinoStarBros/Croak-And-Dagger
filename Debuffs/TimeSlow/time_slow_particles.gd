extends Debuff
class_name TimeSlowDebuff

func _ready() -> void:
	%Timer.start(duration)
	%Timer.timeout.connect(queue_free)
	
	Global.defend_box_speed_multiplier -= time_slow_mult

func _exit_tree() -> void:
	Global.defend_box_speed_multiplier += time_slow_mult
