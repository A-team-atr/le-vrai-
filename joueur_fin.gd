extends CharacterBody2D

const SPEED = 115.0
const JUMP_VELOCITY = -275.0
const SPEED_RUN = 200.0

@onready var anim = get_node("AnimatedSprite2D")




# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var echelle_active = false 
var lit = false 
var bow_equiped =true
var bow_cooldown = true
var fleche = preload("res://fleche.tscn")


func _ready():
	pass
	
func _physics_process(delta):
	var direction = Input.get_axis("gauche", "droite")
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta * 1.08
		
	if echelle_active == true:
		gravity = 0 
		if Input.is_action_pressed("monter"):
			velocity.y = - 400

		else:
			velocity.y = 400
		
			
	else:
		gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
	
	
	if Input.is_action_just_pressed("MBL"):
		anim.play("tirer")
		

	# Handle jump.
	if Input.is_action_just_pressed("saut") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.play("jump")

	if position.y > 1472:
		TransitionScene.change_scene_to_file("res://mort_final.tscn")
	
	# Get the input direction and handle the movement/deceleration.
	if direction == -1:
		anim.flip_h = true
	elif direction == 1:
		anim.flip_h = false
		
	if direction:
		if Input.is_action_pressed("shift"):
			velocity.x = direction * SPEED_RUN
			if velocity.y == 0:
				anim.play("run")
		else: 
			velocity.x = direction * SPEED
			if velocity.y == 0:
				anim.play("walk")
	else:
		 
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if Input.is_action_just_pressed("clickgauche"):
			anim.play("tirer")
			
		elif velocity.y == 0  :
			anim.play("arret")
	
	var mouse_pos = get_global_mouse_position()
	$Marker2D.look_at(mouse_pos)
	if Input.is_action_just_pressed("interagir"):
		anim.play("tirer")
	if Input.is_action_just_pressed("clickgauche") and bow_equiped and bow_cooldown:
		bow_cooldown= false
		var fleche_instance = fleche.instantiate()
		fleche_instance.rotation = $Marker2D.rotation
		fleche_instance.global_position = $Marker2D.global_position
		add_child(fleche_instance) 
		
		await get_tree().create_timer(1.2).timeout
		bow_cooldown = true
		
	if Input.is_action_just_pressed("saut"):
		add_child 
	
	move_and_slide()
	

