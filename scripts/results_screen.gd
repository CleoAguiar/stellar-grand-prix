extends Control

func _on_play_again_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")

func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
