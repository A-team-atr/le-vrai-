extends StaticBody2D

@export var item: InvItem
var player = null


func _on_interactable_area_body_entered(body: PhysicsBody2D):
	
	if body.has_method("player"):
		player = body
		player.collect(item)
		await get_tree().create_timer(0.5).timeout
		self.queue_free()
		
