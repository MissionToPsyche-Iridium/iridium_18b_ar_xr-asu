extends Control

func _ready() -> void:
	$VBoxContainer/Start.grab_focus()

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Game/world.tscn")

func _on_about_pressed():
	get_tree().change_scene_to_file("res://Game/about.tscn")

func _on_quit_pressed():
	get_tree().quit()
