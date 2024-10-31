extends CharacterBody2D

var vie = 0
var vie_total = 3
@onready var anim = get_node("AnimatedSprite2D") 

func _ready():
	anim.play("repos")

func _physics_process(delta):
	if vie == vie_total:
		anim.play("mort")
		await get_tree().create_timer(2.7).timeout
		queue_free()


func _on_area_2d_body_entered(body):
	if body.name == "fleche":
		vie += 1
	
