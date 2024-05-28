class_name VBProjectile

extends Node2D

var _initial_speed : float
var _collision_mask : int

func set_projectile_properties(initial_speed : float, collision_mask : int):
	self._initial_speed = initial_speed
	self._collision_mask = collision_mask
