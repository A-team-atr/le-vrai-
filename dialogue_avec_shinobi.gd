extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interagir") :
		Dialogic.start("dialoque_shinobi")

func _on_dialogic_signal(argument: String):
	if argument == "fin_shinobi":
		TransitionScene.change_scene_to_file("res://world.tscn")
