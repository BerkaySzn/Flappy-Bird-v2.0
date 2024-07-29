extends ParallaxBackground

func _process(delta):
	scroll_base_offset -= Vector2(75,0) * delta
