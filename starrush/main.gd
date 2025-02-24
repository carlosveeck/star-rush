extends Node2D

@export var tileColors: Array [Color]

@export var tilePrefab : PackedScene
@export var playerPreFab : PackedScene
@export var chosenPreFab : PackedScene
@export var boardSide : int = 8


@onready var board: Node2D = $board
@onready var hud: Node2D = $HUD



func _process(delta: float) -> void:
	$TimeRemaining.text = "%s" % roundf($CountdownTimer.time_left)
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var chosenColor:ChosenColor = chosenPreFab.instantiate()
	hud.add_child(chosenColor)
	var chosenColorRound:int = randi_range(0, tileColors.size() - 1)
	chosenColor.color = chosenColorRound
	chosenColor.modulate = tileColors[chosenColorRound]
	for i in boardSide:
		for j in boardSide:
			var tile:Tile = tilePrefab.instantiate()
			board.add_child(tile)
			tile.position = Vector2(i, j) * tile.get_rect().size * tile.scale
			var color:int = randi_range(0, tileColors.size() - 1)
			tile.color = color
			tile.modulate = tileColors[color]
			if color == chosenColorRound:
				tile.kill = true


func _on_timer_timeout() -> void:
	pass  # Replace with function body.
