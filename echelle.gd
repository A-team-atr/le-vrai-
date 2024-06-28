extends Area2D




func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		get_node("res://character_body_2d.tscn").echelle_active = true 


func _on_body_exited(body):
	if body.name == "CharacterBody2D":
		get_node("/root/main/CharacterBody2D").echelle_active = false 
