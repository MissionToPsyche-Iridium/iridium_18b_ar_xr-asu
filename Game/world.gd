extends Node2D

var debrisScene = preload("res://Debris/debris.tscn")



func _on_timer_timeout() -> void:
	var debrisOne = debrisScene.instantiate()
	var debrisTwo = debrisScene.instantiate()
	debrisOne.position = Vector2(randf_range(50, 250), randf_range(-250, -50))
	debrisTwo.position = Vector2(randf_range(250, 450), randf_range(-250, -50))
	add_child(debrisOne)
	add_child(debrisTwo)
