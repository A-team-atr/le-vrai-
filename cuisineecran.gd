extends Node2D

@onready var anim = get_node("AnimatedSprite2D")

func _on_cuisiner_pressed():
	anim.play("cooking")
