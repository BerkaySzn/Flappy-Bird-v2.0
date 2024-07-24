extends Node

@export var pipe_scene: PackedScene # Drag and drop your pipe scene here

func _ready():
	$SpawnTimer.start()

func _on_spawn_timer_timeout():
	var wall = pipe_scene.instantiate()
	wall.position = Vector2(1024, 624) # The new wall will spawn at that point
	add_child(wall)

