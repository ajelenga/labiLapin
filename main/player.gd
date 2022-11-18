extends KinematicBody


var direction = Vector3.BACK
var velocity = Vector3.ZERO
var strafe_dir = Vector3.ZERO
var strafe = Vector3.ZERO

var aim_turn = 0

var vertical_velocity = 0
var gravity = 20

var movement_speed = 0
var walk_speed = 5
var run_speed = 5
var acceleration = 6
var angular_acceleration = 7

var roll_magnitude = 17
 
func _input(event):
	if event is InputEventKey:
		if event.as_text() == "up" || event.as_text() == "left" || event.as_text() == "down" || event.as_text() == "right" || event.as_text() == "Space":
			if event.pressed:
				get_node("Status/" + event.as_text()).color = Color("ff6666")
			else:
				get_node("Status/" + event.as_text()).color = Color("ffffff")


func _physics_process(delta):
	
	

	if Input.is_action_pressed("forward") ||  Input.is_action_pressed("backward") ||  Input.is_action_pressed("left") ||  Input.is_action_pressed("right"):
		var h_rot = $Camroot/h.global_transform.basis.get_euler().y
	
		direction = Vector3(Input.get_action_strength("left") - Input.get_action_strength("right"),
					0,
					Input.get_action_strength("forward") - Input.get_action_strength("backward")).rotated(Vector3.UP,h_rot).normalized()
		if Input.is_action_pressed("sprint"):
					movement_speed = run_speed*4
		else:
			movement_speed = walk_speed
	else:
		movement_speed = 0
	
	velocity = lerp(velocity, direction * movement_speed, delta * acceleration)
	move_and_slide(velocity + Vector3.DOWN * vertical_velocity, Vector3.UP)
	
	if !is_on_floor():
		vertical_velocity += gravity * delta
	else:
		vertical_velocity = 0
	
	$Mesh.rotation.y = lerp_angle($Mesh.rotation.y, atan2(direction.x,direction.z), delta * angular_acceleration)
	
	#$Status/Label.text = "direction : " + String(direction)
	#$Status/Label2.text = "direction.length() : " + String(direction.length())
	#$Status/Label3.text = "velocity : " + String(velocity)
	#$Status/Label4.text = "velocity.length() : " + String(velocity.length())

	


func _on_enemy_body_entered(body):
	if body.name=="player":
		get_tree().change_scene("res://Control.tscn")
