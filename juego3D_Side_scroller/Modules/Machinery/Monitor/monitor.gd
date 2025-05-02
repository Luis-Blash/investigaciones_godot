extends StaticBody3D
class_name Monitor

@onready var labelText: Label3D = $Label3D

@export var monitorToEmit: String = ""

var isEntered: bool = false
var isPicked: bool = false

func updateText(text:String): 
	labelText.text = text
	
func _process(delta: float) -> void:
	if not isEntered: return
	if isPicked: return
	if Input.is_action_just_pressed("action_item"):
		updateText("Se activo Plataforma")
		isPicked = true
		SignalGlobal.emit_signal("monitor_active", monitorToEmit)


func _on_machine_area_body_entered(body: Node3D) -> void:
	if isPicked: return
	labelText.visible = true
	updateText("Presiona E")
	isEntered = true

func _on_machine_area_body_exited(body: Node3D) -> void:
	labelText.visible = false
	if isPicked: return
	isEntered = false
