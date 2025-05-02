extends LogicGeneralPlayer

var atackAnimation : bool = false
@export var speed_animation: float = 1.5

func start():
	character3D.atackArm.visible = true
	atackAnimation = true

func _process(delta: float) -> void:
	if not atackAnimation: return
	if character3D.atackArm.rotation.y <= deg_to_rad(40):
		character3D.atackArm.rotation.y += delta * speed_animation
	else:
		character3D.atackArm.rotation.y = 0
		character3D.atackArm.visible = false
		atackAnimation = false
		state_machine.change_to(state_machine.STATE_NAMES.IDLE)
