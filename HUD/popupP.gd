extends TextureButton

@onready var popup = $Popup
@onready var lab = $Popup/Label
func _on_pressed():
	showPopup()

func showPopup():
	popup.show()
	lab.text = "Psyche’s multispectral imager consists of a pair of identical cameras equipped with filters and telescopic lenses to photograph the surface of the asteroid in different wavelengths of light.
	 The cameras can take pictures in the part of the spectrum visible to the human eye, as well as in near-infrared wavelengths of light beyond what humans can see.
"
