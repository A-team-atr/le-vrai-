extends Node2D



func _ready():
	pass
	
	
func _on_options_pressed():
	TransitionScene.change_scene_to_file("res://Options.tscn")


func _on_play_pressed():
	if Global.debut == true :
		TransitionScene.change_scene_to_file("res://nam_joueur.tscn")
	else:
		Transition2.change_scene_to_file("res://world.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_button_pressed():
	TransitionScene.change_scene_to_file("res://preambule.tscn")
