extends Node2D

@export var SPEED = -100 # Movement speed of the wall, it must be negative number
func _ready():
	pass # Replace with function body.


func _process(delta):
	position.x += SPEED * delta
	if position.x < 352: # If the pipe goes off the screen, you can use 352 for testing
		queue_free() # Remove the pipe
