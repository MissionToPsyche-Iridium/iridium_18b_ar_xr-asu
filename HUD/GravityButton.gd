extends TextureButton

@onready var popup = $Popup
@onready var lab = $Popup/Label
func _on_pressed():
	showPopup()

func showPopup():
	popup.show()
	lab.text = "The Psyche science team will rely on the telecommunications system, primarily used to send commands to and receive data from the spacecraft, to conduct gravity science. By analyzing the X-band radio waves the spacecraft communicates with, scientists can measure how asteroid Psyche affects the spacecraft’s orbit. From that information, scientists can determine the asteroid’s rotation, mass, and gravity field, providing additional clues about the composition and structure of Psyche’s interior."
	
