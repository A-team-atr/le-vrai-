extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	TransitionScene.change_scene_to_file("res://parcour.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
