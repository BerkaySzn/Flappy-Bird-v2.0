extends ParallaxBackground

func _process(delta):
	scroll_base_offset -= Vector2(100,0) * delta
