extends Node2D

@onready var anim = $Anim

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("default") 
