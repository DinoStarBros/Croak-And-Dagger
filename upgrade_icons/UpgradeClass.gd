extends TextureRect
class_name Upgrade

@onready var stat_upgrades : StatUpgrades = get_parent().get_parent()
var scaling_val : float = 1
var siblings : Array ## All the children of the parent node
var twins : Array ## Siblings that are the same as that node
func scaling(
	## Scaling Index/Value here
	value : float,
	## The smaller = the faster the scaling
	## The bigger = the slower the scaling
	scaling_strength: float,
	## True = value that should increase (e.g. Box Speed)
	## False = value that should decrease (e.g. Spawn Time Seconds)
	increase_or_decrease: bool = true
	) -> float:
	
	if increase_or_decrease:
		return (1 + (value / scaling_strength))
	else:
		return (1 - (value / scaling_strength))

func get_scaling_value(type) -> float:
	siblings = get_parent().get_children()
	
	for sibling in siblings:
		if is_instance_of(sibling, type):
			twins.append(sibling)
	
	return twins.size()
