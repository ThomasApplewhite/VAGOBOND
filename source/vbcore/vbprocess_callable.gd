class_name VBProcessCallable

extends Node

@onready var process_call : Callable = _process_internal
@onready var physics_call : Callable = _physics_process_internal

func init_callable(_parent_node : Node):
	return [process_call, physics_call]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process_internal(_delta):
	pass
	
# Called every physics tick. 'delta' is the elapsed time since the previous frame.
func _physics_process_internal(_delta):
	pass
