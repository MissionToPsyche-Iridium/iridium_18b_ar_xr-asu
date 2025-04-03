extends TextureButton

@onready var popup = $Popup
@onready var lab = $Popup/Label
func _on_pressed():
	showPopup()

func showPopup():
	popup.show()
	lab.text = "The orbiter’s magnetometer will look for evidence of an ancient magnetic field at asteroid Psyche. Unlike Earth and other rocky planets that generate a magnetic field in their liquid metallic cores, small bodies like asteroids do not generate one because they are frozen. Confirmation of a remanent magnetic field at Psyche would be strong evidence that the asteroid formed from the core of a planetary body."
