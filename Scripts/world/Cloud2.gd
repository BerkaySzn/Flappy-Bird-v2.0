extends ParallaxBackground

func _process(delta):
	scroll_base_offset -= Vector2(40,0) * delta
