extends Node2D
@export var teams:bool=false
@onready var LabelA=get_parent().get_node("LabelA")
@onready var LabelB=get_parent().get_node("LabelB")
@onready var spawna=get_parent().get_node("SpawnA")
func _ready() -> void:
	if teams==true:
		LabelA.visible=false
		LabelB.visible=false
		
		
func _process(delta: float) -> void:
	pass
