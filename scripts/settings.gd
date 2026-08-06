extends Control

@onready var music_check_button: CheckButton = $VBoxContainer/MarginContainer/VBoxContainer/MusicCheckButton
@onready var sfx_check_button: CheckButton = $VBoxContainer/MarginContainer/VBoxContainer/SFXCheckButton
@onready var fullscreen_check_button: CheckButton = $VBoxContainer/MarginContainer/VBoxContainer/FullscreenCheckButton

func _ready():
	get_tree().paused = false
	music_check_button.button_pressed = AudioManager.music_enabled
	sfx_check_button.button_pressed = AudioManager.sfx_enabled

func _on_back_button_pressed() -> void:
	AudioManager.play_button()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_credits_button_pressed() -> void:
	AudioManager.play_button()
	get_tree().change_scene_to_file("res://scenes/credits.tscn")

func _on_music_check_button_toggled(toggled_on: bool) -> void:
	AudioManager.set_music_enabled(toggled_on)

func _on_sfx_check_button_toggled(toggled_on: bool) -> void:
	AudioManager.set_sfx_enabled(toggled_on)

func _on_fullscreen_check_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
