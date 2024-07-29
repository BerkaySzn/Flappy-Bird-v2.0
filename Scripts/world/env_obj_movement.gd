extends Sprite2D

@export var speed = 50

func _process(delta):
	position.x -= speed * delta
	if position.x < 190:
		queue_free()
