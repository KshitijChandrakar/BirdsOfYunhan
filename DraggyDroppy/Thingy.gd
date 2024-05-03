extends Sprite2D
@export var id = 10
var originalPos
var dragging = false
var placed = false
@onready var destination = $"../Shelf/MainPlayer"
func _ready():
	originalPos = position
func _process(delta):
	pass
	#print($"../Shelf/MainPlayer".get_rect(), get_rect())
	
func _input(event):
	pass
	#offset = Vector2(0,0)
	if not placed:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT:
				if event.pressed and get_rect().has_point(to_local(event.position)):
					dragging = true
					offset = global_position - get_global_mouse_position()
				elif dragging:
					dragging = false
		
		if dragging:
			global_position = get_global_mouse_position() + offset
			
			if destination.get_indexed("id") == id and destination.get_rect().has_point(destination.to_local(event.position)):
				position = destination.to_global(destination.get_indexed("position"))
				placed = true
		else:
			global_position = originalPos
		
