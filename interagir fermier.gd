extends Area2D



var _in = false  
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if _in == true:
		if  Input.is_action_just_pressed("interagir") and Global.foin_ok == true:
			Dialogic.start("dialogue_fermier_final")
			Global.recolte = false 
		elif  Input.is_action_just_pressed("interagir"):
			Dialogic.start("dialogue_fermier")
	


func _on_body_entered(body: PhysicsBody2D):
	_in = true 

func _on_body_exited(body: PhysicsBody2D):
	_in = false 
