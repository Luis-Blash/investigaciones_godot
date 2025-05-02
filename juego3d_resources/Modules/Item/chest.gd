extends StaticBody3D
class_name Chest

@export var stats_item: Item

func _ready() -> void:
	if stats_item.mesh:
		var mesh_instance = MeshInstance3D.new()
		mesh_instance.mesh = stats_item.mesh
		add_child(mesh_instance)
		prints("Instanciado MeshInstance3D para ítem:", stats_item.name, stats_item.get_type_name())
	else:
		print("El ítem no tiene mesh asignado")
