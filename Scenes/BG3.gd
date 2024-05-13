extends Sprite2D
var time = 10


var dots = false
var clams = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if clams and dots:
		visible = true
		
		await get_tree().create_timer(time, true).timeout
		get_tree().change_scene_to_file("res://Puzzles/Packing Game/packing.tscn")
	pass


func MakeInvis(x):
	
	dots = x
	pass # Replace with function body.


func _on_bumble_done(x):
	clams = true
	pass # Replace with function body.

