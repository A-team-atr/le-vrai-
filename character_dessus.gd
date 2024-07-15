extends CharacterBody2D

@onready var walk_speed = 300.0
@onready var anim = get_node("AnimatedSprite2D")

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("droite") - Input.get_action_strength("gauche")
	input_vector.y = Input.get_action_strength("descendre") - Input.get_action_strength("monter")
	input_vector = input_vector.normalized()
	print(input_vector)
	
	if input_vector.x > 0:
		anim.play("right")
	elif input_vector.x < 0:
		anim.play("left")
	elif input_vector.y < 0:
		anim.play("up")
	elif input_vector.y > 0:
		anim.play("down")
	else:
		anim.play("idle")
		
	if input_vector:
		velocity = input_vector * walk_speed
	else:
		velocity = input_vector
	move_and_slide()
	
