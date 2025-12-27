class_name State extends Node;

static var player: Player;

func _ready() -> void:
	pass;

## Happens when the player enters this state.
func enter() -> void:
	pass;

## Happens when the player exits this state.
func exit() -> void:
	pass;

## Happens during the _process update in this state.
## Returns the state after this state.
func process(_delta: float) -> State:
	return null;

## Happens during the _physics_process update in this state.
## Returns the state after this state.
func physics(_delta: float) -> State:
	return null;

## Happens with input events in this state.
## Returns the state after this state.
func handleInput(_event: InputEvent) -> State:
	return null;
