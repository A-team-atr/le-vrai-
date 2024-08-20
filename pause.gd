extends Control


var is_open = false


	
func _ready():
	close()
	
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		if is_open:
			Engine.time_scale = 1 
			close()
		else:
			Engine.time_scale = 0 
			open()

func _on_option_pressed():
	Engine.time_scale = 1
	close()
	TransitionScene.change_scene_to_file("res://Options.tscn")
	
	
func _on_quitté_pressed():
	Engine.time_scale = 1
	close()
	TransitionScene.change_scene_to_file("res://parallax_scrolling_scene.tscn")
	
	
func open():
	visible = true
	is_open = true
	
	

func close():
	visible = false
	is_open = false


func _on_continué_pressed():
	Engine.time_scale = 1
	close()
