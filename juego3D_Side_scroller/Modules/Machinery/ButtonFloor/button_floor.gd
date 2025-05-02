extends Node3D

@onready var animation: AnimationPlayer = $buttonFloor/AnimationPlayer
@export var stepToTarget:String = ""
@export var isActive:bool = true



var isSteppedOn:bool = false

func _on_area_3d_body_entered(body: Node3D) -> void:
	if isSteppedOn: return
	isSteppedOn = true
	animation.play("toggle")
	SignalGlobal.emit_signal("door_action", isActive ,stepToTarget)
