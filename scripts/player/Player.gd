class_name Player extends CharacterBody2D;

var cardinalDirection: Vector2 = Vector2.DOWN;
var direction: Vector2 = Vector2.ZERO;

@onready var sprite: Sprite2D = $Sprite2D;
@onready var animationPlayer: AnimationPlayer = $AnimationPlayer;
@onready var stateMachine: PlayerStateMachine = $StateMachine;

func _ready() -> void:
	stateMachine.initialize(self);

func _process(delta: float) -> void:
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left");
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up");

func _physics_process(delta: float) -> void:
	move_and_slide();

## Sets the direction.
## Returns true if the direction is changed.
func setDirection() -> bool:
	var newCardinalDirection: Vector2 = cardinalDirection;
	if direction == Vector2.ZERO:
		return false;
	
	if direction.y == 0:
		newCardinalDirection = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT;
	elif direction.x == 0:
		newCardinalDirection = Vector2.UP if direction.y < 0 else Vector2.DOWN;
	
	if newCardinalDirection == cardinalDirection:
		return false;
	
	cardinalDirection = newCardinalDirection;
	return true;

## Changes the animation of the player according to the input state.
func updateAnimation(state: String) -> void:
	animationPlayer.play(state + "_" + getDirectionName());

## Returns the name of the direction
func getDirectionName() -> String:
	if cardinalDirection == Vector2.UP:
		return "up";
	elif cardinalDirection == Vector2.DOWN:
		return "down";
	elif cardinalDirection == Vector2.LEFT:
		return "left";
	elif cardinalDirection == Vector2.RIGHT:
		return "right";
	else:
		return "";
