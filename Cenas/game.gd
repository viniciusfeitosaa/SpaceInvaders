extends Node

var pontos = 0
@onready var label_pontos = $VBoxContainer/LabelPontos



func Somar_pontos_alien():
	pontos += 100
	label_pontos.text = str(pontos)

func somar_bonus():
	pontos += 500
	label_pontos.text = str(pontos)
	
#///////////////////////// Timer Regressivo :

@onready var timer_regressiva = $"Contagem Regressiva/TimerRegressiva"
@onready var label_regressiva = $"Contagem Regressiva/LabelRegressiva"

var time_left = 40  # Tempo inicial em segundos

func _ready():
	if timer_regressiva:
		timer_regressiva.connect("timeout", Callable(self, "_on_timer_regressiva_timeout"))
		timer_regressiva.start(1)  # Inicia o Timer com intervalo de 1 segundo
	if label_regressiva:
		label_regressiva.text = str(time_left)  # Atualiza o texto do Label inicialmente

func _on_timer_regressiva_timeout():
	time_left -= 1
	if time_left <= 0:
		time_left = 0
		game_over()
	else:
		update_timer_display()

func update_timer_display():
	if label_regressiva:
		label_regressiva.text = str(time_left)

func game_over():
	get_tree().change_scene_to_file("res://Cenas/game.tscn") 
