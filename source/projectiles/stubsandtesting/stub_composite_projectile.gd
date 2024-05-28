extends VBProjectile

@onready var velocity_callnode = $ForwardVelocityCallable
@onready var collision_callnode = $OverlapAndDamageCallable

var movement_callable : Callable

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity_callnode.speed += self._initial_speed
	movement_callable = velocity_callnode.init_callable(self)[1]
	
	collision_callnode.collision_mask = self._collision_mask
	collision_callnode.other_node_damaged.connect(free_requested)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	movement_callable.call(delta)


func free_requested():
	queue_free()
