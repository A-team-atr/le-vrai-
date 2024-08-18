extends Control

@export var letters = ["res://letters/letter_1.png", "res://letters/letter_2.png", "res://letters/letter_3.png"] 
var current_letter = 0
var drawing_points = []  # Points du tracé du joueur
var is_drawing = false
var model_points = []  # Points du modèle à comparer

@onready var sprite_letter := $SpriteLetter
@onready var line_draw := $Line2D
@onready var feedback_label := $FeedbackLabel
@onready var start_button := $StartButton
@onready var feedback_label2 := $FeedbackLabel

func _ready():
	start_button.connect("pressed", Callable(self, "_on_start_button_pressed"))
	sprite_letter.visible = false
	line_draw.clear_points()
	# Charger les points du modèle pour la première lettre
	load_model_points(current_letter)

func load_model_points(index):
	# Exemple de points pré-définis pour chaque lettre
	match index:
		0:
			model_points = [Vector2(850, 400), Vector2(800, 525), Vector2(700, 620)]
		1:
			model_points = [Vector2(830, 570), Vector2(830, 650), Vector2(830, 725)]
		# Ajoute plus de modèles pour chaque lettre

func _on_start_button_pressed():
	if current_letter < len(letters):
		start_button.visible = false
		show_letter()
	else:
		feedback_label.text = "Vous avez terminé toutes les lettres!"

func show_letter():
	sprite_letter.texture = load(letters[current_letter])
	sprite_letter.visible = true
	feedback_label2.text = "Mémorisez la lettre."
	await get_tree().create_timer(3.0).timeout
	sprite_letter.visible = false
	feedback_label2.text = "Dessinez la lettre."

	is_drawing = true
	drawing_points.clear()
	line_draw.clear_points()

#func show_letter():
	# Charger la texture de la lettre et l'afficher
#	var letter_texture = load(letters[current_letter])
#	if letter_texture:
#		sprite_letter.texture = letter_texture
#		sprite_letter.visible = true
#		feedback_label2.text = "Mémorisez la lettre."
#		print("Lettre affichée: ", letters[current_letter])
#	else:
#		print("Erreur: Impossible de charger la lettre", letters[current_letter])

	# Attendre 3 secondes
#	await get_tree().create_timer(3.0).timeout

	# Cacher la lettre et permettre le dessin
#	sprite_letter.visible = false
#	feedback_label2.text = "Dessinez la lettre."
#	print("Temps écoulé, dessinez maintenant.")

#	is_drawing = true
#	drawing_points.clear()
#	line_draw.clear_points()

func _input(event):
	if is_drawing and event is InputEventMouseMotion and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var mouse_pos = event.position
		drawing_points.append(mouse_pos)
		line_draw.add_point(mouse_pos)

	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.is_pressed():
		is_drawing = false
		verify_drawing()

func verify_drawing():
	if compare_drawing(drawing_points, model_points):
		feedback_label.text = "Bravo ! Passons à la lettre suivante."
		current_letter += 1
	else:
		feedback_label.text = "Échec. Réessayez."

	start_button.visible = true
	load_model_points(current_letter)

func compare_drawing(drawing_points : Array, model_points : Array) -> bool:
	var tolerance := 70.0
	var matching_points := 0

	for i in range(min(drawing_points.size(), model_points.size())):
		var player_point: Vector2 = drawing_points[i]
		var model_point: Vector2 = model_points[i]
		var distance: float = player_point.distance_to(model_point)
	   
		if distance <= tolerance:
			matching_points += 1

	var match_percentage := float(matching_points) / float(model_points.size()) * 100.0
	
	return match_percentage >= 30.0

