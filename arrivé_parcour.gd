extends Area2D

var courage = ProjectSettings.get_setting("shader_globals/courage")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	courage = true 
	if Input.is_action_just_pressed("interagir"):
		pass #TransitionScene.change_scene_to_file("res://prier.tscn")
