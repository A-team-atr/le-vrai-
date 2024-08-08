extends Area2D


func _on_body_entered(body):
	if body.name == "playercote":
		get_node("/root/world/playercote").lit = true 





func _on_body_exited(body):
	if body.name == "playercote":
		get_node("/root/world/playercote").lit = false 
