extends Enemy
class_name Enemy1

@onready var anim: AnimationPlayer = %anim
@onready var health_component: HealthComponent = %HealthComponent
@onready var stats_allocator: StatsAllocator = %StatsAllocator
@onready var box_decider: BoxDecider = %BoxDecider

func _ready() -> void:
	GlobalSignals.CursorMiss.connect(_cursor_miss)
	GlobalSignals.DamagePlayer.connect(_damage_player)
	GlobalSignals.DamageEnemy.connect(_hurt_player)
	GlobalSignals.Defended.connect(_defended)
	GlobalSignals.FightWin.connect(_fight_win)

func _cursor_miss() -> void:
	GlobalSignals.DamagePlayer.emit(box_decider.final_damage)

func _damage_player(damage: float) -> void:
	attack_anim()

func _hurt_player(damage: float, allow_crit: bool) -> void:
	hurt_anim()

func _defended() -> void:
	attack_anim()

func _fight_win() -> void:
	death_anim()

func attack_anim() -> void:
	anim.stop()
	anim.play("attack")
	await anim.animation_finished
	idle_anim()

func hurt_anim() -> void:
	anim.stop()
	anim.play("hurt")
	await anim.animation_finished
	idle_anim()

func death_anim() -> void:
	anim.stop()
	anim.play("death")
	await anim.animation_finished
	# This means the death animation is done
	GlobalSignals.StartUpgrade.emit()
	queue_free()

func idle_anim() -> void:
	anim.play("idle")
