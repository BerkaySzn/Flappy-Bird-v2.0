extends CharacterBody2D
@onready var timer = $Timer

var is_dead = false
var health = 3
const SPEED = 300.0
@onready var anim = get_node("AnimationPlayer")


func _physics_process(delta):
	var direction = Input.get_axis("Up", "Down")
	print(direction)
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		anim.play("Idle")
		#print(health)
	
	
	move_and_slide()

	if health <= 0 and is_dead == false :
		is_dead = true
		timer.start()
		
		
func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Scenes/menu/menu.tscn")
