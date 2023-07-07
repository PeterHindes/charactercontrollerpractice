extends CharacterBody3D

# Called when the node enters the scene tree for the first time.
var anim = AnimationPlayer
func _ready():
	anim=get_node("AnimationPlayer")

var time = 0
func _input(event):
	if event.is_action_pressed("rotate_cw"):
		anim.play_backwards("rotatePlayer")
		anim.seek(time,true)
	if event.is_action_pressed("rotate_cc"):
		anim.play("rotatePlayer")
		anim.seek(time,true)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ((not (Input.is_action_pressed("rotate_cc") or Input.is_action_pressed("rotate_cw")))
	and anim.current_animation == "rotatePlayer"):
		time=anim.current_animation_position
		anim.stop(true)
	var vel = Vector3(
	 -int(Input.is_action_pressed("move_right")) +
	int(Input.is_action_pressed("move_left"))
	,0
	,int(Input.is_action_pressed("move_up")) - 
	int(Input.is_action_pressed("move_down"))
	)
	var veldir = vel.rotated(Vector3(0,1,0),rotation.y)
	set_velocity(veldir)
	move_and_slide()
