extends Sprite2D
@export var ScenePath = ""

var arrow = load("res://Resources/cursors/CursorDefault.png")
var beam = load("res://Resources/cursors/Cursor2.png")
func _ready():
	# Changes only the arrow shape of the cursor.
	# This is similar to changing it in the project settings.
	Input.set_custom_mouse_cursor(arrow)

	# Changes a specific shape of the cursor (here, the I-beam shape).
func _process(delta):
	if get_rect().has_point(to_local(get_global_mouse_position())):
			Input.set_custom_mouse_cursor(beam, Input.CURSOR_IBEAM)			

func _input(event):
	if event is InputEventMouseButton: 
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if get_rect().has_point(to_local(event.position)):
				#add_child(scene)
				if ScenePath != "":
					get_tree().change_scene_to_file(ScenePath)

