extends CharacterBody2D



const SPEED = 300.0
@onready var anim = get_node("AnimationPlayer")


func _physics_process(delta):

	var direction = Input.get_axis("Up", "Down")
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		anim.play("Idle")
	
	move_and_slide()
