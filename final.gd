extends Node2D

var tp = false 
@onready var clique_gauche := $"Label"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if tp == true and Input.is_action_just_pressed("interagir"):
		TransitionScene.change_scene_to_file("res://fin.tscn")
	if Input.is_action_just_pressed("interagir"):
		clique_gauche.visible = false 

func _on_tp_final_body_entered(body: PhysicsBody2D):
	tp = true 


func _on_tp_final_body_exited(body: PhysicsBody2D):
	tp = false 
