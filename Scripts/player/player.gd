extends CharacterBody2D
@onready var timer = $Timer


const SPEED = 300.0
@onready var anim = get_node("AnimationPlayer")

#health variables
var is_dead = false
var current_health: int = 3



func _physics_process(delta):
	var direction = Input.get_axis("Up", "Down")
	print(direction)
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		anim.play("Idle")

		#print(current_health)

	
	
	move_and_slide()


	if current_health <= 0 and is_dead == false :

		
		
func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Scenes/menu/menu.tscn")
