extends Node

@onready var button_player: AudioStreamPlayer = $ButtonPlayer
@onready var collision_player: AudioStreamPlayer = $CollisionPlayer
@onready var victory_player: AudioStreamPlayer = $VictoryPlayer
@onready var restart_player: AudioStreamPlayer = $RestartPlayer
@onready var music_player: AudioStreamPlayer = $MusicPlayer

var music_enabled: bool = true
var sfx_enabled: bool = true

func _ready() -> void:
	button_player.stream = preload("res://assets/audio/sfx/ui/button_click.ogg")
	collision_player.stream = preload("res://assets/audio/sfx/gameplay/collision.ogg")
	victory_player.stream = preload("res://assets/audio/sfx/events/victory.ogg")
	restart_player.stream = preload("res://assets/audio/sfx/events/restart.ogg")
	music_player.stream = preload("res://assets/audio/music/race_theme.ogg")

func play_button() -> void:
	button_player.play()

func play_collision() -> void:
	collision_player.play()

func play_victory() -> void:
	victory_player.play()

func play_restart() -> void:
	restart_player.play()

func play_music() -> void:
	if not music_player.playing:
		music_player.play()

func stop_music() -> void:
	music_player.stop()

func set_music_enabled(enabled: bool) -> void:
	music_enabled = enabled

	var bus_index = AudioServer.get_bus_index("Music")
	AudioServer.set_bus_mute(bus_index, not enabled)

func set_sfx_enabled(enabled: bool) -> void:
	sfx_enabled = enabled

	var bus_index = AudioServer.get_bus_index("SFX")
	AudioServer.set_bus_mute(bus_index, not enabled)
