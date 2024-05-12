extends Node2D

var start_sprite: Sprite2D
var end_sprite: Sprite2D
var line: Line2D
var is_mouse_pressed: bool = false

func _ready():
	start_sprite = $Icon4
	end_sprite = $Icon2
	line = Line2D.new()
	add_child(line)

func _process(delta):
	if is_mouse_pressed:
		update_line()

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				if start_sprite.get_rect().has_point(start_sprite.to_local(get_global_mouse_position())) or end_sprite.get_rect().has_point(end_sprite.to_local(get_global_mouse_position())):
					is_mouse_pressed = true
			else:
				is_mouse_pressed = false
				line.clear_points()


func update_line():
	if is_mouse_pressed:
		line.clear_points()
		line.add_point(start_sprite.global_position)
		line.add_point(get_global_mouse_position())
		line.add_point(end_sprite.global_position)
