extends Sprite2D
@export var mode = 1
var arrow = load("res://Resources/cursors/cursornorm-01-01.png")
var beam = load("res://Resources/cursors/cursorshine-01-01.png")
signal closed
func _process(delta):
		if get_rect().has_point(to_local(get_global_mouse_position())):
			Input.set_custom_mouse_cursor(beam, Input.CURSOR_IBEAM)

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)) and visible == true :
			closed.emit()
			print("Garbage Cannot Signal Emitted")
			
			if mode == 1:
				get_parent().visible = false
			else:
				visible = false
