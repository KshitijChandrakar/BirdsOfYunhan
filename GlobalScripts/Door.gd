extends Sprite2D
@export var ScenePath = ""
@export var click = true
@export var mode = 0
var arrow = load("res://Resources/cursors/cursornorm-01-01.png")
var beam = load("res://Resources/cursors/cursorshine-01-01.png")
func _ready():
	# Changes only the arrow shape of the cursor.
	# This is similar to changing it in the project settings.
	Input.set_custom_mouse_cursor(arrow)

	# Changes a specific shape of the cursor (here, the I-beam shape).
func _process(delta):
	if get_rect().has_point(to_local(get_global_mouse_position())) and visible:
			Input.set_custom_mouse_cursor(beam, Input.CURSOR_IBEAM)
			if not click:
				if ScenePath != "":
					get_tree().change_scene_to_file(ScenePath)

func _input(event):
	if event is InputEventMouseButton: 
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT and click:
			if get_rect().has_point(to_local(event.position)):
				#add_child(scene)
				if ScenePath != "" and visible:
					get_tree().change_scene_to_file(ScenePath)



func _on_garbage_cannot_closed():
	print("Garbage cannot Signal recieved")
	visible = true
	pass # Replace with function body.


func MakeInvis(x):
	if x:
		visible = false
	pass # Replace with function body.
