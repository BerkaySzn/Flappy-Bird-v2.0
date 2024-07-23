extends Control




func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/world/world.tscn")


func _on_settings_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu/options_menu.tscn")


func _on_quit_pressed():
	get_tree().quit()
