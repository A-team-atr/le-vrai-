extends Node2D

@onready var anim = get_node("AnimatedSprite2D")
@onready var anim2 = get_node("AnimatedSprite2D2")


func _on_revenir_pressed():
	TransitionScene.change_scene_to_file("res://world.tscn")






func _on_cuisiner_button_down():
	anim.play("cooking")
	anim2.play("cooking")


func _on_cuisiner_button_up():
	anim.play("default")
	anim2.play("default")
