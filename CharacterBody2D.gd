extends CharacterBody2D

<<<<<<< HEAD
const SPEED = 0.0
const JUMP_VELOCITY = -470.0
=======
const SPEED = 200.0
const JUMP_VELOCITY = -600.0
>>>>>>> aec8bd8edc9e45fca1554f49ae03d2026b803ccb
@onready var anim = get_node("AnimatedSprite2D")
@onready var SoundEchelle = $echelle
@onready var SoundVide = $vide

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var echelle_active = false 
var lit = false 


func _physics_process(delta):
	var direction = Input.get_axis("gauche", "droite")
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta * 2.08
	if echelle_active == true: #echelle 
		gravity = 0 
		if Input.is_action_pressed("monter"):
			velocity.y = - 300
			
		else:
			velocity.y = 300 
		if velocity.y != 0:
			SoundEchelle.play()
	else:
		gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
		
	
	if lit == true:
		if Input.is_action_pressed("interagir"):
			anim.play("dormir")
	
	
	# Handle jump.
	if Input.is_action_just_pressed("saut") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.play("jump")
	# Get the input direction and handle the movement/deceleration.
	if direction == -1:
		anim.flip_h = true
	elif direction == 1:
		anim.flip_h = false
	if direction == 1 or direction == -1:
		velocity.x = direction * SPEED
		if velocity.y == 0:
			anim.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0:
			anim.play("arret")
	
	move_and_slide()
