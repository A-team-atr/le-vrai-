extends Node2D

@export var fill_speed := 0.05 # Vitesse de remplissage de la jauge
var success_clicks := 0 # Nombre de clics réussis
var target_value := 1000.0 # Valeur maximale de la jauge
var click_zone_start := 900.0 # Début de la zone de clic valide
var click_zone_end := 1000.0 # Fin de la zone de clic valide
var task_completed := false # Variable de contrôle pour savoir si la tâche est réussie
var task_starting	:= false


@onready var water_gauge := $WaterGauge
@onready var feedback_label := $FeedbackLabel
@onready var start_button := $StartButton 
@onready var quit_button := $"quitbutton"

@export var speed = 0.50
@export var speed_stop = 0.0
@export var speed_back = -0.50



func _ready():
	water_gauge.value = 0
	feedback_label.text = "Cliquez au bon moment pour remplir l'eau"
	start_button.connect("pressed", Callable(self, "_on_StartButton_pressed"))
	quit_button.visible = false
	
func _process(delta):
	if task_starting:
		Global.peche_go = true 
		if water_gauge.value >= 0 :
			water_gauge.value += 30 * fill_speed
			print(water_gauge.value)
	
		if water_gauge.value >= target_value :
			water_gauge.value = 1000
			fill_speed = fill_speed * (-1)
			print(water_gauge.value)
			
func _on_click_area_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("clickgauche") and  task_completed == false:
		Global.peche_go = false  
		if water_gauge.value >= click_zone_start and water_gauge.value <= click_zone_end and success_clicks == 0:
			success_clicks += 1
			feedback_label.text = "Bon clic! Total : %d" % success_clicks
			fill_speed = fill_speed * 3
			task_starting = false
			start_button.visible = true 
			print("Clic réussi, total de succès: %d" % success_clicks)
		elif water_gauge.value >= click_zone_start and water_gauge.value <= click_zone_end and success_clicks == 1:
			success_clicks += 1
			feedback_label.text = "Bon clic! Total : %d" % success_clicks
			fill_speed = fill_speed * 2
			task_starting = false
			start_button.visible = true 
			print("Clic réussi, total de succès: %d" % success_clicks)
		elif water_gauge.value >= click_zone_start and water_gauge.value <= click_zone_end and success_clicks == 2:
			success_clicks += 1
			task_starting = false
			start_button.visible = false
		elif water_gauge.value >= click_zone_start and water_gauge.value <= click_zone_end:
			success_clicks += 1
			feedback_label.text = "Bon clic! Total : %d" % success_clicks
			task_starting = false
			start_button.visible = true 
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
			quit_button.visible = true
			Global.sérénité = true 

func _on_start_button_pressed():
	start_button.visible = false
	task_starting = true
	

	




func _on_quitbutton_pressed():
	Global.pateince = true 
	TransitionScene.change_scene_to_file("res://monde_1.tscn")

