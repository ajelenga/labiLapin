extends RigidBody


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		rotate_y(0.1)
	if Input.is_action_pressed("ui_left"):
		rotate_y(-0.1)
	if Input.is_action_pressed("ui_down"):
		var angle : float = self.rotation.y 
		var fx : float = cos(angle)
		var fy : float = sin(angle)
		apply_central_impulse(Vector3(fx,0,fy))
	if Input.is_action_pressed("ui_up"):
		translate_object_local(Vector3(0.1,0,0))

		

