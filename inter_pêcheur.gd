extends Area2D



var entered = false


	
	

func _physics_process(delta):
	if entered == true:
		if Input.is_action_just_pressed("interagir"):
			Dialogic.start("dialogue_pêcheur")
			


func _on_body_entered(body):
	entered = true



func _on_body_exited(body):
	entered = false
