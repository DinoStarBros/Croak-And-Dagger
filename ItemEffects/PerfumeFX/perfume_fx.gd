extends ItemEffect
class_name PerfumeFX

func _ready() -> void:
	GlobalSignals.GiveStatusPlayer.emit(
		StatusComponent.Statuses.PERFUME_CRIT,
		9
	)
