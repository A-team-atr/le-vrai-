extends Control

# Variables
@export var fill_speed := 40.0 # Vitesse de remplissage de la jauge
var success_clicks := 0 # Nombre de clics réussis
var target_value := 1000.0 # Valeur maximale de la jauge
var click_zone_start := 500.0 # Début de la zone de clic valide
var click_zone_end := 800.0 # Fin de la zone de clic valide
var task_completed := false # Variable de contrôle pour savoir si la tâche est réussie
var task_starting	:= false

# Références aux nodes
@onready var water_gauge := $WaterGauge
@onready var feedback_label := $FeedbackLabel
@onready var start_button := $StartButton 
@onready var verre1 := $verre1
@onready var verre2 := $verre2
@onready var verre3 := $verre3

func _ready():
	water_gauge.value = 0
	feedback_label.text = "Cliquez au bon moment pour remplir l'eau"
	start_button.connect("pressed", Callable(self, "_on_StartButton_pressed"))
	verre1.visible = true
	verre2.visible = false
	verre3.visible = false
	
func _process(delta):
	if task_starting:
		# Remplir la jauge continuellement si la tâche n'est pas terminée
		if not task_completed:
			var growth_rate = 1.05  # Ajustez ce taux pour accélérer ou ralentir la croissance
			water_gauge.value += 30 * delta
			print(water_gauge.value)
	
		# Si la jauge atteint la valeur cible, elle recommence au début
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
		# Vérifier si le clic est dans la zone correcte
		if water_gauge.value >= click_zone_start and water_gauge.value <= click_zone_end and success_clicks == 0:
			success_clicks += 1
			feedback_label.text = "Bon clic! Total : %d" % success_clicks
			task_starting = false
			start_button.visible = true 
			verre1.visible = false
			verre2.visible = true
			print("Clic réussi, total de succès: %d" % success_clicks)
		elif water_gauge.value >= click_zone_start and water_gauge.value <= click_zone_end and success_clicks == 1:
			success_clicks += 1
			feedback_label.text = "Bon clic! Total : %d" % success_clicks
			task_starting = false
			start_button.visible = true 
			verre3.visible = true
			verre2.visible = false
			print("Clic réussi, total de succès: %d" % success_clicks)
		elif water_gauge.value >= click_zone_start and water_gauge.value <= click_zone_end and success_clicks == 2:
			success_clicks += 1
			task_starting = false
			start_button.visible = false
			verre3.visible = false
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
		
		# Réinitialiser la jauge après un clic, qu'il soit réussi ou non
		water_gauge.value = 0

		# Vérifier si le joueur a réussi 3 clics
		if success_clicks >= 3:
			feedback_label.text = "Tâche réussie!"
			task_completed = true  # Marque la tâche comme réussie
			success_clicks = 0  # Réinitialiser le compteur après succès



func _on_start_button_pressed():
	start_button.visible = false
	task_starting = true
	


