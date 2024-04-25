extends Node2D

@export var allow_crossed_wires = true
@export var only_cardinals = false
var is_correct = false
const Circle = preload("res://Wire Puzzle/circle.gd")
signal correct1
signal incorrect

# Called when the node enters the scene tree for the first time.
var circles: Array[Circle] = []
var correct_sequence = Line2D.new()
var correct_color = null

var spacing = 50
var radius = 10
var xside_offset = 100
var yside_offset = 100
var currently_selected = null
var default_color = Color.GREEN

var main_line = Line2D.new()

var good_line_color = Color.BLACK
var bad_line_color = Color.RED
var most_recent_color = Color.BLACK

var solved_color = Color.PURPLE
var solved_wrong_color = Color.RED
func _ready() -> void:
	allow_crossed_wires = true
	only_cardinals = false
	add_child(main_line)
	
	for y in range(3):
		for x in range(3):
			circles.append(Circle.new(
						Vector2(x*spacing+xside_offset, 
								y*spacing+yside_offset), 
								radius, default_color))
	for i in [0, 1, 4, 2, 5, 8, 7, 3, 6]:
		correct_sequence.add_point(circles[i].pos)

func is_connection_valid(start: Vector2, end: Vector2):
	if not allow_crossed_wires:
		var bad = false
		for i in range(main_line.points.size()-1):
			if Geometry2D.segment_intersects_segment(
						main_line.get_point_position(i), 
						main_line.get_point_position(i+1),
						start, end
			) != null and main_line.get_point_position(i+1) != start:
				bad = true
				break
		if bad:
			return false
	
	if only_cardinals and not (start.x == end.x or start.y == end.y):
		return false
	
	for circle in circles:
		if circle.pos == start or circle.pos == end:
			continue
		if main_line.points.has(end):
			return false

		if Geometry2D.segment_intersects_circle(start, end, circle.pos, circle.radius) >= 0:
#			prints("returning false", start, end, circle.pos, circle.radius)
			return false
	return true

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("reload"):
		get_tree().reload_current_scene()
	
	if Input.is_action_pressed("select"):
		for circle in circles:
			if Geometry2D.is_point_in_circle(
						get_local_mouse_position(), 
						circle.pos, radius
			):
				if currently_selected == null or is_connection_valid(currently_selected.pos, circle.pos):
					main_line.add_point(circle.pos)
					currently_selected = circle
					queue_redraw()
				
func blink_color(colorBlink):
	for i in range(10):
		correct_color = solved_color
		await get_tree().create_timer(.6).timeout
		correct_color = null
		await get_tree().create_timer(.6).timeout

func _draw() -> void:
	if not is_correct and main_line.points == correct_sequence.points:
		is_correct = true
		correct1.emit()
		print("is_correct", is_correct)
		blink_color(solved_color)
	elif len(main_line.points) == 9 and main_line.points != correct_sequence.points:
		is_correct = false
		incorrect.emit()
		print("is_correct", is_correct)
		main_line.clear_points()
		currently_selected = null
	for circle in circles:
		draw_circle(circle.pos, circle.radius, circle.color)



func _on_puzzle_button_show_puzzle():
	visible = not visible
	pass # Replace with function body.
