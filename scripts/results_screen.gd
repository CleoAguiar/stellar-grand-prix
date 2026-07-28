extends Control

@onready var final_time_label: Label = $ColorRect/ButtonContainer/FinalTimeLabel
@onready var best_time_label: Label = $ColorRect/ButtonContainer/BestTimeLabel
@onready var new_record_label: Label = $ColorRect/ButtonContainer/NewRecordLabel

func show_result(track_name: String, final_time_msec: int) -> void:
	var new_record = RecordManager.is_new_record(track_name, final_time_msec)
	
	var best_time = RecordManager.get_record(track_name)
	
	final_time_label.text = "Time: " + format_time(final_time_msec)
	best_time_label.text = "Best: " + format_time(best_time)
	
	if new_record:
		new_record_label.text = "NEW RECORD!"
	else:
		new_record_label.text = ""

func format_time(time_msec: int) -> String:
	var minutes = time_msec / 60000.0
	var seconds = (time_msec % 60000) / 1000.0
	var milliseconds = time_msec % 1000

	return "%02d:%02d.%03d" % [
		minutes,
		seconds,
		milliseconds
	]

func _on_play_again_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")

func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
