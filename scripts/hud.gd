extends Control

@onready var circuit_label: Label = $MarginContainer/HBoxContainer/LeftBoxContainer/TitleContainer/CircuitLabel
@onready var timer_label: Label = $MarginContainer/HBoxContainer/LeftBoxContainer/TimerLabel
@onready var minimap: TextureRect = $MarginContainer/HBoxContainer/RightBoxContainer/Minimap
@onready var player_icon: TextureRect = $MarginContainer/HBoxContainer/RightBoxContainer/Minimap/PlayerIcon

var player_ref: RigidBody2D = null

var world_min: Vector2 = Vector2(-7400, -6200)
var world_size: Vector2 = Vector2(12672, 7128)


func _process(_delta: float) -> void:
	if is_instance_valid(player_ref):
		update_minimap_position()

func initialize_minimap(player: RigidBody2D) -> void:
	player_ref = player
	player_icon.pivot_offset = player_icon.size / 2

func update_minimap_position() -> void:
	var map_size: Vector2 = minimap.size

	var normalized_player_pos: Vector2 = player_ref.global_position - world_min

	var x_ratio: float = clampf(normalized_player_pos.x / world_size.x, 0.0, 1.0)
	var y_ratio: float = clampf(normalized_player_pos.y / world_size.y, 0.0, 1.0)
	
	var target_x: float = x_ratio * map_size.x
	var target_y: float = y_ratio * map_size.y

	player_icon.position = Vector2(target_x, target_y) - player_icon.pivot_offset
	player_icon.rotation = player_ref.rotation

func set_circuit_label(circuit: String) -> void:
	circuit_label.text = circuit

func update_timer_display(time_left: String) -> void:
	timer_label.text = str(time_left)

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
