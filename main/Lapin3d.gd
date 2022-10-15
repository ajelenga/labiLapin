extends RigidBody



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		apply_central_impulse(Vector3(-1,0,0))
	if Input.is_action_pressed("ui_left"):
		apply_central_impulse(Vector3(1,0,0))
	if Input.is_action_pressed("ui_down"):
		apply_central_impulse(Vector3(0,0,-1))
	if Input.is_action_pressed("ui_up"):
		apply_central_impulse(Vector3(0,0,1))

