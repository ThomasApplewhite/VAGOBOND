class_name VBProjectileShooter

extends Node2D

@export var projectile_scene : PackedScene
@export_flags_2d_physics var projectile_collision_mask

@onready var timer = $Timer
@onready var owner_speed_callable : Callable = default_velocity_callable

func _ready():
	push_warning([get_stack(), ": Use of bad type coupling in projectile initialization (Line 33). Remove it"])


func default_velocity_callable():
	return 0.0
	

# shoot projectile in the shooter's positive x direction
func shoot_projectile_forward():
	shoot_projectile_in_direction(global_transform.x)


func shoot_projectile_in_direction(dir_to_shoot : Vector2):
	if timer.time_left > 0.0:
		return

	var projectile_node = projectile_scene.instantiate()
	projectile_node.global_position = global_position
	projectile_node.look_at(projectile_node.global_position + dir_to_shoot)
	
	# This is disgusting and bad... I shouldn't couple these types together...
	#	 but I'm going to leave this for now
	var vbprojectile = projectile_node as VBProjectile
	if vbprojectile:
		vbprojectile.set_projectile_properties(owner_speed_callable.call(), projectile_collision_mask)
	
	get_tree().root.add_child(projectile_node)
	
	timer.start()
