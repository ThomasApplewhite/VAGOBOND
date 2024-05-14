extends CharacterBody2D

@export var speed: float = 300

@onready var primary_shooter = $ProjectileShooter

# the mech should face the side of the screen that the cursor is on

func _physics_process(_delta):
	handle_player_movement(_delta)

func _unhandled_input(event):
	# fun fact: event.button_index and MOUSE_BUTTON_LEFT cannot be compared with is, only ==
	# I think this is because 'is' is not an equality checker, but a type checker.
	# MOUSE_BUTTON_LEFT is an enum (int) literal value, not a true type
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		primary_shooter.shoot_projectile_forward()

func handle_player_movement(_delta):
	var direction = Vector2(Input.get_axis("MoveLeft", "MoveRight"), Input.get_axis("MoveUp", "MoveDown"))
	if direction:
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO

	move_and_slide()
