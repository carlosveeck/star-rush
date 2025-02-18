class_name State extends Node

## referência ao jogador ao qual o estado pertence
static var player : Player 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

## O que acontece quando o jogador entra em algum estado
func Enter() -> void:
	pass

## O que acontece quando sai do estado
func Exit() -> void:
	pass

## O que acontece durante o update de _process nesse estado
func Process (_delta : float) -> State:
	return null

## o que acontece em _physics_process nesse estado
func Physics (_delta : float) -> State:
	return null

## o que acontece com os inputs nesse estado
func HandleInput (_event : InputEvent) -> State:
	return null
