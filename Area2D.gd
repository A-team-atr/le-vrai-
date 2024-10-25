extends Area2D

var dans_chario = false 
var recolete = ProjectSettings.get_setting("shader_global/recolte")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body: PhysicsBody2D):
	dans_chario = true 

func _on_body_exited(body: PhysicsBody2D):
	dans_chario = false 
