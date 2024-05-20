@tool
## @experimental
class_name VBProjectileArea2D

extends Area2D


var child_process_callback : Callable
var child_phyprocess_callback : Callable

var behavior_callable : VBProcessCallable

# Tool Functions --------

func _notification(what):
	if what == NOTIFICATION_CHILD_ORDER_CHANGED:
		update_configuration_warnings()


# I'd like to know how to cover multiple config warnings with this method
# I'll figure it out later
func _get_configuration_warnings():
	var has_callable = false
	
	# this config warning needs to do something if there are multiple process callables
	# what should I do about that?
	for child in get_children():
		if child is VBProcessCallable:
			behavior_callable = child
			has_callable = true
			break
	
	return ["This node has no VBProcessCallable, and won't have any runtime logic."] if not has_callable else []


# Runtime Functions --------

# Called when the node enters the scene tree for the first time.
func _ready():
	init_scene()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if child_process_callback:
		child_process_callback.call(delta)


# Called every physics tick. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if child_phyprocess_callback:
		child_phyprocess_callback.call(delta)
	
	
func init_scene():
	behavior_callable.init_callable(self)
	child_process_callback = behavior_callable.process_call
	child_phyprocess_callback = behavior_callable.physics_call

func get_request_free_callable():
	return queue_free_requested_by_child

func queue_free_requested_by_child():
	queue_free()
