extends Sprite2D

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			#add_child(scene)
			emit_signal("Meow",1)
			get_tree().change_scene_to_file("res://scene2.tscn")

