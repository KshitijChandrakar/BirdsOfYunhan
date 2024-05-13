extends Sprite2D
@export var id = 10
var originalPos
var dragging = false
@export var draggable = false
@export var placed = false
@export var interated = false
var pressedPos
var releasedPos
@export var Base_String = "../Blank"
@export var Total = 23
var destination = []
var destPos
func _ready():
	originalPos = position
	
	if draggable:
		for i in range(1, Total + 1):
			var curStr = Base_String + str(i)
			destination.append(get_node(curStr))
func _process(_delta):
	pass
	#print($"../Shelf/MainPlayer".get_rect(), get_rect())
	
func _input(event):
	pass
	#offset = Vector2(0,0)
	if not placed and draggable:
		if event is InputEventMouseButton:
			
				if event.is_action_pressed("ui_leftMouseClick") and get_rect().has_point(to_local(event.position)):
					position = get_global_mouse_position()
					dragging = true
				
				elif dragging and event.is_action_released("ui_leftMouseClick"):
					if destPos != null:
						offset = destPos - get_global_mouse_position()
						position = destPos
						dragging = false
						placed = true
		
		if dragging:
			
			global_position = get_global_mouse_position()
			for i in range(len(destination)):
				if destination[i].get_indexed("id") == id and destination[i].get_rect().has_point(destination[i].to_local(event.position)) and destination[i].get_indexed("placed") == false:
					#position = dstination[i].get_indexed("position")
					placed = true
					destination[i].placed = true
					
		
