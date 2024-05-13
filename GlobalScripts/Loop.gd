extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	autoplay = true
	play()
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if get_playback_position() >= stream.get_length():
		play(0)
	pass
