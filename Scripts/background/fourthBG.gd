extends ParallaxBackground

func _process(delta):
	scroll_base_offset -= Vector2(10,0) * delta
