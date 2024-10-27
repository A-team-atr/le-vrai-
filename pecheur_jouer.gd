extends CharacterBody2D

@onready var anim = $AnimationPlayer
var paused = false 


func _ready():
	anim.play("repos")
	$repos.flip_h = true

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		paused = true
	if Input.is_action_just_pressed("pause") and paused == true:
		paused = false 

func _physics_process(delta):
	if Input.is_action_pressed("interagir"):
		anim.play("lancer")
		$lancer.flip_h = true


func _on_anim_joueur_peche_animation_finished():
	if anim == "lancer":
		anim.play("entrain_de_pêcher")
