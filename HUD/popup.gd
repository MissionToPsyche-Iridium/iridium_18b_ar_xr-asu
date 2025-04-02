extends TextureButton

@onready var popup = $Popup
@onready var lab = $Popup/Label
func _on_pressed():
	showPopup()

func showPopup():
	popup.show()
	lab.text = "The orbiter’s gamma-ray and neutron spectrometer will help scientists determine the chemical elements that make up the asteroid’s surface material. 
	As cosmic rays and high energy particles bombard the asteroid Psyche’s surface, the elements there absorb the energy. 
	In response, they emit neutrons and gamma rays of varying energy levels. 
	The spectrometer can detect these emissions, enabling scientists to match them to properties of known elements to determine what Psyche is made of."
	
