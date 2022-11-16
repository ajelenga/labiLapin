extends RigidBody


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	if Input.is_action_pressed("ui_select"):
		
		rotate_y(-1.5708)
		
		
		var angleAZ : float = self.rotation.y 
		var fx : float = cos(angleAZ)
		var fy : float = sin(angleAZ)
		print_debug("angle")
		print_debug(angleAZ)
		print_debug("fy")
		print_debug(fy)
		print_debug("fx")
		print_debug(fx)
		pass
	if Input.is_action_pressed("ui_right"):
		apply_central_impulse(Vector3(-1,0,0))
	if Input.is_action_pressed("ui_left"):
		apply_central_impulse(Vector3(1,0,0))
	if Input.is_action_pressed("ui_down"):
		var angle : float = self.rotation.y 
		var fx : float = cos(angle)
		var fy : float = sin(angle)
		apply_central_impulse(Vector3(fx,0,fy))
		
	if Input.is_action_pressed("ui_up"):
		var angle : float = self.rotation.y 
		var fx : float = cos(angle)
		var fy : float = sin(angle)
		apply_central_impulse(Vector3(-fx,0,-fy))

		

