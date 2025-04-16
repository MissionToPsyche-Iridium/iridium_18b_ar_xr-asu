extends Area2D

var rotationSpeed = randf_range(-0.05, 0.05)
var speed = randf_range(2, 4)
var partNum = 0

func _process(delta: float):
	position.y += speed
	rotate(rotationSpeed)
	if position.y > 1600:
		queue_free()
