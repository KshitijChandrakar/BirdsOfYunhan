extends Sprite2D
signal showPuzzle
@export var nodeName = ""

var arrow = load("res://Resources/cursors/cursornorm-01-01.png")
var beam = load("res://Resources/cursors/cursorshine-01-01.png")
func _process(delta):
		if get_rect().has_point(to_local(get_global_mouse_position())):
			Input.set_custom_mouse_cursor(beam, Input.CURSOR_IBEAM)

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			#showPuzzle.emit()

			for i in get_child_count():
				
				get_child(i).visible = not get_child(i).visible
			#get_node(nodeName).visible = not get_node(nodeName).visible
			#$nodeName.show()


func MakeInvis(x):
	if x:
		visible = false
	pass # Replace with functio
