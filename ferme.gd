extends Node2D

var zone_retour_ferme = false 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	if zone_retour_ferme == true:
		if Input.is_action_just_pressed("interagir"):
			TransitionScene.change_scene_to_file("res://monde_1.tscn")

func _on_rertour_ferme_body_entered(body):
	zone_retour_ferme = true 
	
	

func _on_rertour_ferme_body_exited(body):
	zone_retour_ferme = false 
