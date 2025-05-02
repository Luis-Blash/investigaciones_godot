extends StaticBody3D

@onready var label3D = $Label3D
@onready var tapa = $MeshInstance3D2

var player_in_area := false
var player_body :Player= null
var isOpen:bool = false

func _ready() -> void:
	label3D.visible = false

func _on_area_3d_body_entered(body: Node3D) -> void:
	if isOpen: return
	player_in_area = true
	player_body = body
	label3D.visible = true
	_update_label()

func _on_area_3d_body_exited(body: Node3D) -> void:
	player_in_area = false
	player_body = null
	label3D.visible = false

func _process(delta: float) -> void:
	var hasPressLetter = player_in_area and player_body and player_body.hasKey and not isOpen
	if !hasPressLetter : return
	if Input.is_action_just_pressed("letter_C"):
		_on_press_c()

func _update_label() -> void:
	# Actualiza el texto del Label según tenga o no la llave
	if not player_body.hasKey:
		label3D.text = "Sin llave"
	else:
		label3D.text = "Presiona C"

func _on_press_c() -> void:
	isOpen = true
	tapa.visible = false
	player_body.hasAtack = true
	label3D.text = "Arma obtenida presiona C"
