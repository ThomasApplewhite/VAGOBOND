extends CharacterBody2D

@export var speed: float = 300


func _physics_process(_delta):
	handle_player_movement(_delta)


func handle_player_movement(_delta):
	var direction = Vector2(Input.get_axis("MoveLeft", "MoveRight"), Input.get_axis("MoveUp", "MoveDown"))
	if direction:
		velocity = direction * speed
	else:
		#velocity.move_toward(Vector2.ZERO, speed)
		velocity = Vector2.ZERO

	move_and_slide()
