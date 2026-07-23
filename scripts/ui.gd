extends CanvasLayer

@onready var results_screen: Control = $ResultsScreen

func show_results_screen(flag: bool) -> void:
	results_screen.visible = flag
