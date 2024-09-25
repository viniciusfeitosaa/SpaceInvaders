extends Node2D


func _on_botao_reiniciar_pressed():
	get_tree().change_scene_to_file("res://Cenas/game.tscn")
