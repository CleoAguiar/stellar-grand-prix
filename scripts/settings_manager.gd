extends Node

const SETTINGS_PATH := "user://settings.cfg"

var music_enabled: bool = true
var sfx_enabled: bool = true
var fullscreen_enabled: bool = false


func _ready() -> void:
	load_settings()
	apply_settings()


func save_settings() -> void:
	var config := ConfigFile.new()

	config.set_value("audio", "music_enabled", music_enabled)
	config.set_value("audio", "sfx_enabled", sfx_enabled)
	config.set_value("display", "fullscreen_enabled", fullscreen_enabled)

	config.save(SETTINGS_PATH)


func load_settings() -> void:
	var config := ConfigFile.new()

	if config.load(SETTINGS_PATH) != OK:
		return

	music_enabled = config.get_value("audio", "music_enabled", true)
	sfx_enabled = config.get_value("audio", "sfx_enabled", true)
	fullscreen_enabled = config.get_value("display", "fullscreen_enabled", false)


func apply_settings() -> void:
	AudioManager.set_music_enabled(music_enabled)
	AudioManager.set_sfx_enabled(sfx_enabled)

	if fullscreen_enabled:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
