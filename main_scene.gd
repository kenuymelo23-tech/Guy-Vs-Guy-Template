extends Node2D
var thedummyscene=preload("res://the_dummy.tscn")
var team1
var team2
func _ready() -> void:
	if team1=="The Dummy":
		var thedummy=thedummyscene.instantiate()
		$TeamA.add_child(thedummy)
	if team2=="The Dummy":
		var thedummy=thedummyscene.instantiate()
		$TeamB.add_child(thedummy)
