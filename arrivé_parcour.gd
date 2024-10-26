extends Area2D


@onready var entrer = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interagir"):
		Transition2.change_scene_to_file("res://prier.tscn")


func _on_body_entered(body):
	Global.courage = true 
	entrer = true


func _on_body_exited(body):
	entrer = false
