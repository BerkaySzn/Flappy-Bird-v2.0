extends ParallaxBackground

func _process(delta):
	scroll_base_offset -= Vector2(200,0) * delta
