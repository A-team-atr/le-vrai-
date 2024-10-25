extends Node2D

var recolte = ProjectSettings.get_setting("shader_global/recolte")
var serviabilite = ProjectSettings.get_setting("shader_global/serviabilite")
var  sortir = false 
# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func _physics_process(delta):
	if sortir == true and Input.is_action_just_pressed("interagir"):
		TransitionScene.change_scene_to_file("res://ferme.tscn")

func _on_sortir_body_entered(body: PhysicsBody2D):
	sortir = true 
	

func _on_sortir_body_exited(body: PhysicsBody2D):
	sortir = false 

func _on_dialogic_signal(argument: String):
	if argument == "afficher_chario":
		recolte = true 
		ProjectSettings.set_setting("shader_global/recolte", recolte)
		ProjectSettings.save()
		TransitionScene.change_scene_to_file("res://ferme.tscn")
		
	if argument == "retour_ferme":
		TransitionScene.change_scene_to_file("res://ferme.tscn")
		
	if argument == "fin_foin":
		serviabilite = true 
		recolte = false 
		ProjectSettings.set_setting("shader_global/recolte",recolte)
		ProjectSettings.set_setting("shader_global/serviabilite", serviabilite)
		ProjectSettings.save()
		
