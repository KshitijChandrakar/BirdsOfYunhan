
extends AnimatedSprite2D
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
	#position.x = move_toward(position.x, mouse.x, speed * delta)
	position.x = move_toward(position.x, mousePos.x, speed * delta)
	if position.x != mousePos.x:
		play("Walk")
		offset.x =  -175 if flip_h else 175
		offset.y = 0
	else:
		play("Standing Still")
		offset.x = 0
		offset.y = 90
		pass

func _input(event):
	if Input.is_action_pressed("ui_leftMouseClick"):
		mousePos = get_global_mouse_position()
		if position.x > mousePos.x:
			flip_h = false
			pass
		elif position.x < mousePos.x:
			flip_h = true
			pass
		
		
		

