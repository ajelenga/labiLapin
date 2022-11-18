extends Spatial


var camrot_h = 0
var camrot_v = 0
var cam_v_min = -10
var cam_v_max = 50

var h_sensitivity = 0.01
var v_sensitivity = 0.01
var h_acceleration = 1
var v_acceleration = 1

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$h/v/Camera.add_exception(get_parent())


func _input(event):
	if event is InputEventMouseMotion:
		camrot_h += -event.relative.x 
		camrot_v += event.relative.y 

func _physics_process(delta):
	camrot_v = clamp(camrot_v,cam_v_min,cam_v_max)

	
	$h.rotation_degrees.y = lerp($h.rotation_degrees.y, camrot_h, delta*h_acceleration)	
	#$h/v.rotation_degrees.x = lerp($h/v.rotation_degrees.x, camrot_v, delta*v_acceleration ) 

