extends Resource
class_name Item

enum TYPE_ITEM {
	CONSUME,
	DAMAGE,
	INTERACTIVE
}

@export var name: String
@export var type: TYPE_ITEM
@export var mesh: Mesh

func get_type_name() -> String:
	return TYPE_ITEM.find_key(type)
