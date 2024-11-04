extends CharacterBody2D

@export var speed: float = 200.0

@warning_ignore("unused_parameter")
func _physics_process(delta):
	# Get input from the user
	var input_vector = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		input_vector.x += 1  # Move right
	if Input.is_action_pressed("ui_left"):
		input_vector.x -= 1  # Move left

	# Normalize the vector to ensure consistent speed in diagonal movement
	input_vector = input_vector.normalized()

	# Set the velocity based on input
	velocity.x = input_vector.x * speed

	move_and_slide()
