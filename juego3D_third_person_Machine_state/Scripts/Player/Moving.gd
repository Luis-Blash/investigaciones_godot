extends LogicGeneralPlayer

@onready var cam: Camera3D = get_tree().get_nodes_in_group("CameraController")[0].get_node("SpringArm3D/Camera3D")

func get_movement_direction() -> Vector3:
	var basis   := cam.global_transform.basis
	var forward := -basis.z
	var right   :=  basis.x
	var dir     := Vector3.ZERO

	if Input.is_action_pressed("move_up"):
		dir += forward
	if Input.is_action_pressed("move_down"):
		dir -= forward
	if Input.is_action_pressed("move_left"):
		dir -= right
	if Input.is_action_pressed("move_right"):
		dir += right
	return dir.normalized()
	
func on_physics_process(delta: float) -> void:
	apply_gravity(delta)
	var dir = get_movement_direction()
	#handle_rotation(delta)
	
	if dir.length() == 0:
		state_machine.change_to(state_machine.STATE_NAMES.IDLE)

	character3D.velocity.x = dir.x * character3D.speed
	character3D.velocity.z = dir.z * character3D.speed
	
	# Si nos movemos, rotamos suavemente
	if dir.length() > 0:
		var target_y = atan2(-dir.x, -dir.z)
		var new_y = lerp_angle(character3D.rotation.y, target_y, character3D.rotation_speed * delta)
		character3D.rotation.y = new_y
	
	if Input.is_action_pressed("jump") and character3D.is_on_floor():
		state_machine.change_to(state_machine.STATE_NAMES.JUMP)
