extends Node2D

var ii = true
var aa = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_body_entered(body):
	if body.name == "CharacterBody2D" and Input.is_action_pressed("interagir"):
		TransitionScene.change_scene_to_file("res://.tscn")


