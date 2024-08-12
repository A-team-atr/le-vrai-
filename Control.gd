extends Control

# Variables
@export var fill_speed := 40.0 # Vitesse de remplissage de la jauge
var success_clicks := 0 # Nombre de clics réussis
var target_value := 1000.0 # Valeur maximale de la jauge
var click_zone_start := 100.0 # Début de la zone de clic valide
var click_zone_end := 8000.0 # Fin de la zone de clic valide
var task_completed := false # Variable de contrôle pour savoir si la tâche est réussie

# Références aux nodes
@onready var water_gauge := $WaterGauge
@onready var feedback_label := $FeedbackLabel

func _ready():
	water_gauge.value = 0
	feedback_label.text = "Cliquez au bon moment pour remplir l'eau"

func _process(delta):
	# Remplir la jauge continuellement si la tâche n'est pas terminée
	if not task_completed:
		water_gauge.value += fill_speed * delta
	
		# Si la jauge atteint la valeur cible, elle recommence au début
		if water_gauge.value >= target_value:
			water_gauge.value = 0

func _on_click_area_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("clickgauche") and not task_completed:
		# Vérifier si le clic est dans la zone correcte
		if water_gauge.value >= click_zone_start and water_gauge.value <= click_zone_end:
			success_clicks += 1
			feedback_label.text = "Bon clic! Total : %d" % success_clicks
			print("Clic réussi, total de succès: %d" % success_clicks)
		else:
			feedback_label.text = "Clic raté! Réessayez."
			print("Clic raté")
		
		# Réinitialiser la jauge après un clic, qu'il soit réussi ou non
		water_gauge.value = 0

		# Vérifier si le joueur a réussi 3 clics
		if success_clicks >= 3:
			feedback_label.text = "Tâche réussie!"
			task_completed = true  # Marque la tâche comme réussie
			success_clicks = 0  # Réinitialiser le compteur après succès
