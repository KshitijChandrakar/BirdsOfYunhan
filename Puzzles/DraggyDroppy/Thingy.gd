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
@export var Total_Num_Of_Blanks = 1
var destination = []
var dest
func _ready():
	originalPos = position
	
	if draggable:
		for i in range(1, Total_Num_Of_Blanks + 1):
			var curStr = Base_String + str(i)
			destination.append(get_node(curStr))
func _process(_delta):
	if not placed and draggable:
		if Input.is_action_pressed("ui_leftMouseClick"):
			if get_rect().has_point(to_local(get_global_mouse_position())) or dragging:
				position = get_global_mouse_position()
				dest = checkDest(position)
				dragging = true
			
			
		elif Input.is_action_just_released("ui_leftMouseClick"):
			dragging = false
		#else:
			if dest != null:
				#offset = 
				position = get_global_mouse_position()
				placed = true
				$"../Door".play()
			else:
				position = originalPos
		
		pass
	#print($"../Shelf/MainPlayer".get_rect(), get_rect())
		
func checkDest(pos):
			for i in range(len(destination)):
				if destination[i].get_indexed("id") == id and destination[i].get_rect().has_point(destination[i].to_local(pos)) :
					print("Found Dest ", destination[i].position, "With Pos as ", pos)
					return destination[i]
