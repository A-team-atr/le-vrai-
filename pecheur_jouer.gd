extends CharacterBody2D

@onready var anim = get_node("anim_joueur_peche")
var paused = false 


func _ready():
	anim.play("repos")
	anim.flip_h = true

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		paused = true
	if Input.is_action_just_pressed("pause") and paused == true:
		paused = false 

func _physics_process(delta):
	if Input.is_action_pressed("interagir"):
		anim.play("lancer")
		
