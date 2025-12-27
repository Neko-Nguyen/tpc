class_name IdleState extends State;

@onready var walkState: State = $"../Walk";

func enter() -> void:
	player.updateAnimation("idle");

func exit() -> void:
	pass;

func process(_delta: float) -> State:
	if player.direction != Vector2.ZERO: 
		return walkState;
	
	player.velocity = Vector2.ZERO;
	return null;

func physics(_delta: float) -> State:
	return null;

func handleInput(_event: InputEvent) -> State:
	return null;
