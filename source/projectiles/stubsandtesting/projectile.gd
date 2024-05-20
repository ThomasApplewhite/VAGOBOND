extends Area2D

@export var projectile_speed : float = 10.0

var is_launched = false

func _physics_process(delta):
	if is_launched:
		global_position += global_transform.x * projectile_speed * delta

func _on_projectile_hit(other):
	print("Projectile struck " + other.name)
	queue_free()

func launch():
	is_launched = true


	
