extends CharacterBody3D
class_name Player

@onready var atackArm: Node3D = $Atack
@onready var area3DEnemy: Area3D = $Area3D

@export_range(0,50) var speed: float = 3
@export var rotation_speed: float = 5
@export var jump_force: float = 15
@export var gravity: float = -45

var hasKey: bool = false
var hasAtack: bool = false


func _on_area_3d_body_entered(body: Node3D) -> void:
	prints("Hola", body)
