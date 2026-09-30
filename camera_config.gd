extends Node2D
func _ready():
	var target = get_tree().get_first_node_in_group("teama")

	if target:
		var camera = Camera2D.new()
		target.add_child(camera)

		camera.position = Vector2.ZERO
		camera.enabled = true
		camera.zoom=Vector2(2,2)
		camera.position_smoothing_enabled = true
		camera.position_smoothing_speed = 1.5
		
