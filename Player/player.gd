extends CharacterBody2D
@export var MAX_SPEED = 300
@export var ACCELERATION = 500
var lives = 3
var deadHeart = preload("res://Dead Heart.png")
var imager = preload("res://Imagero.png")
var magneto = preload("res://magneto.png")
var gamma = preload("res://gamma.png")
var grav = preload("res://grav.png")
var parts = 0
var gameOver = false

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


func handleDebrisCollision():
	if (lives == 3):
		get_parent().get_node("HUD").get_node("LivesThree").texture = deadHeart
	elif (lives == 2):
		get_parent().get_node("HUD").get_node("LivesTwo").texture = deadHeart
	elif (lives == 1):
		get_parent().get_node("HUD").get_node("LivesOne").texture = deadHeart
	lives -= 1
	if lives == 0:
		gameOver = true
		get_parent().get_node("HUD").get_node("TextureButton").visible = true
		get_parent().get_node("HUD").get_node("TextureButton2").visible = true
		get_parent().get_node("HUD").get_node("TextureButton3").visible = true
		get_parent().get_node("HUD").get_node("TextureButton4").visible = true
		get_parent().get_node("HUD").get_node("GameOver").text = "You lost"
		get_parent().get_node("HUD").get_node("GameOver").label_settings.font_color = Color(1, 0, 0, 1)
		queue_free()

func handlePartCollision(area: Area2D):
	parts += 1
	get_parent().get_node("HUD").get_node("PartsCount").text = "Parts Collected: " + str(parts)
	if (area.partNum == 1):
		get_parent().get_node("HUD").get_node("PartsOne").texture = imager
	elif (area.partNum == 2):
		get_parent().get_node("HUD").get_node("PartsTwo").texture = magneto
	elif (area.partNum == 3):
		get_parent().get_node("HUD").get_node("PartsThree").texture = gamma
	else:
		get_parent().get_node("HUD").get_node("PartsFour").texture = grav
	if (parts >= 4):
		gameOver = true
		get_parent().get_node("HUD").get_node("TextureButton").visible = true
		get_parent().get_node("HUD").get_node("TextureButton2").visible = true
		get_parent().get_node("HUD").get_node("TextureButton3").visible = true
		get_parent().get_node("HUD").get_node("TextureButton4").visible = true
		get_parent().get_node("HUD").get_node("GameOver").text = "You win"
		get_parent().get_node("HUD").get_node("GameOver").label_settings.font_color = Color(0, 1, 0, 1)

func _on_area_2d_area_entered(area: Area2D):
	if (gameOver):
		return
	if (area.get_meta("Type") == "debris"):
		handleDebrisCollision()
		area.queue_free()
	else:
		handlePartCollision(area)
		area.queue_free()
	
	
	
	
	
