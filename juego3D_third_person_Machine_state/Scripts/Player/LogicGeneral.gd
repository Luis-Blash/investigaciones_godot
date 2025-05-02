extends StateBase
class_name LogicGeneralPlayer

func get_movement_input() -> bool:
	return Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right") or \
		Input.is_action_pressed("move_up") or Input.is_action_pressed("move_down")

func apply_gravity(delta: float) -> void:
	if not character3D.is_on_floor():
		character3D.velocity.y += character3D.gravity * delta
