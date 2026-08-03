extends Node

@onready var button_player: AudioStreamPlayer = $ButtonPlayer
@onready var collision_player: AudioStreamPlayer = $CollisionPlayer
@onready var victory_player: AudioStreamPlayer = $VictoryPlayer
@onready var restart_player: AudioStreamPlayer = $RestartPlayer

func _ready() -> void:
	button_player.stream = preload("res://assets/audio/sfx/ui/button_click.ogg")
	collision_player.stream = preload("res://assets/audio/sfx/gameplay/collision.ogg")
	victory_player.stream = preload("res://assets/audio/sfx/events/victory.ogg")
	restart_player.stream = preload("res://assets/audio/sfx/events/restart.ogg")

func play_button() -> void:
	button_player.play()

func play_collision() -> void:
	collision_player.play()

func play_victory() -> void:
	victory_player.play()

func play_restart() -> void:
	restart_player.play()
