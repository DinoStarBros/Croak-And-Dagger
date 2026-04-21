extends CanvasLayer

@onready var pause_ui: PauseUI = %pause
@onready var stats_allocator: StatsAllocator = %StatsAllocator
@onready var box_decider: BoxDecider = %BoxDecider

var upgrade_select_scn : PackedScene = load("res://UIPopups/upgradeSelect/upgrade_select.tscn")
var win_screen_scn : PackedScene = load("res://UIPopups/winScreen/win_screen.tscn")

func _ready() -> void:
	GlobalSignals.FightWin.connect(fight_win)
	GlobalSignals.StartUpgrade.connect(_start_upgrade)
	Global.player_crit_chance = stats_allocator.stats.crit_chance
	%pauseButton.pressed.connect(_pause_pressed)

func fight_win() -> void:
	pass

func _start_upgrade() -> void:
	if Global.boss_spawned:
		# This means the boss has been defeated, and you win the level
		Global.current_game_state = Global.game_states.LEVEL_WIN
		var win_screen : WinScreen = win_screen_scn.instantiate()
		add_child(win_screen)
	else:
		# Boss not yet beaten
		var upgrade_select : UpgradeSelect = upgrade_select_scn.instantiate()
		add_child(upgrade_select)

func _process(delta: float) -> void:
	%pauseButton.visible = Global.current_game_state == Global.game_states.FIGHT
	_stats_texts()

func _pause_pressed() -> void:
	pause_ui.pause_or_resume()

func _stats_texts() -> void:
	%debug.text = str(
		Global.product_box_spawn_speed_multiplier
	)
	
	#%damage_txt.text = str(
		#"Damage: ", roundi(box_decider.final_damage)
	#)
	
	%crit_txt.text = str(
		"Critical Chance: ", roundi(Global.player_crit_chance)
	)
	
	%item_eff_txt.text = str(
		"Item Efficiency: ", roundi(Global.item_efficiency)
	)
	
	%luck_txt.text = str(
		"Luck: ", roundi(Global.luck)
	)
