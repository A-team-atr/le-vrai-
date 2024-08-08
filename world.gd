extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("/root/world/playercote").global_position = Vector2(200,100)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

