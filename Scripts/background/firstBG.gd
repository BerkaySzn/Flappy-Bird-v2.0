extends ParallaxBackground

func _process(delta):
	scroll_base_offset -= Vector2(300,0) * delta
