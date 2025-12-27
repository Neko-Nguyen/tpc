class_name PlayerStateMachine extends Node;

var states: Array[State];
var previousState: State;
var currentState: State;

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED;

func _process(delta: float) -> void:
	changeState(currentState.process(delta));

func _physics_process(delta: float) -> void:
	changeState(currentState.physics(delta));

func _unhandled_input(event: InputEvent) -> void:
	changeState(currentState.handleInput(event));

## Initialize the state machine with the idle state.
func initialize(_player: Player) -> void:
	states = [];
	
	for i in get_children():
		if i is State: 
			states.append(i);
	
	if states.size() > 0:
		states[0].player = _player;
		changeState(states[0]);
		process_mode = Node.PROCESS_MODE_INHERIT;

## Changes the state of the player to the new state.
func changeState(newState: State) -> void:
	if newState == null || newState == currentState:
		return;
	
	if currentState:
		currentState.exit();
	
	previousState = currentState;
	currentState = newState;
	currentState.enter();
