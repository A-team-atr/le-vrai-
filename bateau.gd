extends Area2D

func _on_body_entered(body: PhysicsBody2D):
	TransitionScene.change_scene_to_file("res://peche.tscn")
