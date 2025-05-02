extends StaticBody3D
class_name PlatformTest

@export var platformToTarget:String = ""
var isActive: bool = false

func _ready() -> void:
	SignalGlobal.connect("monitor_active",Callable(self, "activate"))

func activate(target: String):
	if platformToTarget != target: return
	isActive = true
	position.y += 1
