extends Control

# Variables
@export var fill_speed := 40.0 # Vitesse de remplissage de la jauge
var success_clicks := 0 # Nombre de clics réussis
var target_value := 1000.0 # Valeur maximale de la jauge
var click_zone_start := 610.0 # Début de la zone de clic valide
var click_zone_end := 890.0 # Fin de la zone de clic valide
var task_completed := false # Variable de contrôle pour savoir si la tâche est réussie
var task_starting	:= false


@onready var water_gauge := $WaterGauge
@onready var feedback_label := $FeedbackLabel
@onready var start_button := $StartButton 
@onready var verre1 := $verre1
@onready var verre2 := $verre2
@onready var verre3 := $verre3
@onready var verre1_1 := $verre1_1
@onready var verre2_2 := $verre2_2
@onready var verre3_3 := $verre3_3
@onready var theiere2 := $theiere2
@onready var quit_button := $"quitbutton"

@onready var anim := $Path2D/PathFollow2D/AnimatedSprite2D
@export var speed = 0.50
@onready var path_follow : PathFollow2D = $Path2D/PathFollow2D
@export var speed_stop = 0.0
@export var speed_back = -0.50
@onready var theactif = false


func _ready():
	water_gauge.value = 0
	feedback_label.text = "Cliquez au bon moment pour remplir l'eau"
	start_button.connect("pressed", Callable(self, "_on_StartButton_pressed"))
	verre1.visible = true
	verre2.visible = false
	verre3.visible = false
	verre1_1.visible = false
	verre2_2.visible = true
	verre3_3.visible = true
	quit_button.visible = false
	
func _process(delta):
	if theactif == true:
		if path_follow.progress_ratio >= 0.9:
			path_follow.progress_ratio += speed_stop * delta
			anim.play("new_animation")
		else:
			path_follow.progress_ratio += speed * delta
	if task_starting:
		if not task_completed:
			water_gauge.value += 25 * 0.05
			print(water_gauge.value)
	
			if water_gauge.value >= target_value and success_clicks == 0:
				water_gauge.value = 0
				feedback_label.text = "Eau débordée, recommencez."
				success_clicks = 0
				task_starting = false
				start_button.visible = true
			elif water_gauge.value >= target_value and success_clicks == 1:
				water_gauge.value = 0
				feedback_label.text = "Eau débordée, recommencez."
				success_clicks = 0
				task_starting = false
				start_button.visible = true
			elif water_gauge.value >= target_value and success_clicks == 2:
				water_gauge.value = 0
				feedback_label.text = "Eau débordée, recommencez."
				success_clicks = 0
				task_starting = false
				start_button.visible = true
				
	

func _on_click_area_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("clickgauche") and not task_completed:
		if water_gauge.value >= click_zone_start and water_gauge.value <= click_zone_end and success_clicks == 0:
			success_clicks += 1
			feedback_label.text = "Bon clic! Total : %d" % success_clicks
			task_starting = false
			start_button.visible = true 
			verre1.visible = false
			verre2.visible = true
			verre1_1.visible = true
			verre2_2.visible = false
			print("Clic réussi, total de succès: %d" % success_clicks)
		elif water_gauge.value >= click_zone_start and water_gauge.value <= click_zone_end and success_clicks == 1:
			success_clicks += 1
			feedback_label.text = "Bon clic! Total : %d" % success_clicks
			task_starting = false
			start_button.visible = true 
			verre3.visible = true
			verre2.visible = false
			verre3_3.visible = false
			verre2_2.visible = true
			print("Clic réussi, total de succès: %d" % success_clicks)
		elif water_gauge.value >= click_zone_start and water_gauge.value <= click_zone_end and success_clicks == 2:
			success_clicks += 1
			task_starting = false
			start_button.visible = false
			verre3.visible = false
			verre3_3.visible = true
		elif water_gauge.value >= click_zone_start and water_gauge.value <= click_zone_end:
			success_clicks += 1
			feedback_label.text = "Bon clic! Total : %d" % success_clicks
			task_starting = false
			start_button.visible = true 
			verre1.visible = true
			verre2.visible = false
			print("Clic réussi, total de succès: %d" % success_clicks)
		
		else:
			feedback_label.text = "Clic raté! Recommencez."
			success_clicks = 0
			task_starting = false
			start_button.visible = true
			print("Clic raté")
		
		water_gauge.value = 0

		if success_clicks >= 3:
			feedback_label.text = "Tâche réussie!"
			task_completed = true  
			success_clicks = 0  
			theiere2.visible = true
			quit_button.visible = true
			anim.play("vide")
			Global.sérénité = true 

func _on_start_button_pressed():
	start_button.visible = false
	task_starting = true
	theactif = true
	




func _on_quit_button_pressed():
	TransitionScene.change_scene_to_file("res://monde_1.tscn")
