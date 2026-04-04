extends ItemEffect
class_name KroflexFX

func _ready() -> void:
	GlobalSignals.GiveStatusEnemy.emit(
		StatusComponent.Statuses.TIME_SLOW,
		9
	)
