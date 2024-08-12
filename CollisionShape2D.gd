extends CollisionShape2D


func _on_body_entered(body: PhysicsBody2D):
	TransitionScene.change_scene_to_file("res://ferme.tscn")

func _on_area_2d_body_entered(body):
	pass # Replace with function body.
