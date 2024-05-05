extends Sprite2D
signal showPuzzle


func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			showPuzzle.emit()
			#$"../../pin_code".visible = true
			

func _on_pin_code_correct_1():
	print("Hi")
	$"../../pin_code".visible = false
	pass # Replace with function body.


func _on_pin_code_incorrect():
	$"../../pin_code".visible = false
	pass # Replace with function body.
