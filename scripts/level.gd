extends Node2D

@export var is_final_level: bool = false

@onready var ui: CanvasLayer = $Graphics/UI
@onready var hud: Control = $Graphics/UI/HUD
@onready var player: RigidBody2D = $Player

var circuit: String = "Starlif Circuit"
var start_time: int = 0
var elapsed_time_msec: int = 0
var is_timer_running: bool = false


func _ready() -> void:
	hud.set_circuit_label(circuit)
	hud.initialize_minimap(player)
	start_race()

func _process(_delta: float) -> void:
	if is_timer_running:
		elapsed_time_msec = Time.get_ticks_msec() - start_time
		update_clock_ui()

func start_race() -> void:
	start_time = Time.get_ticks_msec()
	is_timer_running = true

func update_clock_ui() -> void:
	var total_seconds: int = floori(elapsed_time_msec / 1000.0)

	var minutes: int = floori(total_seconds / 60.0)
	var seconds: int = total_seconds % 60

	var hundredths: int = floori((elapsed_time_msec % 1000) / 10.0)

	var time_string: String = "%02d:%02d.%02d" % [minutes, seconds, hundredths]
	hud.update_timer_display(time_string)

func stop_race() -> void:
	is_timer_running = false

func _on_maze_body_exited(_body: Node2D) -> void:
	get_tree().reload_current_scene()

func _on_exit_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if body.has_method("stop_moviment"):
			body.stop_moviment()
		stop_race()
		await get_tree().create_timer(1.5).timeout
		ui.show_results_screen(true)
