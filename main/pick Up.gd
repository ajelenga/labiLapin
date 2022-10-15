extends Area

signal captured



func _on_Pick_Up_body_entered(body):
	queue_free()
	emit_signal("captured")
