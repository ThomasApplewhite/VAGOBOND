class_name VBHurtArea2D

extends Area2D

signal attack_recieved(attack_context : VBAttackContext)

# This method is responsible for all logic converting hurtarea to the correct class
#	 optimizations go here, obviously
static func try_apply_attack_to_vbhurtarea2d(hurtnode : Node, attack_context : VBAttackContext):
	var hurtarea = hurtnode as VBHurtArea2D
	if hurtarea:
		hurtarea.apply_attack(attack_context)


func apply_attack(attack_context : VBAttackContext):
	attack_recieved.emit(attack_context)
