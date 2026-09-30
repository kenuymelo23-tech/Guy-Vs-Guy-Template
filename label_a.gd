extends Label

@onready var teama = get_tree().get_first_node_in_group("teama")

func _ready() -> void:
	if teama:
		text = teama.LabelName
