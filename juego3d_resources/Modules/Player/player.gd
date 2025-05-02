extends CharacterBody3D
class_name Player

@export var pivotPlayer : Node3D

@export var SPEED: float = 5.0
@export var JUMP_VELOCITY: float = 10
@export var GRAVITY: float = -20
@export var ROTATION_SPEED: float = 5

# Guardamos el ángulo al que queremos rotar (en radianes)
var target_angle: float = 0.0

func apply_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity.y += GRAVITY * delta

func get_movement_direction() -> Vector3:
	var direction = Vector3.ZERO
	var playerTransform = transform.basis
	if Input.is_action_pressed("move_left"):
		direction += playerTransform.z
		target_angle = 0.0
	if Input.is_action_pressed("move_right"):
		direction -= playerTransform.z
		target_angle = PI
	return direction.normalized()

func handle_rotation(delta: float) -> void:
	var current_angle: float = pivotPlayer.rotation.y
	pivotPlayer.rotation.y = lerp_angle(current_angle, -target_angle, ROTATION_SPEED * delta)

func _physics_process(delta: float) -> void:
	apply_gravity(delta)
	var dir = get_movement_direction()
	
	if dir.length() == 0:
		velocity.x = 0
		velocity.z = 0
	else:
		velocity.z = dir.x * SPEED
		velocity.z = dir.z * SPEED
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	handle_rotation(delta)
	move_and_slide()
