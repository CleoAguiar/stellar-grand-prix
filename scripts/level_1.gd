extends Node2D

func _on_maze_body_exited(body: Node2D) -> void:
	get_tree().reload_current_scene()


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
