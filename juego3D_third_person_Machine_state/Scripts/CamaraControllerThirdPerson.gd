extends Node3D

@onready var pivot: Node3D = get_tree().get_nodes_in_group("Player")[0].get_node("LookAt")
@export var mouse_sensitivity: float = 0.003
#arriba y abajo
var min_vertical_angle : float = deg_to_rad(-20)
var max_vertical_angle : float = deg_to_rad(20)

var rotation_camera: Vector2 = Vector2(0,0)

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _process(delta: float) -> void:
	global_position = pivot.global_position
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotation_camera.x -=event.relative.x * mouse_sensitivity
		rotation_camera.y -=event.relative.y * mouse_sensitivity
		rotation.x = clamp(rotation_camera.y,min_vertical_angle,max_vertical_angle)
		rotation.y = rotation_camera.x
		
