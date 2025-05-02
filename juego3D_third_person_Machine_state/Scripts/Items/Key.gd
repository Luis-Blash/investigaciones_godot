extends Node3D

var hasGet: bool = false

func _on_area_3d_body_entered(body: Node3D) -> void:
	if hasGet: return
	hasGet = true
	body.hasKey = true
	visible = false
