extends Sprite2D
var releasedPos = Vector2.ZERO
var startPos
var mousePos
var difference = Vector2.ZERO
var swipe
func _process(delta):
	if Input.is_action_just_released("ui_leftMouseClick"):
		releasedPos = get_global_mouse_position()
		rotation = 0
		offset = Vector2.ZERO
	if Input.is_action_just_pressed("ui_leftMouseClick"):
		startPos = get_global_mouse_position()
		
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT): # Change BUTTON_LEFT to BUTTON_RIGHT for right-click
		mousePos = get_global_mouse_position()
		# Do something with the mouse position
		#print("Mouse Position: ", mousePos, "Start Pos: ", startPos, "ReleasedPos: ", releasedPos)
		if get_rect().has_point(to_local(mousePos)):
			difference = (startPos - mousePos) * -1
			rotation = deg_to_rad(remap(difference.x, -100, 100, -30, 30))
			offset.x = remap(difference.x, -300, 300, -50, 50)
			#offset.y = remap(difference.y, -300, 300, -50, 50)
	swipe = 0 if difference.x == 0 else -1 if difference.x < 0 else 1
