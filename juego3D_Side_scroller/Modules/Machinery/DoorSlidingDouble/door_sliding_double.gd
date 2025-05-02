extends StaticBody3D

@onready var doorSlidingDouble: AnimationPlayer = $Pivot/doorSlidingDouble/AnimationPlayer
@onready var shape: CollisionShape3D = $CollisionShape3D
@export var doorToTarget: String = ""

func _ready() -> void:
	SignalGlobal.connect("door_action", Callable(self, "on_door_action"))

func on_door_action(isActive: bool, checkToTarget: String) -> void:
	if doorToTarget != checkToTarget:return

	if isActive:
		doorSlidingDouble.play("open")
		collision_layer = 0
	else:
		doorSlidingDouble.play("close")
		collision_layer = 4
