extends ItemEffect
class_name CS5Effect

var time_val : float = 0
var time_scale : float = 10
var radius : float = 10

func _process(delta: float) -> void:
	_visuals(delta)

func _visuals(delta: float) -> void:
	time_val += delta * time_scale
	
	if time_val <= 6:
		radius -= sin(time_val) * 4
	
	%l.position.x = cos(time_val) * radius
	%l.position.y = sin(time_val) * radius
	
	%r.position.x = cos(time_val + PI) * radius
	%r.position.y = sin(time_val + PI) * radius
