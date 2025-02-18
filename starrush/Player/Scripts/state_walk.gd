class_name State_Walk extends State

@export var move_speed : float = 100.0

@onready var idle : State = $"../Idle"

## O que acontece quando o jogador entra em algum estado
func Enter() -> void:
	player.UpdateAnimation("walk")
	pass

## O que acontece quando sai do estado
func Exit() -> void:
	pass

## O que acontece durante o update de _process nesse estado
func Process (_delta : float) -> State:
	if player.direction == Vector2.ZERO:
		return idle
	
	player.velocity = player.direction * move_speed
	
	if player.SetDirection():
		player.UpdateAnimation("walk")
		
	return null

## o que acontece em _physics_process nesse estado
func Physics (_delta : float) -> State:
	return null

## o que acontece com os inputs nesse estado
func HandleInput (_event : InputEvent) -> State:
	return null
