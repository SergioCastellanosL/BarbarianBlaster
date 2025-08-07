extends Node3D

@export var turret : PackedScene
@export var enemy_path : Path3D

func build_turret(turret_position:Vector3) -> void:
	var new_torret = turret.instantiate()
	add_child(new_torret)
	new_torret.global_position = turret_position
	new_torret.enemy_path = enemy_path
