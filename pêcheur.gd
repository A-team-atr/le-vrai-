extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anime = get_node("mouvement_pêcheur")

func _physics_process(delta):
	
	anime.play("pêcher")
	
	

	move_and_slide()
