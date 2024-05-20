extends Node2D

@onready var velocity_callable = $ForwardVelocityCallable
@onready var collision_callable = $OverlapAndDamageCallable

var movement_callable : Callable

# Called when the node enters the scene tree for the first time.
func _ready():
	movement_callable = velocity_callable.init_callable(self)[1]
	collision_callable.other_node_damaged.connect(free_requested)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	movement_callable.call(delta)


func free_requested():
	queue_free()
