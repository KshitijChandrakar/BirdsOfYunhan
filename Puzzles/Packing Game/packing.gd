extends Node
@export var path1 = ""

@export var Total_Number_Of_Objects = 0
var allPlaced = true
@onready var Objects = [$Object1,$Object2,$Object3,$Object4,$Object5,$Object6,$Object7, $Object8,$Object9,$Object10,$Object11,$Object12,$Object13,$Object14]
signal activate_ring
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
	
	activate_ring.emit(len(iterated) >= Total_Number_Of_Objects)	
	pass
