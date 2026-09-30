extends Camera2D
func _process(delta: float) -> void:
	var teama=get_tree().get_first_node_in_group("teama")
	if teama:
		global_position=teama.global_position
