extends Node2D

var debrisScene = preload("res://Debris/debris.tscn")
var partScene = preload("res://Part/part.tscn")
var enemyTextOne = preload("res://EnemySpriteOne.png")
var enemyTextTwo = preload("res://EnemySpriteTwo.png")
var enemyTextThree = preload("res://EnemySpriteThree.png")
var gammaRayNeutrSpect = preload("res://gammaRayNeutrSpect.png") #1
var magnetometer = preload("res://magentometer.png") #2
var multSpectImage = preload("res://multSpectImage.png") #3
var radioScience = preload("res://radioScience.png") #4
var partDelay = 0
var partTracker = [0, 0, 0, 0]
var partCounter = 0 # Used for selecting the right 


func _on_timer_timeout() -> void:
	partDelay = partDelay + 1
	if (partDelay >= 8 and partCounter < 4):
		partDelay = 0
		partTracker[partCounter] = 1
		var part = partScene.instantiate()
		partCounter = partCounter + 1
		part.partNum = partCounter
		part.position = Vector2(randf_range(50, 450), randf_range(-250, -50))
		if (partCounter == 1):
			part.get_node("Sprite2D").texture = gammaRayNeutrSpect
		elif(partCounter == 2):
			part.get_node("Sprite2D").texture = magnetometer
		elif(partCounter == 3):
			part.get_node("Sprite2D").texture = multSpectImage
		elif(partCounter == 4):
			part.get_node("Sprite2D").texture = radioScience
		add_child(part)
	
	
	
	
	var debrisOne = debrisScene.instantiate()
	var debrisTwo = debrisScene.instantiate()
	debrisOne.position = Vector2(randf_range(50, 250), randf_range(-250, -50))
	debrisTwo.position = Vector2(randf_range(250, 450), randf_range(-250, -50))
	var rand = randi_range(1, 3)
	if (rand == 1):
		debrisOne.get_node("Sprite2D").texture = enemyTextOne
	elif (rand == 2):
		debrisOne.get_node("Sprite2D").texture = enemyTextTwo
	else:
		debrisOne.get_node("Sprite2D").texture = enemyTextThree
	rand = randi_range(1, 3)
	if (rand == 1):
		debrisTwo.get_node("Sprite2D").texture = enemyTextOne
	elif (rand == 2):
		debrisTwo.get_node("Sprite2D").texture = enemyTextTwo
	else:
		debrisTwo.get_node("Sprite2D").texture = enemyTextThree
	add_child(debrisOne)
	add_child(debrisTwo)
