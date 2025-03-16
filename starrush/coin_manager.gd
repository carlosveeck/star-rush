extends Control

@onready var coin_counter: Label = $MarginContainer/coins_container/coin_counter as Label

func _ready():
	coin_counter.text = str("%03d" % GlobalLevel.total_coins)

func _process(delta: float) -> void:
	coin_counter.text = str("%03d" % GlobalLevel.total_coins)
