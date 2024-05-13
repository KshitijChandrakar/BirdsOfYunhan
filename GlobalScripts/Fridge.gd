extends Node

@export var Total = 0
var allPlaced = true
@export var baseStr = "Object"
@onready var Objects = [$Object1]
@export var ScenePath = ""
var iterated = []
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in range(len(Objects)):
		if Objects[i] != null:
			if Objects[i].placed and i not in iterated:
				
				iterated.append(i)
	
	if len(iterated) >= Total:
		
		get_tree().change_scene_to_file(ScenePath)	
	pass
