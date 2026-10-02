extends Label
@onready var teamb = get_tree().get_first_node_in_group("teamb")

func _ready() -> void:
	if "LabelName" in teamb:
		text = teamb.LabelName
