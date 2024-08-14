extends Node2D

@onready var labelferme := $"zone label/Label"
@onready var labelbateau := $"zone label/Label"

func _ready():
	labelferme.visible = false
	labelbateau.visible = false

func _on_zone_label_body_entered(body):
	if body.name == "player":
		labelferme.visible = true


func _on_zone_label_body_exited(body):
	if body.name == "player":
		labelferme.visible = false


func _on_zone_bateau_label_body_entered(body):
	if body.name == "player":
		labelbateau.visible = true


func _on_zone_bateau_label_body_exited(body):
	if body.name == "player":
		labelbateau.visible = false
