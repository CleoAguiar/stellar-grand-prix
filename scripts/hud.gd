extends Control

@onready var circuit_label: Label = $MarginContainer/HBoxContainer/LeftBoxContainer/TitleContainer/CircuitLabel
@onready var timer_label: Label = $MarginContainer/HBoxContainer/LeftBoxContainer/TimerLabel

func set_circuit_label(circuit: String) -> void:
	circuit_label.text = circuit

func update_timer_display(time_left: String) -> void:
	timer_label.text = str(time_left)

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
