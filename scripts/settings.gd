extends Control

func _ready():
	get_tree().paused = false

func _on_back_button_pressed() -> void:
	AudioManager.play_button()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_credits_button_pressed() -> void:
	AudioManager.play_button()
	get_tree().change_scene_to_file("res://scenes/credits.tscn")
