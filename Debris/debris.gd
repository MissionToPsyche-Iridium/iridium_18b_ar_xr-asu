extends Area2D



func _process(delta: float):
	position.y += 2
	if position.y > 800:
		queue_free()
