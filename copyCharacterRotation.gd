extends Node3D

@export var node1 : Array[Node3D]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	node1[0].rotation.y = get_parent_node_3d().get_node("CharacterBody3D").rotation.y
	
