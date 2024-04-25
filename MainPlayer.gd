
extends Sprite2D
#extends CharacterBody2D
var lr = 0
var windowSize = Vector2(0,0)
var mousePos = Vector2(0,0)
var distance = Vector2(0,0)
var snapPosition = Vector2(0,0)
const speed = 300.0

func _ready():
	windowSize = get_window().size
	mousePos = position

func _process(delta):
	if (position != mousePos):
		if (mousePos.x > position.x):
			pass
		elif (mousePos.x < position.x):
			pass
		if (mousePos.y > position.y):
			pass
		elif (mousePos.y < position.y):
			pass
	
	if lr == -1:
		position.x = move_toward(position.x, windowSize.x, speed * delta)
		$"../CharacterProfilessheet".frame = 1
	elif lr == 1:
		position.x = move_toward(position.x, (get_rect()["size"].x * -1 * scale.x), speed * delta)
		$"../CharacterProfilessheet".frame = 0
	#position = Vector2(0,0)

func _input(event):
	if Input.is_action_pressed("ui_leftMouseClick"):
		mousePos = get_global_mouse_position()
		if 0.05 * windowSize.x > mousePos.x:
			lr = -1
			pass
		elif 0.95 * windowSize.x < mousePos.x:
			lr = 1
			pass
		
	elif Input.is_action_just_released("ui_leftMouseClick"):
		lr = 0
		
		

