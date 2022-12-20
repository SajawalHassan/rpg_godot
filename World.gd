extends Node2D

func _ready():
	var new_dialog = Dialogic.start("introduction_to_player")
	add_child(new_dialog)
