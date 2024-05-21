extends CharacterBody2D

@onready var primary_shooter = $ProjectileShooter
@onready var movement_callable_node = $PlayerMovementCallable

var movement_callable : Callable

# the mech should face the side of the screen that the cursor is on

func _ready():
	movement_callable = movement_callable_node.init_callable_with_body(self)[1]


func _physics_process(delta):
	movement_callable.call(delta)


func _unhandled_input(event):
	# fun fact: event.button_index and MOUSE_BUTTON_LEFT cannot be compared with is, only ==
	# I think this is because 'is' is not an equality checker, but a type checker.
	# MOUSE_BUTTON_LEFT is an enum (int) literal value, not a true type
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		primary_shooter.shoot_projectile_forward()


