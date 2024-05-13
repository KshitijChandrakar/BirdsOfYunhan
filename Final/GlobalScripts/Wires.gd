extends Sprite2D
@export var Match = 50
var destination
var mousePos
@export var selected = false
var start
var end
var startid
var endid
var startArr = []
var endArr = []
var ids = []
var total = 2
signal finished
var running = true


func _draw():
	for i in range(len(startArr)):
		draw_line(startArr[i], endArr[i], Color.PURPLE, 3)
	if start != null and end != null and startid == endid:
		draw_line(start, end, Color.GREEN, 5)
		startArr.append(start)
		endArr.append(end)
		ids.append(startid)
		start = null
		end = null
		startid = null
		endid = null
	if start != null and end != null and startid != endid:
		draw_line(start, end, Color.GREEN, 5)
		start = null
		end = null
		startid = null
		endid = null
	if start != null and end == null:
		draw_line(start, get_local_mouse_position(), Color.RED, 5)
		

func _process(delta):
	if len(startArr) < total:
		finished.emit(false)
		runner()
	if len(startArr) >= total:
		finished.emit(true)
		runner()
		#End it here somehow
	
func runner():
	if running:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			for num in get_child_count():
				var i = get_child(num)
				if i.id not in ids:
					if i.get_rect().has_point(i.to_local(get_global_mouse_position())):
						#print(i.id, " has point ", get_global_mouse_position())
						if start == null:
							start = i.position
							startid = i.id
							print("Initiated start with id ", i.id)
							continue
						if i.position != start and start != null and end == null:
							end = i.position
							endid = i.id
							print("Initiated end with id ", i.id)
	queue_redraw()
		
