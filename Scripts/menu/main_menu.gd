extends Control

@onready var start = $MarginContainer/VBoxContainer/Start
@onready var options = $MarginContainer/VBoxContainer/Options
@onready var quit = $MarginContainer/VBoxContainer/Quit


func _ready():
	pass


func _on_start_pressed():
	pass # Start The Game


func _on_options_pressed():
	pass # Show Options Menu


func _on_quit_pressed():
	get_tree().quit()
