extends Node

const SAVE_FILE := "user://save.cfg"

func get_record(track_name: String) -> int:
	var config = ConfigFile.new()

	if config.load(SAVE_FILE) != OK:
		return -1.0

	return config.get_value("records", track_name, -1.0)


func save_record(track_name: String, time_msec: int) -> void:
	var config = ConfigFile.new()

	config.load(SAVE_FILE)

	config.set_value("records", track_name, time_msec)

	config.save(SAVE_FILE)


func is_new_record(track_name: String, time_msec: int) -> bool:
	var current_record = get_record(track_name)

	if current_record == -1 or time_msec < current_record:
		save_record(track_name, time_msec)
		return true

	return false
