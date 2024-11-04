extends Area2D

var rotationSpeed = randf_range(-0.05, 0.05)

func _process(delta: float):
	position.y += 2
	rotate(rotationSpeed)
	if position.y > 800:
		queue_free()
