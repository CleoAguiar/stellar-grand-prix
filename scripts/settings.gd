extends Control

@onready var settings: Button = $VBoxContainer/Settings
@onready var fullscreen_button: Button = $VBoxContainer/FullscreenButton
@onready var controls_button: Button = $VBoxContainer/ControlsButton
@onready var credits_button: Button = $VBoxContainer/CreditsButton

func _ready():
	get_tree().paused = false

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/credits.tscn")
