class_name VBGlobals

extends Object

static func get_player_group_name():
	return "player_characters"
	

# Masks the EnemyHurtbox layer, striking enemies
static func get_player_projectile_mask():
	return 0b0100
	

# Masks the PlayerHurtbox layer, striking friendlies
static func get_enemy_projectile_mask():
	return 0b0010

func _init():
	push_error([get_stack(), ": Creating a VBGlobals instance is not valid."])
