extends Area2D

var dedans 

func _on_body_entered(body: PhysicsBody2D):
	TransitionScene.change_scene_to_file("res://ferme.tscn")
	
