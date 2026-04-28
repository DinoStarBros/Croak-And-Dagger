extends Node

const levels_arr : Array = [
	"res://Levels/World1/level_1-1.tscn",
	"res://Levels/World1/level_1-2.tscn",
	
	
]

const world1_levels_res : Array = [
	preload("res://LevelResources/World1/1-1.tres"),
	preload("res://LevelResources/World1/1-2.tres"),
	preload("res://LevelResources/World1/1-3.tres"),
	preload("res://LevelResources/World1/1-4.tres"),
	preload("res://LevelResources/World1/1-5.tres"),
	preload("res://LevelResources/World1/1-6.tres"),
	preload("res://LevelResources/World1/1-7.tres"),
	preload("res://LevelResources/World1/1-8.tres"),
	preload("res://LevelResources/World1/1-9.tres"),
	preload("res://LevelResources/World1/1-10.tres"),
	
]

const enemies_def_scn : PackedScene = preload("res://juices/EnemiesDefeatedPopup/enemies_defeated_popup.tscn")
const hitspark_scn : PackedScene = preload("res://juices/HitSpark/hitspark.tscn")
