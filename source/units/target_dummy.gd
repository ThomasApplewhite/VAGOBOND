extends Node2D

@onready var hurt_area : VBHurtArea2D = $VBHurtArea2D
@onready var health :VBHealth = $VBHealth

# Called when the node enters the scene tree for the first time.
func _ready():
	hurt_area.attack_recieved.connect(health.damage_with_context_callable)
	health.health_changed.connect(print_damage_dealt)
	health.health_depleted.connect(free_on_health_empty)
	

func print_damage_dealt(old_health, new_health):
	print("TargetDummy.gd:12 - Target Dummy took {0} damage".format([old_health - new_health]))


func free_on_health_empty():
	queue_free()
