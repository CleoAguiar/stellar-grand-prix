extends Control

func _ready():
	get_tree().paused = false

func _on_play_button_pressed() -> void:
	AudioManager.play_button()
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")

func _on_settings_button_pressed() -> void:
	AudioManager.play_button()
	get_tree().change_scene_to_file("res://scenes/settings.tscn")

func _on_quit_button_pressed() -> void:
	AudioManager.play_button()
	get_tree().quit()
