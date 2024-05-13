extends Node2D
var LineMain : Line2D
var dots = []
signal finished

@export var Total_Num_Of_Dots = 0
@export var Base_String = ""
@onready var start = $Start
@onready var end = $End
# Called when the node enters the scene tree for the first time.
func _ready():
	# Create a new Line2D node
	LineMain = Line2D.new()
	add_child(LineMain)
	LineMain.add_point(start.position)
	# Set line properties
	LineMain.default_color = Color(183, 32, 37)
	LineMain.width = 2
	pass # Replace with function body.
	for i in range(1, Total_Num_Of_Dots + 1):
		var curStr = Base_String + str(i)
		dots.append(get_node(curStr))
	dots.append(end)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if LineMain.get_point_count() - 1 > 0:
		if LineMain.get_point_position(LineMain.get_point_count() - 1) == end.position :
			if LineMain.get_point_count() >= Total_Num_Of_Dots  +2:
				finished.emit(true)
				visible = false
			else:
				finished.emit(false)				
				LineMain.clear_points()
				LineMain.add_point(start.position)
	
	if Input.is_action_just_pressed("ui_leftMouseClick"):
		var DotPos = onDotPosition(get_global_mouse_position())
		if DotPos != null:
			
			if checkValid(DotPos, LineMain.get_point_position(LineMain.get_point_count() - 1)):
				LineMain.add_point(DotPos)
			else:
				LineMain.clear_points()
				LineMain.add_point(start.position)
			queue_redraw()
			
func onDotPosition(Pos):
	for i in dots:
		if i.get_rect().has_point(i.to_local(get_global_mouse_position())):
			print("Added point ", i.position, " To Line")
			$Door.play()
			return i.position
	return null
func checkValid(p1: Vector2, p2: Vector2):
	if  LineMain.get_point_count() - 2 > 0:
		for i in range(LineMain.get_point_count() - 2):
			if not Intersects(p1, p2, LineMain.get_point_position(i), LineMain.get_point_position(i+1)):
				continue
			else:
				return false
	return true
	
func Intersects(p1: Vector2, p2: Vector2, p3: Vector2, p4: Vector2) -> bool:
	var denominator = (p4.y - p3.y) * (p2.x - p1.x) - (p4.x - p3.x) * (p2.y - p1.y)
	
	# Lines are parallel
	if denominator == 0:
		return false
	
	var ua = ((p4.x - p3.x) * (p1.y - p3.y) - (p4.y - p3.y) * (p1.x - p3.x)) / denominator
	var ub = ((p2.x - p1.x) * (p1.y - p3.y) - (p2.y - p1.y) * (p1.x - p3.x)) / denominator
	
	# Check if the intersection point is within the line segments
	if ua >= 0 and ua <= 1 and ub >= 0 and ub <= 1:
		return true
	else:
		return false
