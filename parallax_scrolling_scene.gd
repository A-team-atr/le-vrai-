extends Node2D



func _on_options_pressed():
	get_tree().change_scene_to_file("res://Options.tscn")


func _on_play_pressed():
	get_tree().change_scene_to_file("res://node.tscn")


func _on_quit_pressed():
	get_tree().quit()
