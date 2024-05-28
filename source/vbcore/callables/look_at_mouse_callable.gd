extends VBProcessCallable

var node_to_look

func init_callable(parent_node : Node):
	node_to_look = parent_node
	
	return super(parent_node)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process_internal(_delta):
	node_to_look.look_at(node_to_look.get_global_mouse_position())
