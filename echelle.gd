extends Area2D
@onready var SoundEchelle = $echelleS

var vitesseY = false

func _on_body_entered(body):
	if body.name == "playercote":
		get_node("/root/world/playercote").echelle_active = true 
		SoundEchelle.play()
		
func _on_body_exited(body):
	if body.name == "playercote":
		get_node("/root/world/playercote").echelle_active = false 
		SoundEchelle.stop()
