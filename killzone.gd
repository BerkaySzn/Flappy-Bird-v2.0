extends Area2D


func _on_body_entered(body):
	if body.name == "Player":
		body.health -= 1
		print("Player health: ", body.health)
		
