extends CharacterBody2D

@onready var anim = $AnimationPlayer
var paused = false 
var entrain_pecher = false 

func _ready():
	anim.play("repos")
	$AnimatedSprite2D.flip_h = true

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		paused = true
	if Input.is_action_just_pressed("pause") and paused == true:
		paused = false 

func _physics_process(delta):	 
	if Input.is_action_pressed("clickgauche"):
		anim.play("repos")
	elif Global.peche_go == true:
		anim.play("pecher")


