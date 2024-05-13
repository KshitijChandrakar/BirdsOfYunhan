extends Sprite2D

var dots = false
var clams = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dots and clams:
		visible = false
	pass



func MakeInvis(x):
	
	dots = x
	pass # Replace with function body.

func _on_bumble_done(x):
	clams = true
	pass # Replace with function body.

