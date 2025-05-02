extends LogicGeneralPlayer

func on_physics_process(delta: float) -> void:
	apply_gravity(delta)
	if get_movement_input():
		state_machine.change_to(state_machine.STATE_NAMES.MOVE)
		return
	
	character3D.velocity.x = 0
	character3D.velocity.z = 0
	
func on_input(_event:InputEvent):
	# seria mejor usar el parametro _event para obtener la información del evento
	if get_movement_input(): 
		state_machine.change_to(state_machine.STATE_NAMES.MOVE)
	elif _event.is_action_pressed("jump") and character3D.is_on_floor():
		state_machine.change_to(state_machine.STATE_NAMES.JUMP)
	elif _event.is_action_pressed("letter_C") and character3D.is_on_floor() and character3D.hasAtack:
		state_machine.change_to(state_machine.STATE_NAMES.ATACK)
