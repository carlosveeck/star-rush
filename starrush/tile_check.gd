extends Area2D

var _player = null

func _ready():
	# Conecta os sinais body_entered e body_exited
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node2D):
	_player = body
	print_debug("player entrou na área")

func _on_body_exited(body: Node2D):
	if body == _player:
		_player = null
	print_debug("player saiu da área")
