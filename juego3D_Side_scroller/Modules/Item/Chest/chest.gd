extends StaticBody3D

@onready var labelText: Label3D = $Label3D

var isEntered: bool = false
var isPicked: bool = false

func updateText(text:String): 
	labelText.text = text
	
func _process(delta: float) -> void:
	if not isEntered: return
	if isPicked: return
	if Input.is_action_just_pressed("action_item"):
		updateText("Abrio Cofre")
		isPicked = true

func _on_iteam_area_3d_body_entered(body: Node3D) -> void:
	if isPicked: return
	updateText("Entro player")
	isEntered = true
	


func _on_iteam_area_3d_body_exited(body: Node3D) -> void:
	if isPicked: return
	updateText("Salio player")
	isEntered = false
