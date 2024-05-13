extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_just_pressed("ui_leftMouseClick") and get_rect().has_point(to_local(get_global_mouse_position())):
		
		$"..".LineMain.clear_points()
