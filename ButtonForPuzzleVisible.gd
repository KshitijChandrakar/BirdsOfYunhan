extends Sprite2D
signal showPuzzle

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
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
