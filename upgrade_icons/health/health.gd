extends Upgrade
class_name Health

var old_max_hp : float
var new_max_hp : float
var hp_difference : float

func _ready() -> void:
	
	old_max_hp = stat_upgrades.health_component.max_hp
	stat_upgrades.health_component.max_hp = scaling(get_scaling_value(Health), 3, true) * stat_upgrades.health_component.stats.max_hp
	new_max_hp = stat_upgrades.health_component.max_hp
	
	hp_difference = new_max_hp - old_max_hp
	
	stat_upgrades.health_component.hp += roundi(hp_difference)
