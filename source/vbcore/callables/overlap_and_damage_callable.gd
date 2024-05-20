extends Area2D

signal other_node_damaged()

# Called when the node enters the scene tree for the first time.
func _ready():
	area_entered.connect(overlapped_node)
	body_entered.connect(overlapped_node)
	body_shape_entered.connect(overlapped_node)
	

func overlapped_node(other : Node):
	#still don't know how I'm gonna do damage lol. anyways...
	print("Hit other node: " + other.name + ". Figure out how you're actually gonna damage it lol")
	other_node_damaged.emit()
