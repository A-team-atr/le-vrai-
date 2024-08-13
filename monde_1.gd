extends Node2D

@onready var label = $Label



func _on_zone_label_body_entered(body):
	label.visible = true


func _on_zone_label_body_exited(body):
	label.visible = false 
