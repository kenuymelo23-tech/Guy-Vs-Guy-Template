extends Node2D
var character
func _ready():
	for character in get_children():

			character.add_to_group("Characters")
			character.add_to_group("teama")
