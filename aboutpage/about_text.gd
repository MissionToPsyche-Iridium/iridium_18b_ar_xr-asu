extends RichTextLabel

var scroll_speed = 30  # Speed of scrolling (adjust as needed)
var scroll_position = 0  # Keeps track of how far we've scrolled

func _process(delta):
	# Move text upwards over time
	scroll_position += scroll_speed * delta
	# Set the vertical scroll offset
	scroll_vertical = int(scroll_position)
	
	# Reset scrolling when reaching the end
	if scroll_vertical >= get_v_scroll_bar().max_value:
		scroll_position = 0  # Restart from the beginning
