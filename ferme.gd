extends Node2D


var paused = false 
var zone_retour_ferme = false 
@onready var maison_entrer = false
@onready var labelmaison := $"label_maison/Label"

func _ready():
	labelmaison.visible = false 
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if maison_entrer == true and Input.is_action_just_pressed("interagir"):
		TransitionScene.change_scene_to_file("res://maisonferme.tscn")
		
	if Input.is_action_just_pressed("pause"):
		paused = true
	if Input.is_action_just_pressed("pause") and paused == true:
		paused = false 
		
		
func _physics_process(delta):
	if zone_retour_ferme == true:
		if Input.is_action_just_pressed("interagir"):
			TransitionScene.change_scene_to_file("res://monde_1.tscn")

func _on_rertour_ferme_body_entered(body):
	zone_retour_ferme = true 
	
	

func _on_rertour_ferme_body_exited(body: PhysicsBody2D):
	zone_retour_ferme = false 


func _on_area_2d_body_entered(body: PhysicsBody2D):
	maison_entrer = true


func _on_area_2d_body_exited(body: PhysicsBody2D):
	maison_entrer = false



func _on_label_maison_body_entered(body):
	if body.name == "player_ferme":
		labelmaison.visible = true 


func _on_label_maison_body_exited(body):
	if body.name == "player_ferme":
		labelmaison.visible = false 
