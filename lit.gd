extends Area2D







func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		get_node("/root/main/CharacterBody2D").lit = true 





func _on_body_exited(body):
	if body.name == "CharacterBody2D":
		get_node("/root/main/CharacterBody2D").lit = false 
