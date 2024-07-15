extends Node2D



func _on_options_pressed():
	TransitionScene.change_scene_to_file("res://Options.tscn")


func _on_play_pressed():
	TransitionScene.change_scene_to_file("res://world.tscn")


func _on_quit_pressed():
	TransitionScene.quit()
