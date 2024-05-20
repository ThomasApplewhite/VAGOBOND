extends Node2D

@export var projectile_scene : PackedScene
@export var should_follow_cursor : bool

func _process(_delta):
	if should_follow_cursor:
		look_at(get_global_mouse_position())

# shoot projectile in the shooter's positive x direction
func shoot_projectile_forward():
	shoot_projectile_in_direction(global_transform.x)

func shoot_projectile_in_direction(dir_to_shoot : Vector2):
	var projectile_node = projectile_scene.instantiate()
	projectile_node.global_position = global_position
	projectile_node.look_at(projectile_node.global_position + dir_to_shoot)
	get_tree().root.add_child(projectile_node)
	
