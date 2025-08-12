extends Node3D

@export var projectile : PackedScene
@export var turret_range : float = 10.0
@onready var mesh_instance_3d: MeshInstance3D = $turretbase/MeshInstance3D/MeshInstance3D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var cannon: Node3D = $turretbase/MeshInstance3D/Cannon
@onready var turretbase: MeshInstance3D = $turretbase

var enemy_path : Path3D
var enemy : PathFollow3D
func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	enemy = find_best_target()
	if enemy:
		turretbase.look_at(enemy.global_position,Vector3.UP,true)
	

func _on_timer_timeout() -> void:
	if enemy:
		var shot = projectile.instantiate()
		add_child(shot)
		animation_player.play("fire")
		shot.global_position = cannon.global_position
		shot.direction = turretbase.global_transform.basis.z

func find_best_target() -> PathFollow3D:
	var best_target = null
	var best_progress = 0
	for enemy in enemy_path.get_children():
		if enemy is PathFollow3D:
			if enemy.progress > best_progress:
				var distance = global_position.distance_to(enemy.global_position)
				if distance <= turret_range:
					best_progress = enemy.progress
					best_target = enemy
	return best_target	
