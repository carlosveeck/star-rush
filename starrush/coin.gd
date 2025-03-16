extends Sprite2D

class_name Coin

@onready var area2d : Area2D = $Area2D
var coins = 1

func _ready():
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	queue_free()
	GlobalLevel.total_coins += coins
