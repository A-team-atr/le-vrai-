extends CharacterBody2D

@onready var anim = $AnimatedSprite2D

func _ready():
	anim.play("repos")
	anim.flip_h = true


func _physics_process(delta):
	pass
