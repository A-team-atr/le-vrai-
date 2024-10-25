extends Node2D

var foin_ok = ProjectSettings.get_setting("shader_global/foin_ok")

func _ready():
	foin_ok = false 
	ProjectSettings.set_setting("shader_global/foin_prie", foin_ok)
	ProjectSettings.save
	set_process(false)
	
	
func _on_options_pressed():
	TransitionScene.change_scene_to_file("res://Options.tscn")


func _on_play_pressed():
	Transition2.change_scene_to_file("res://world.tscn")


func _on_quit_pressed():
	get_tree().quit()
