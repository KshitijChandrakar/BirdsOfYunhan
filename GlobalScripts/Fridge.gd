extends Node
@export var holding = false
@export var Total_Num_of_Objects = 0
var allPlaced = true
@export var ScenePath = ""
@onready var Objects = [$Object1, $Object2, $Object3, $Object4, $Object5, $Object6, $Object7, ]
var iterated = []
@export var path1 = ""
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in range(len(Objects)):
		if Objects[i] != null:
			if Objects[i].placed and i not in iterated:
				
				iterated.append(i)
	
	if len(iterated) >= Total_Num_of_Objects:
		
		get_tree().change_scene_to_file(ScenePath)	
	pass
