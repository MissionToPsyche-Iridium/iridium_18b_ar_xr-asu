extends ParallaxBackground

func _process(delta: float):
	scroll_base_offset -= Vector2(0, -10) * delta
