extends Node3D

@export var turret : PackedScene
# Called when the node enters the scene tree for the first time.

func build_turret(turret_position:Vector3) -> void:
	var new_torret = turret.instantiate()
	add_child(new_torret)
	new_torret.global_position = turret_position
