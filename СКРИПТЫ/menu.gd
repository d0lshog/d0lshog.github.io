extends Control

const Music = preload("res://МУЗЫКА/Half-life - Мюзикл.mp3")

func _on_button_2_toggled(Music_Play):
	MusicController.stream_paused = Music_Play


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://СЦЕНЫ/GAME.tscn")
