extends CanvasLayer

@onready var results_screen: Control = $ResultsScreen

func show_results_screen(track_name: String, final_time: float) -> void:
	results_screen.visible = true
	results_screen.show_result(track_name, final_time)
