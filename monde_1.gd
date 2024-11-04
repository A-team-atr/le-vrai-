extends Node2D

@onready var labelferme := $"zone label/Label"
@onready var labelbateau := $"ZoneBateauLabel/LabelBateau"
@onready var labelparcour := $"zone_parcour_label/Labelparcour"
@onready var presencechario := $"chario"
@onready var label_retour_fermier := $"label_retour_fermier"
@onready var path_follow : PathFollow2D = $Path2D/PathFollow2D
@onready var anim := $Path2D/PathFollow2D/AnimatedSprite2D
@onready var animtourne = get_node("Path2D/PathFollow2D/AnimatedSprite2D")
@onready var pp = get_node("player")

var paused = false 
var zone_bateau = false
var zone_ferme = false
var z_parcour = false 
var pres_chario = false
var speed = 0.30
var bateau_mouvement = false

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		paused = true
	if Input.is_action_just_pressed("pause") and paused == true:
		paused = false 
	
	
		
func _ready():
	labelferme.visible = false
	labelbateau.visible = false
	presencechario.visible = false 
	label_retour_fermier.visible = false

func _physics_process(delta):
	if zone_bateau == true:
		if Input.is_action_just_pressed("interagir"):
			Tr2.change_scene_to_file("res://peche.tscn")
			anim.play("btm")
			bateau_mouvement = true
			animtourne.flip_h = true
			pp.visible = false
			
	if bateau_mouvement == true:
		path_follow.progress_ratio += speed * delta
		if path_follow.progress_ratio > 20:
			animtourne.flip_h = true

	if zone_ferme == true:
		if Input.is_action_just_pressed("interagir"):
			TransitionScene.change_scene_to_file("res://ferme.tscn")
	
	if z_parcour == true:
		if Global.courage == true and Input.is_action_just_pressed("interagir"):
			TransitionScene.change_scene_to_file("res://prier.tscn")
		elif Input.is_action_just_pressed("interagir"):
			TransitionScene.change_scene_to_file("res://parcour.tscn")

	if pres_chario == true:
		
		if Global.recolte == true and Input.is_action_just_pressed("interagir"):
			label_retour_fermier.visible = true
			Global.foin_ok = true
			
	if Global.courage == true and Global.sérénité == true and Global.serviabilite == true and Global.pateince == true :
		TransitionScene.change_scene_to_file("res://final.tscn")
	 

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
		
func _on_bateau_body_entered(body: PhysicsBody2D):
	zone_bateau = true 


func _on_allez_ferme_body_entered(body: PhysicsBody2D):
	zone_ferme = true 


func _on_allez_ferme_body_exited(body: PhysicsBody2D):
	zone_ferme = false 
	
	
func _on_bateau_body_exited(body: PhysicsBody2D):
	zone_bateau = false 
	
	
	
	
func _on_zone_parcour_label_body_entered(body):
	if body.name == "player":
		labelparcour.visible = true
		
		
func _on_zone_parcour_label_body_exited(body):
	if body.name == "player":
		labelparcour.visible = false 
		



func _on_allez_parcours_body_entered(body: PhysicsBody2D):
	z_parcour = true


func _on_allez_parcours_body_exited(body: PhysicsBody2D):
	z_parcour = false



func _on_zone_afficher_chario_body_entered(body):
	if Global.recolte == true:
		presencechario.visible = true  
	else:
		presencechario.visible = false 
		label_retour_fermier.visible = false




func _on_inter_chario_body_entered(body):
	if body.name == "player":
		pres_chario = true


func _on_inter_chario_body_exited(body):
	if body.name == "player":
		pres_chario = false
