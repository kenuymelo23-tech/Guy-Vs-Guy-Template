extends Node2D
var damage:int=0
var pos:Vector2
func _ready():
	global_position=pos
	$DamageLabel.text=str(-damage)
func _process(delta: float) -> void:
	global_position.y-=2
	
	fade_out()
func fade_out():
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 0.8)
	await tween.finished
	queue_free()
