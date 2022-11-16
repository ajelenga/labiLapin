extends Spatial

var score = 0
var score_max = 16
func _ready():
	var pickups= get_tree().get_nodes_in_group("Pick Up")
	for pickup in pickups:
		pickup.connect("captured",self,"_on_Pick_Up_captured");
		
	score_max = pickups.size()
func _on_Pick_Up_captured():
	score +=1
	$Score/Label.text = "Score : %s" % score
	$SfxrStreamPlayer.play()
	
	
	if score_max == score:
		$Score/MessageFin.show()


