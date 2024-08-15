extends Node2D

@onready var labelferme := $"zone label/Label"
@onready var labelbateau := $"ZoneBateauLabel/LabelBateau"

var zone_bateau = false
var zone_ferme = false

func _ready():
	labelferme.visible = false
	labelbateau.visible = false

func _physics_process(delta):
	if zone_bateau == true:
		if Input.is_action_just_pressed("interagir"):
			TransitionScene.change_scene_to_file("res://peche.tscn")
			
	if zone_ferme == true:
		if Input.is_action_just_pressed("interagir"):
			TransitionScene.change_scene_to_file("res://ferme.tscn")


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


func _on_allez_ferme_body_exited(body):
	zone_ferme = false 
	
	
func _on_bateau_body_exited(body):
	zone_bateau = false 
