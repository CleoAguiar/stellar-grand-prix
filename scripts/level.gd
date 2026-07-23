extends Node2D

@onready var hud: Control = $Graphics/UI/HUD
#@onready var game_timer: Timer = $Timer
@onready var player: RigidBody2D = $Player

var circuit: String = "Starlif Circuit"
var start_time: int = 0
var elapsed_time_msec: int = 0
var is_timer_running: bool = false


func _ready() -> void:
	hud.set_circuit_label(circuit)
	hud.initialize_minimap(player)
	start_race()

func _process(delta: float) -> void:
	if is_timer_running:
		elapsed_time_msec = Time.get_ticks_msec() - start_time
		update_clock_ui()

func start_race() -> void:
	start_time = Time.get_ticks_msec()
	is_timer_running = true

func update_clock_ui() -> void:
	var total_seconds: int = elapsed_time_msec / 1000

	var minutes: int = total_seconds / 60
	var seconds: int = total_seconds % 60

	var hundredths: int = (elapsed_time_msec % 1000) / 10

	var time_string: String = "%02d:%02d.%02d" % [minutes, seconds, hundredths]
	hud.update_timer_display(time_string)

func stop_race() -> void:
	is_timer_running = false

func _on_maze_body_exited(body: Node2D) -> void:
	get_tree().reload_current_scene()

func _on_exit_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		stop_race()
