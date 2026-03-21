extends Node2D

func _ready() -> void:
	MusicManager.stop_all_songs()

func _process(delta: float) -> void:
	#%Label.text = str(%box_parent.get_child_count())
	pass
