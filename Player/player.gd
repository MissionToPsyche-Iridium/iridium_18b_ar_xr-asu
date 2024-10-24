extends CharacterBody2D

@export var MAX_SPEED = 300
@export var ACCELERATION = 500
var lives = 3

@onready var axis = 0

func _physics_process(delta: float):
	move(delta)
	

func get_input():
	axis = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	return axis
	
func move(delta):
	axis = get_input()
	if axis != 0:
		# Apply acceleration
		velocity.x += axis * ACCELERATION * delta
		# Limit velocity to max speed
		velocity = velocity.limit_length(MAX_SPEED)
	else:
		pass #do nothing?
	
	# Move (without collisions?)
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D):
	lives -= 1
	if lives == 0:
		queue_free()
	
	
