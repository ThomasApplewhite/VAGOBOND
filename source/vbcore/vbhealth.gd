class_name VBHealth

extends Node

const MIN_HEALTH = 0.0

signal health_changed(old_health : float, new_health : float)
signal health_depleted()

@export var max_health = 100.0

@onready var damage_with_context_callable : Callable = _take_attack_context_damage
@onready var damage_health_callable : Callable = _take_damage_internal
@onready var current_health : float = max_health

func _take_attack_context_damage(attack_context : VBAttackContext):
	_take_damage_internal(attack_context.damage)

func _take_damage_internal(damage_recieved : float):
	_change_health_internal(-damage_recieved)


func _change_health_internal(health_change : float):
	var old_health = current_health
	current_health += health_change
	clamp(current_health, MIN_HEALTH, max_health)
	
	health_changed.emit(old_health, current_health)
	if current_health <= MIN_HEALTH:
		health_depleted.emit()
	
