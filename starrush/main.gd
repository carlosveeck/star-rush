extends Node2D

@export var tileColors: Array[Color]
@export var tilePrefab: PackedScene
@export var playerPreFab: PackedScene
@export var chosenPreFab: PackedScene
@export var coinPreFab: PackedScene  # Cena da moeda
@export var boardSide: int = 12

@onready var board: Node2D = $board
@onready var hud: Node2D = $HUD
@onready var countdown_timer: Timer = $CountdownTimer
@onready var color_timer: Timer = $ColorTimer

# Tupla que define a tile que spawnará a moeda
var coin_tile_position: Vector2

# Lista de tiles que são bombas
var bomb_tiles: Array[Vector2] = []
var all_tiles: Array[Tile] = []

func _process(delta: float) -> void:
	$CanvasLayer/TimeRemaining.text = "%s" % roundf(countdown_timer.time_left)
	
	
# Função chamada quando o nó entra na cena
func _ready() -> void:
	setup_game()

# Configura o jogo (geração do tabuleiro, escolha da cor, spawn da moeda e bombas)
func setup_game() -> void:
	GlobalColor.global_color_array = tileColors
	
	# Limpa o HUD e o tabuleiro antes de gerar um novo jogo
	for child in hud.get_children():
		child.queue_free()
	for child in board.get_children():
		child.queue_free()
	
	# Escolhe uma nova cor para o round
	var chosenColor: ChosenColor = chosenPreFab.instantiate()
	#hud.add_child(chosenColor)
	var chosenColorRound: int = randi_range(0, tileColors.size() - 1)
	GlobalColor.chosen_color = chosenColorRound
	#chosenColor.color = chosenColorRound
	#chosenColor.modulate = tileColors[chosenColorRound]
	$CanvasLayer/ColorRect.color = tileColors[chosenColorRound]
	# Define uma tile aleatória para spawnar a moeda
	coin_tile_position = Vector2(randi_range(0, boardSide - 1), randi_range(0, boardSide - 1))
	# print("Moeda será spawnada na tile: ", coin_tile_position)
	
	# Define tiles bombas a partir do nível 4
	bomb_tiles.clear()
	if GlobalLevel.curr_level >= 3:
		for x in range(3):  # Seleciona 3 tiles aleatórios como bombas
			var bomb_position = Vector2(randi_range(0, boardSide - 1), randi_range(0, boardSide - 1))
			while bomb_position == coin_tile_position or bomb_position in bomb_tiles:
				bomb_position = Vector2(randi_range(0, boardSide - 1), randi_range(0, boardSide - 1))
			bomb_tiles.append(bomb_position)
		# print("Tiles bombas: ", bomb_tiles)
	
	# Gera o tabuleiro
	for i in boardSide:
		for j in boardSide:
			var tile: Tile = tilePrefab.instantiate()
			board.add_child(tile)
			all_tiles.append(tile)
			tile.position = Vector2(i, j) * tile.get_rect().size * tile.scale
			var color: int = randi_range(0, tileColors.size() - 1)
			tile.color = color
			tile.modulate = tileColors[color]
			tile.is_bomb = false
			
	
			
			# Spawna a moeda na tile correta
			if Vector2(i, j) == coin_tile_position:
				spawn_coin(tile.position)
				
func resetup() -> void:
	GlobalColor.global_color_array = tileColors
	
	# Limpa o HUD e o tabuleiro antes de gerar um novo jogo
	for child in hud.get_children():
		child.queue_free()
	
	
	# Escolhe uma nova cor para o round
	var chosenColor: ChosenColor = chosenPreFab.instantiate()
	#hud.add_child(chosenColor)
	var chosenColorRound: int = randi_range(0, tileColors.size() - 1)
	GlobalColor.chosen_color = chosenColorRound
	$CanvasLayer/ColorRect.color = tileColors[chosenColorRound]
	#chosenColor.color = chosenColorRound
	#chosenColor.modulate = tileColors[chosenColorRound]
	# Define uma tile aleatória para spawnar a moeda
	coin_tile_position = Vector2(randi_range(0, boardSide - 1), randi_range(0, boardSide - 1))
	# print("Moeda será spawnada na tile: ", coin_tile_position)
	var numbom = randi_range(0, all_tiles.size())
	var numbom2 = randi_range(0, all_tiles.size())
	var numbom3 = randi_range(0, all_tiles.size())
	var numoeda = randi_range(0, all_tiles.size())
	var curr = 0
	# Gera o tabuleiro
	for i in all_tiles:
		var color: int = randi_range(0, tileColors.size() - 1)
		i.color = color
		i.modulate = tileColors[color]
		if((curr == numbom) or (curr == numbom2) or (curr == numbom3)):
			if(i._player == null):
				i.is_bomb = true
				i.modulate = Color.RED
		else:
			i.is_bomb = false
			if(curr == numoeda):
				spawn_coin(i.position)
		curr = curr + 1
		

# Spawna a moeda na posição da tile correta
func spawn_coin(position: Vector2) -> void:
	var coin = coinPreFab.instantiate()
	board.add_child(coin)
	coin.position = position
	print("Moeda spawnada na posição: ", coin.position)

# Função chamada quando o timer estoura
func _on_timer_timeout() -> void:
	if GlobalColor.chosen_color == GlobalColor.current_color:
		print("Você venceu!!")
		GlobalLevel.curr_level += 1
		print_debug("Nível atual: ", GlobalLevel.curr_level)
		resetup()  # Reinicia o jogo
		countdown_timer.start()  # Reinicia o timer
		color_timer.start()
	else:
		GlobalLevel.total_coins = 0
		GlobalLevel.curr_level = 0
		get_tree().change_scene_to_file("res://game_over.tscn")
		


func _on_color_timer_timeout() -> void:
	for i in all_tiles:
		i.modulate = Color.WHITE
