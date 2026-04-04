extends ItemEffect
class_name KroflexFX

func _ready() -> void:
	GlobalSignals.DebuffEnemy.emit(
		DebuffsComponent.Debuffs.TIME_SLOW,
		9
	)
