extends Node3D

@onready var player: Player = get_tree().get_nodes_in_group("Player")[0]

func _process(delta: float) -> void:
	global_position.y = player.global_position.y
	global_position.z = player.global_position.z
