extends CharacterBody2D


@onready var anim = get_node("anim_samourai")

func _physics_process(delta):
	anim.play("repos")
	anim.flip_h = true
