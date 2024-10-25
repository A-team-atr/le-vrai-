extends Node2D

@onready var labelferme := $"zone label/Label"
@onready var labelbateau := $"ZoneBateauLabel/LabelBateau"
@onready var labelparcour := $"zone_parcour_label/Labelparcour"
@onready var presencechario := $"chario"

var recolte = ProjectSettings.get_setting("shader_global/recolte")
var paused = false 
var courage = ProjectSettings.get_setting("shader_global/courage")
var serviabilite = ProjectSettings.get_setting("shader_global/serviabilite")
var zone_bateau = false
var zone_ferme = false
var z_parcour = false 


func _process(delta):
	if Input.is_action_just_pressed("pause"):
		paused = true
	if Input.is_action_just_pressed("pause") and paused == true:
		paused = false 
	 
	

	
		
func _ready():
	labelferme.visible = false
	labelbateau.visible = false
	presencechario.visible = false 
		
func _physics_process(delta):
	if zone_bateau == true:
		if Input.is_action_just_pressed("interagir"):
			TransitionScene.change_scene_to_file("res://peche.tscn")
			
	if zone_ferme == true:
		if Input.is_action_just_pressed("interagir"):
			TransitionScene.change_scene_to_file("res://ferme.tscn")
	
	if z_parcour == true:
		if courage == true and Input.is_action_just_pressed("interagir"):
			TransitionScene.change_scene_to_file("res://prier.tscn")
		elif Input.is_action_just_pressed("interagir"):
			TransitionScene.change_scene_to_file("res://parcour.tscn")

	
	 

func _on_zone_label_body_entered(body):
	if body.name == "player":
		labelferme.visible = true


func _on_zone_label_body_exited(body):
	if body.name == "player":
		labelferme.visible = false


func _on_zone_bateau_label_body_entered(body):
	if body.name == "player":
		labelbateau.visible = true


func _on_zone_bateau_label_body_exited(body):
	if body.name == "player":
		labelbateau.visible = false
		
func _on_bateau_body_entered(body: PhysicsBody2D):
	zone_bateau = true 


func _on_allez_ferme_body_entered(body: PhysicsBody2D):
	zone_ferme = true 


func _on_allez_ferme_body_exited(body: PhysicsBody2D):
	zone_ferme = false 
	
	
func _on_bateau_body_exited(body: PhysicsBody2D):
	zone_bateau = false 
	
	
	
	
func _on_zone_parcour_label_body_entered(body):
	if body.name == "player":
		labelparcour.visible = true
		
		
func _on_zone_parcour_label_body_exited(body):
	if body.name == "player":
		labelparcour.visible = false 
		



func _on_allez_parcours_body_entered(body: PhysicsBody2D):
	z_parcour = true


func _on_allez_parcours_body_exited(body: PhysicsBody2D):
	z_parcour = false


		


func _on_zone_afficher_chario_body_entered(body: PhysicsBody2D):
	print(recolte)
	if recolte == true:
		print("fheruvaibia")
		presencechario.visible = true  
	else:
		presencechario.visible = false 
