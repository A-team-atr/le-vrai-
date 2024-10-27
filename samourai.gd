extends AnimatedSprite2D

@onready var anim = get_node("samourai")
# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("repos")
	anim.flip_h = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
