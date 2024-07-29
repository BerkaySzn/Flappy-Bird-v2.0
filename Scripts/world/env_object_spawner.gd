extends Node2D

@export var flower1_scene = PackedScene
@export var flower2_scene = PackedScene
@export var rock1_scene = PackedScene
@export var rock2_scene = PackedScene
@export var rock3_scene = PackedScene

var object_list = []
var random_scene: PackedScene

var timer: Timer
var time_check = true

func _ready():
	object_list = [flower1_scene, flower2_scene, rock1_scene, rock2_scene, rock3_scene]
	timer = $SpawnTimer

func _process(delta):
	if time_check:
		time_check = false
		timer.wait_time = randi_range(1, 3)
		timer.start()
	
func _on_spawn_timer_timeout():
	if !time_check:
		time_check = true
		random_scene = object_list[randi() % object_list.size()]
		
		var instance = random_scene.instantiate()
		
		# Set the position of the new instance to the specified location
		instance.position = Vector2(820, 597)
		add_child(instance)

