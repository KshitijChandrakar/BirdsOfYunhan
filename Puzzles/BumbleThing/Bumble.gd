extends Node2D

signal Done
func _on_main_player_selected(x):
	print(x)
	Done.emit(x)
	visible = false
	pass # Replace with function body.
