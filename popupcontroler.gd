extends RigidBody3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
var playedU = true
var playedD = false
func _process(delta):
	if 2 > position.distance_to(get_parent().get_node("CharacterBody3D").position):
		if not playedU:
			playedU = true
			get_node("AnimationPlayer").play_backwards("rotateDown")
			playedD = false
	else:
		if not playedD:
			playedU = false
			get_node("AnimationPlayer").play("rotateDown")
			playedD = true
		
