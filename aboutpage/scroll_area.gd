extends ScrollContainer

var scroll_speed = 50  # Adjust this value for faster/slower scrolling
var scroll_position = 0  # Keeps track of scrolling

func _process(delta):
	# Move the scroll down over time
	scroll_vertical += scroll_speed * delta
	
	# Reset scrolling when reaching the end
	if scroll_vertical >= get_v_scroll_bar().max_value:
		scroll_vertical = 0  # Restart from the beginning
