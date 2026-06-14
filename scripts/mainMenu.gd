extends Control

func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://scene/MainGame.tscn")

func _on_options_pressed():
	print("Options menu (not implemented yet)")

func _on_quit_game_pressed() -> void:
	get_tree().quit()
