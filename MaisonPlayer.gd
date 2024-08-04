extends Area2D

var entered = false

@onready var CharacterBody = get_node("res://character_body_2d.tscn")


func _physics_process(delta):
	if entered == true:
		if Input.is_action_just_pressed("interagir"):
			TransitionScene.change_scene_to_file("res://world.tscn")
			CharacterBody.global_position = Marker2D.global_position


func _on_body_entered(body):
	entered = true



func _on_body_exited(body):
	entered = false


