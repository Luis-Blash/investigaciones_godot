extends Node
class_name MachineCharacter

@onready var character3D: Player = self.owner
var current_state: StateBase = null
@export var default_state:StateBase

# Nombres de nodos a buscar como hijos
const STATE_NAMES = {
	"IDLE": "IdlePlayer",
	"MOVE": "MovingPlayer",
	"JUMP": "JumpingPlayer",
	"ATACK": "AtackPlayer"
}

func _ready() -> void:
	call_deferred("_state_default_start")
	
func _state_default_start() -> void:
	current_state = default_state
	_state_start()
	
## método para cambiar a un nuevo estado
func change_to(new_state:String) -> void:
	if current_state and current_state.has_method("end"): current_state.end()
	current_state = get_node(new_state)
	_state_start()
	
func _state_start() -> void:
	#prints("StateMachine", current_state.name)
	## configuramos el estado
	current_state.character3D = character3D
	current_state.state_machine = self
	current_state.start()

#region sobreescribimos los metodos de godot del nodo
func _process(delta:float) -> void:
	if current_state and current_state.has_method("on_process"):
		current_state.on_process(delta)
		
func _physics_process(delta:float) -> void:
	if current_state and current_state.has_method("on_physics_process"):
		current_state.on_physics_process(delta)
	character3D.move_and_slide()
		
func _input(event:InputEvent) -> void:
	if current_state and current_state.has_method("on_input"):
		current_state.on_input(event)
		
func _unhandled_input(event:InputEvent) -> void:
	if current_state and current_state.has_method("on_unhandled_input"):
		current_state.on_unhandled_input(event)
		
func _unhandled_key_input(event:InputEvent) -> void:
	if current_state and current_state.has_method("on_unhandled_key_input"):
		current_state.on_unhandled_key_input(event)

#endregion
