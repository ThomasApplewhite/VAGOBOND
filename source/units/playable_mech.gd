extends CharacterBody2D

@export var add_to_player_group : bool = true

@onready var primary_shooter = $ProjectileShooter
@onready var movement_callable_node = $PlayerMovementCallable
@onready var aiming_callable_node = $ShooterAimCallable

var movement_callable : Callable
var aiming_callable : Callable

# the mech should face the side of the screen that the cursor is on

func _ready():
	push_warning([get_stack(), ": Use of bad type coupling in weapon initialization (Line 18). Remove it"])
	
	movement_callable = movement_callable_node.init_callable_with_body(self)[1]
	aiming_callable = aiming_callable_node.init_callable(primary_shooter)[0]
	
	# This is disgusting and bad... I shouldn't couple these types together...
	#	 but I'm going to leave this for now
	var vbprimary = primary_shooter as VBProjectileShooter
	if vbprimary:
		vbprimary.owner_speed_callable = _get_speed
		vbprimary.projectile_collision_mask = VBGlobals.get_player_projectile_mask()
	
	if add_to_player_group:
		add_to_group(VBGlobals.get_player_group_name())

func _process(delta):
	aiming_callable.call(delta)


func _physics_process(delta):
	movement_callable.call(delta)


func _unhandled_input(event):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		primary_shooter.shoot_projectile_forward()


func _get_speed():
	return velocity.length()

