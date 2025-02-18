extends Area2D

var rotationSpeed = randf_range(-0.05, 0.05)
var speed = randf_range(1.5, 2.5)
var partNum = 0

func _process(delta: float):
	position.y += speed
	rotate(rotationSpeed)
	if position.y > 800:
		queue_free()
