extends CharacterBody2D

@onready var anim = $AnimationPlayer
var paused = false 


func _ready():
	anim.play("repos")
	$AnimatedSprite2D.flip_h = true

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		paused = true
	if Input.is_action_just_pressed("pause") and paused == true:
		paused = false 

func _physics_process(delta):
	if Input.is_action_pressed("interagir"):
		anim.play("lancer")
		_on_animation_player_animation_finished("lancer")



func _on_animation_player_animation_finished(anim_name):
	anim.play("pecher")
