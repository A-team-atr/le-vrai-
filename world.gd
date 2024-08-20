extends Node2D

var zone_sortie_maison = false 
var paused = false 

func _physics_process(delta):
	if zone_sortie_maison == true:
		if Input.is_action_just_pressed("interagir"):
			TransitionScene.change_scene_to_file("res://monde_1.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		paused = true
	if Input.is_action_just_pressed("pause") and paused == true:
		paused = false 


func _on_sortie_body_entered(body):
	zone_sortie_maison = true 
	


func _on_sortie_body_exited(body):
	zone_sortie_maison = false 
