extends Timer

var remaining_time = 60  

func contar_ready():
	wait_time = 1  # Define o tempo de espera para 1 segundo
	start()  # Inicia o Timer


func _on_timeout():
	remaining_time -= 1
	if remaining_time <= 0:
		get_tree().change_scene("res://Cenas/game_over.tscn")  # Muda para a cena de Game Over
	else:
		$LabelRegressiva.text = str(remaining_time)  # Atualiza o texto do Label
