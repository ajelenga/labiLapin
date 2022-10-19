extends RigidBody

export(float, 1, 20) var speed = 5

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		rotate_y(0.1)
	if Input.is_action_pressed("ui_left"):
		rotate_y(-0.1)
	if Input.is_action_pressed("ui_down"):
		translate_object_local(Vector3(-1,0,0))
	if Input.is_action_pressed("ui_up"):
		translate_object_local(Vector3(1,0,0))


#func _integrate_forces(state):
#	var input_h = Input.get_action_strength("ui_right") -  Input.get_action_strength("ui_left") 
#	var input_v = Input.get_action_strength("ui_down") -  Input.get_action_strength("ui_up") 
#
#	var force = Vector3(input_h, 0, input_v)
#	add_central_force(force.normalized()*speed)
