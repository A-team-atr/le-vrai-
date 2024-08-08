extends Area2D

var entered = false



func _physics_process(delta):
	if entered == true:
		if Input.is_action_just_pressed("interagir"):
			TransitionScene.change_scene_to_file("res://world.tscn")
			#playercoteeee.global_position = Vector2(400,200)    ça marche pas


func _on_body_entered(body):
	entered = true



func _on_body_exited(body):
	entered = false


