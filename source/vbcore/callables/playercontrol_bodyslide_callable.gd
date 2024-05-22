extends VBProcessCallable


@export var speed : float = 100.0

var body_to_move : CharacterBody2D

func init_callable_with_body(body_node : CharacterBody2D):
	body_to_move = body_node
	return init_callable(body_node)
	

# Called every physics tick. 'delta' is the elapsed time since the previous frame.
func _physics_process_internal(delta):
	var direction = Vector2(Input.get_axis("MoveLeft", "MoveRight"), Input.get_axis("MoveUp", "MoveDown"))
	if direction:
		body_to_move.velocity = direction * speed * delta
	else:
		body_to_move.velocity = Vector2.ZERO

	body_to_move.move_and_slide()
