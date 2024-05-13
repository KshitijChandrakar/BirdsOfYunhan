extends Node2D
@export var time = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	print("Entered Elevator waiting ", time, " Seconds")
	await get_tree().create_timer(time, true).timeout
	get_tree().change_scene_to_file("res://Scenes/ring.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
