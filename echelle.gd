extends Area2D
@onready var SoundEchelle = $echelleS

var vitesseY = false

func _on_body_entered(body):
	if body.name == "playercote":
		get_node("/root/world/playercote").echelle_active = true 
		SoundEchelle.play()
	
	if body.name == "playercote_parcours":
		get_node("/root/parcour/playercote_parcours").echelle_active = true 
		SoundEchelle.play()
		
	if body.name == "playercote_ferme":
		get_node("/root/maisonferme/playercote_ferme").echelle_active = true 
		SoundEchelle.play()
		
			
func _on_body_exited(body):
	if body.name == "playercote":
		get_node("/root/world/playercote").echelle_active = false 

		SoundEchelle.stop()

	if body.name == "playercote_parcours":
		get_node("/root/parcour/playercote_parcours").echelle_active = false 
		SoundEchelle.stop()

	if body.name == "playercote_ferme":
		get_node("/root/maisonferme/playercote_ferme").echelle_active = false
