extends Node2D

var save_path = "user://variable.save"

var var1 = 0
var var2 = 0
var var3 = 0
var var4 = 0

var text1
var text2
var text3
var text4

# Called when the node enters the scene tree for the first time.
func _ready():
	load_data()
	text1 = $Variable_1/text_1
	text2 = $Variable_2/text_2
	text3 = $Variable_3/text_3
	text4 = $Variable_4/text_4
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text1.text = "SENSIBILITE: " + str(var1)
	text2.text = "GAME VOLUME: " + str(var2)
	text3.text = "LUMINOSITE: " + str(var3)
	text4.text = "MUSIC VOLUME: " + str(var4)

func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(var1)
	file.store_var(var2)
	file.store_var(var3)
	file.store_var(var4)

func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		var1 = file.get_var(var1)
		var2 = file.get_var(var2)
		var3 = file.get_var(var3)
		var4 = file.get_var(var4)
		
func _on_minus_1_pressed():
	var1 -= 1
	save()
func _on_plus_1_pressed():
	var1 += 1
	save()

func _on_minus_2_pressed():
	var2 -= 1
	save()
func _on_plus_2_pressed():
	var2 += 1
	save()
func _on_minus_3_pressed():
	var3 -= 1
	save()
func _on_plus_3_pressed():
	var3 += 1
	save()

func _on_minus_4_pressed():
	var4 -= 1
	save()
func _on_plus_4_pressed():
	var4 += 1
	save()


func _on_return_menu_pressed():
	get_tree().change_scene_to_file("res://parallax_scrolling_scene.tscn")
