extends VBProcessCallable

@export var speed : float = 100.0

var node_to_move

func init_callable(parent_node : Node):
	node_to_move = parent_node
	return super(parent_node)
	

# Called every physics tick. 'delta' is the elapsed time since the previous frame.
func _physics_process_internal(delta):
	if node_to_move:
		node_to_move.global_position += node_to_move.global_transform.x * speed * delta
