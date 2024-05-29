extends Area2D

signal other_node_damaged()

@export var damage : float = 10.0
var attack_context : VBAttackContext

# Called when the node enters the scene tree for the first time.
func _ready():
	area_entered.connect(overlapped_node)
	body_entered.connect(overlapped_node)
	body_shape_entered.connect(overlapped_node)
	
	attack_context = VBAttackContext.new()
	attack_context.damage = damage
	

func overlapped_node(other : Node):
	VBHurtArea2D.try_apply_attack_to_vbhurtarea2d(other, attack_context)
	other_node_damaged.emit()
