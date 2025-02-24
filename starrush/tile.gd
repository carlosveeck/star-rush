extends Sprite2D

class_name Tile

var color:int
var kill : bool
var _player = null

@onready var area2d : Area2D = $Area2D

func _ready():
	# Conectar sinais ou chamar funções da Area2D
	area2d.body_entered.connect(_on_body_entered)
	area2d.body_entered.connect(_on_body_exited)

# Função chamada quando um corpo entra na Area2D
func _on_body_entered(body: Node):
	_player = body
	print("Corpo entrou na área: ", _player)

# Função chamada quando um corpo sai da Area2D
func _on_body_exited(body: Node):
	if body == _player:
		_player = null
	print("Corpo saiu da área: ", _player)
	

func is_player_on_top() -> bool:
	# Obtém a posição do jogador e do bloco
	var player_position = _player.global_position
	var block_position = global_position
	# Define uma margem de erro para a verificação
	var margin = 10  # Ajuste conforme necessário

	# Verifica se o jogador está aproximadamente em cima do bloco
	if abs(player_position.x - block_position.x) < margin and player_position.y < block_position.y:
		return true
	return false
