extends Sprite2D
@export var Total = 6
@export var Correct = true
signal selected
var arrow = load("res://Resources/cursors/cursornorm-01-01.png")
var beam = load("res://Resources/cursors/cursorshine-01-01.png")
func _process(delta):
	if get_parent().visible:
		if get_rect().has_point(to_local(get_global_mouse_position())):
			Input.set_custom_mouse_cursor(beam, Input.CURSOR_IBEAM)

func _input(event):
	if get_parent().visible:
		if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if get_rect().has_point(to_local(event.position)):
				if not Correct:
					if $"../Cards".frame >= Total -1:
						
						selected.emit(-1)
					else:
						$"../Cards".set_frame_and_progress($"../Cards".frame + 1, 0)
						
				else:
					selected.emit($"../Cards".frame)
