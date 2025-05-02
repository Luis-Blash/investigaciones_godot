extends CharacterBody3D


@export var GRAVITY: float = -20

func apply_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity.y += GRAVITY * delta


func _physics_process(delta: float) -> void:
	apply_gravity(delta)
	move_and_slide()
