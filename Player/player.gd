extends CharacterBody2D

@export var MAX_SPEED = 300
@export var ACCELERATION = 300
var lives = 3
var deadHeart = preload("res://Dead Heart.png")
var parts = 0
var gameOver = false
var t = 0
var partsCol = [0, 0, 0, 0]


var gammaRayNeutrSpect = preload("res://gammaRayNeutrSpect.png") #1
var bigGam = preload("res://bigGam.png")
var magnetometer = preload("res://magentometer.png") #2
var bigMag = preload("res://bigMag.png")
var multSpectImage = preload("res://multSpectImage.png") #3
var bigSpec = preload("res://bigImag.png")
var radioScience = preload("res://radioScience.png") #4
var bigRad = preload("res://bigGrav.png")

var finalPartsOnePos = Vector2(320, 320)
var finalPartsTwoPos = Vector2(640, 320)
var finalPartsThreePos = Vector2(320, 640)
var finalPartsFourPos = Vector2(640, 640)
var finalPartsScale = Vector2(5, 5)

@onready var axis = 0


func _physics_process(delta: float):
	move(delta)
	
	if gameOver:
		t += delta * 0.1
		print(t)
		get_parent().get_node("HUD").get_node("PartsOne").position = get_parent().get_node("HUD").get_node("PartsOne").position.lerp(finalPartsOnePos, t)
		get_parent().get_node("HUD").get_node("PartsOne").scale = get_parent().get_node("HUD").get_node("PartsOne").scale.lerp(finalPartsScale, t)
		get_parent().get_node("HUD").get_node("PartsTwo").position = get_parent().get_node("HUD").get_node("PartsTwo").position.lerp(finalPartsTwoPos, t * 1.5)
		get_parent().get_node("HUD").get_node("PartsTwo").scale = get_parent().get_node("HUD").get_node("PartsTwo").scale.lerp(finalPartsScale, t * 1.5)
		get_parent().get_node("HUD").get_node("PartsThree").position = get_parent().get_node("HUD").get_node("PartsThree").position.lerp(finalPartsThreePos, t * 1.5)
		get_parent().get_node("HUD").get_node("PartsThree").scale = get_parent().get_node("HUD").get_node("PartsThree").scale.lerp(finalPartsScale, t * 1.5)
		get_parent().get_node("HUD").get_node("PartsFour").position = get_parent().get_node("HUD").get_node("PartsFour").position.lerp(finalPartsFourPos, t * 2)
		get_parent().get_node("HUD").get_node("PartsFour").scale = get_parent().get_node("HUD").get_node("PartsFour").scale.lerp(finalPartsScale, t * 2)
		if t > 0.15:
			if parts >= 4:
				get_parent().get_node("HUD").get_node("Label").text = "Mission Successful!\n Tap on each component to learn more about them."
			if lives <= 0:
				get_parent().get_node("HUD").get_node("Label").text = "Mission Failed!\n Tap on each component to learn more about them or try again."
			if partsCol[0] == 1:
				get_parent().get_node("HUD").get_node("PartsOne").texture = bigGam
				get_parent().get_node("HUD").get_node("PartsOne").get_node("Button").visible = true
				get_parent().get_node("HUD").get_node("PartsOne").get_node("Button").size = Vector2(300, 300)
				get_parent().get_node("HUD").get_node("PartsOne").get_node("Button").position = Vector2(-150, -150)
				get_parent().get_node("HUD").get_node("PartsOne").scale = Vector2(1, 1)
			if partsCol[1] == 1:
				get_parent().get_node("HUD").get_node("PartsTwo").texture = bigMag
				get_parent().get_node("HUD").get_node("PartsTwo").get_node("Button").visible = true
				get_parent().get_node("HUD").get_node("PartsTwo").get_node("Button").size = Vector2(300, 300)
				get_parent().get_node("HUD").get_node("PartsTwo").get_node("Button").position = Vector2(-150, -150)
				get_parent().get_node("HUD").get_node("PartsTwo").scale = Vector2(1, 1)
			if partsCol[2] == 1:
				get_parent().get_node("HUD").get_node("PartsThree").texture = bigSpec
				get_parent().get_node("HUD").get_node("PartsThree").get_node("Button").visible = true
				get_parent().get_node("HUD").get_node("PartsThree").get_node("Button").size = Vector2(300, 300)
				get_parent().get_node("HUD").get_node("PartsThree").get_node("Button").position = Vector2(-150, -150)
				get_parent().get_node("HUD").get_node("PartsThree").scale = Vector2(1, 1)
			if partsCol[3] == 1:
				get_parent().get_node("HUD").get_node("PartsFour").texture = bigRad
				get_parent().get_node("HUD").get_node("PartsFour").get_node("Button").visible = true
				get_parent().get_node("HUD").get_node("PartsFour").get_node("Button").size = Vector2(300, 300)
				get_parent().get_node("HUD").get_node("PartsFour").get_node("Button").position = Vector2(-150, -150)
				get_parent().get_node("HUD").get_node("PartsFour").scale = Vector2(1, 1)
			
			get_parent().get_node("HUD").get_node("Control").get_node("PlayAgain").get_node("Button").visible = true
			get_parent().get_node("HUD").get_node("Control").get_node("MainMenu").get_node("Button").visible = true

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


func handleDebrisCollision():
	if gameOver == true:
		pass
	if (lives == 3):
		get_parent().get_node("HUD").get_node("LivesThree").texture = deadHeart
	elif (lives == 2):
		get_parent().get_node("HUD").get_node("LivesTwo").texture = deadHeart
	elif (lives == 1):
		get_parent().get_node("HUD").get_node("LivesOne").texture = deadHeart
	lives -= 1
	if lives == 0:
		gameOver = true
		# get_parent().get_node("HUD").get_node("GameOver").text = "Game Over!\nYou Lose :("
		# get_parent().get_node("HUD").get_node("GameOver").label_settings.font_color = Color(1, 0, 0, 1)
		# queue_free()

func handlePartCollision(area: Area2D):
	parts += 1
	get_parent().get_node("HUD").get_node("PartsCount").text = "Parts Collected: " + str(parts)
	if (area.partNum == 1):
		get_parent().get_node("HUD").get_node("PartsOne").texture = gammaRayNeutrSpect
		partsCol[0] = 1
	elif (area.partNum == 2):
		get_parent().get_node("HUD").get_node("PartsTwo").texture = magnetometer
		partsCol[1] = 1
	elif (area.partNum == 3):
		get_parent().get_node("HUD").get_node("PartsThree").texture = multSpectImage
		partsCol[2] = 1
	else:
		get_parent().get_node("HUD").get_node("PartsFour").texture = radioScience
		partsCol[3] = 1
	if (parts >= 4):
		gameOver = true
		# get_parent().get_node("HUD").get_node("GameOver").text = "Game Over!\nYou Win! :)"
		# get_parent().get_node("HUD").get_node("GameOver").label_settings.font_color = Color(0, 1, 0, 1)

func _on_area_2d_area_entered(area: Area2D):
	if (gameOver):
		return
	if (area.get_meta("Type") == "debris"):
		handleDebrisCollision()
		area.queue_free()
	else:
		handlePartCollision(area)
		area.queue_free()

	
	
	
	
