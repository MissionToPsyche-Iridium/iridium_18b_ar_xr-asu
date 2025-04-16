extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_playagain_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Game/world.tscn")

func _on_mainmenu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Game/startscreen.tscn")
	

func _on_one_button_pressed() -> void:
	get_parent().get_node("PartInfoLabel").text = "Gamma-Ray and Neutron Spectrometer\nThe orbiter’s 
	gamma-ray and neutron spectrometer will help scientists determine the chemical elements that 
	make up the asteroid’s surface material. As cosmic rays and high energy particles bombard the 
	asteroid Psyche’s surface, the elements there absorb the energy. In response, they emit neutrons 
	and gamma rays of varying energy levels. The spectrometer can detect "

func _on_two_button_pressed() -> void:
	get_parent().get_node("PartInfoLabel").text = "Magnetometer\nThe orbiter’s magnetometer will 
	look for evidence of an ancient magnetic field at asteroid Psyche. Unlike Earth and other rocky 
	planets that generate a magnetic field in their liquid metallic cores, small bodies like 
	asteroids do not generate one because they are frozen. Confirmation of a remanent magnetic field 
	at Psyche would be strong evidence that the asteroid formed from the core of a planetary body."


func _on_three_button_pressed() -> void:
	get_parent().get_node("PartInfoLabel").text = "Multispectral Imager\nPsyche’s multispectral 
	imager consists of a pair of identical cameras equipped with filters and telescopic lenses to 
	photograph the surface of the asteroid in different wavelengths of light. The cameras can take
	 pictures in the part of the spectrum visible to the human eye, as well as in near-infrared
	 wavelengths of light beyond what humans can see."
	
func _on_four_button_pressed() -> void:
	get_parent().get_node("PartInfoLabel").text = "Gravity Science\nThe Psyche science team will 
	rely on the telecommunications system, primarily used to send commands to and receive data from 
	the spacecraft, to conduct gravity science. By analyzing the X-band radio waves the spacecraft 
	communicates with, scientists can measure how asteroid Psyche affects the spacecraft’s orbit. 
	From that information, scientists can determine the asteroid’s rotation, mass, and gravity field, 
	providing additional clues about the composition and structure of Psyche’s interior."
