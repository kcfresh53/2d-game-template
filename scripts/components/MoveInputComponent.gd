@icon("res://assets/textures/icons/move_input_icon.svg")
## Gives the move component access to user input
class_name MoveInputComponent
extends Node


## Entity stats
@export var stat : PlayerStats
## Move component
@export var move_component : MoveComponent
## Toggles input control
@export var active : bool = true
## Left input
@export var left_input : String = "ui_left"
## Right input
@export var right_input : String = "ui_right"
## Up input
@export var up_input : String = "ui_up"
## Down input
@export var down_input : String = "ui_down"

# Movement speed
var _movement_speed : float

## Signal to emit the last direction pressed
signal last_direction_pressed(direction: String)


func _ready() -> void:
	if stat != null:
		_movement_speed = stat.movement_speed


func _unhandled_input(_event: InputEvent) -> void:
	if !active:
		return
	
	var input_axis = Input.get_vector(left_input, right_input, up_input, down_input)
	move_component.velocity = input_axis * _movement_speed
	
	# Dictionary to map input actions to directions
	var directions = {
		left_input: "left",
		right_input: "right",
		up_input: "up",
		down_input: "down"
	}
	
	# Iterate through the dictionary and emit the signal for the first action pressed
	for action in directions.keys():
		if Input.is_action_pressed(action):
			last_direction_pressed.emit(directions[action])
			break


func disable_input() -> void:
	move_component.velocity = Vector2.ZERO
	active = false
