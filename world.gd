extends Node2D

var zone_sortie_maison = false 
var paused = false 
var Z_shinobi = false 
@onready var W := $"exp_touche_W"
@onready var A := $"exp_touche_A"
@onready var S := $"exp_touche_S"
@onready var D := $"exp_touche_D"
@onready var Sprint := $"exp_touche_sprint"


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
	if Input.is_action_just_pressed("monter"):
		W.visible = false 
	if Input.is_action_just_pressed("gauche"):
		A.visible = false 
	if Input.is_action_just_pressed("droite"):
		D.visible = false
	if Input.is_action_just_pressed("saut"):
		S.visible = false
	if Input.is_action_just_pressed("shift"):
		Sprint.visible = false
	
	if Input.is_action_just_pressed("interagir") and Z_shinobi == true:
		Dialogic.start("dialoque_shinobi")


func _on_sortie_body_entered(body: PhysicsBody2D):
	zone_sortie_maison = true 
	


func _on_sortie_body_exited(body: PhysicsBody2D):
	zone_sortie_maison = false 


func _on_zone_shinobi_body_entered(body: PhysicsBody2D):
	Z_shinobi = true 

func _on_zone_shinobi_body_exited(body: PhysicsBody2D):
	Z_shinobi = false 
