extends Node2D

var paused = false 
var zone_retour_peche = false 
# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)



func _physics_process(delta):
	if zone_retour_peche == true:
		if Input.is_action_just_pressed("interagir"):
			TransitionScene.change_scene_to_file("res://monde_1.tscn")

func _on_dialogic_signal(argument: String):
	if argument == "retour":
		TransitionScene.change_scene_to_file("res://monde_1.tscn")
	if argument == "apprendre":
		TransitionScene.change_scene_to_file("res://a_la_peche.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		paused = true
	if Input.is_action_just_pressed("pause") and paused == true:
		paused = false 



func _on_retour_body_entered(body):
	zone_retour_peche = true 
	


func _on_retour_body_exited(body):
	zone_retour_peche = false 
