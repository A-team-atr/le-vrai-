extends Area2D




func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		get_node("/root/node/CharacterBody2D").echelle_active = true 


func _on_body_exited(body):
	if body.name == "CharacterBody2D":
		get_node("/root/node/CharacterBody2D").echelle_active = false 
