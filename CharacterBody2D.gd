extends CharacterBody2D


const SPEED = 350.0
const JUMP_VELOCITY = -400.0
@onready var anim = get_node("AnimatedSprite2D")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var echelle_active = false 
var lit = false 


func _physics_process(delta):
	var direction = Input.get_axis("gauche", "droite")
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	if echelle_active == true: #echelle 
		gravity = 0 
		if Input.is_action_pressed("monter"):
			velocity.y = - 300
		else:
			velocity.y = 300 
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
	# As good practice, you should replace UI actions with custom gameplay actions.
	if direction == -1 :
		get_node("AnimatedSprite2D").flip_h = true
		anim.play("run")
	elif direction == 1 :
		get_node("AnimatedSprite2D").flip_h = false
		anim.play("run") 	
		
	if direction == 1 or direction == -1 :
		velocity.x = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if direction == 0 :
		anim.play("arret")
			

	move_and_slide()
