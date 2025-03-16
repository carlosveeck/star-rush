extends Sprite2D

class_name Tile

var color:int
var tile_id : int
var _player = null
var is_bomb : bool

@onready var area2d : Area2D = $Area2D

@export var chosenPreFab : PackedScene


func _ready():
	# Conectar sinais ou chamar funções da Area2D
	area2d.body_entered.connect(_on_body_entered)
	area2d.body_entered.connect(_on_body_exited)


# Função chamada quando um corpo entra na Area2D
func _on_body_entered(body: Node):
	_player = body
	GlobalColor.current_color = color
	if is_bomb:
		get_tree().change_scene_to_file("res://game_over.tscn")
	## print(GlobalColor.current_color)
	## print("Corpo entrou na área: ", _player)
	
# Função chamada quando um corpo sai da Area2D
func _on_body_exited(body: Node):
	if body == _player:
		_player = null
	## print("Corpo saiu da área: ", _player)

func _on_color_timer_timeout() -> void:
	modulate = Color(1,1,1)

func _on_end_timer_timeout() -> void:
	modulate = GlobalColor.global_color_array[color]
