extends LogicGeneralPlayer

func start() -> void:
	character3D.velocity.y = character3D.jump_force
	
func on_physics_process(delta: float) -> void:
	if get_movement_input():
		state_machine.change_to(state_machine.STATE_NAMES.MOVE)
	else:
		state_machine.change_to(state_machine.STATE_NAMES.IDLE)
