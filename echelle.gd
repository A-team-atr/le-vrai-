extends Area2D
@onready var SoundEchelle = $echelleS

var vitesseY = false

func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		get_node("/root/world/CharacterBody2D").echelle_active = true 
		SoundEchelle.play()
		
func _on_body_exited(body):
	if body.name == "CharacterBody2D":
		get_node("/root/world/CharacterBody2D").echelle_active = false 
		SoundEchelle.stop()
