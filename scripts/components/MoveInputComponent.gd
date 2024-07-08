@icon("res://assets/textures/icons/move_input_icon.svg")
## Gives the move component access to user input
class_name MoveInputComponent
extends Node


## Entity stats
@export var stat : Stats
## Move component
@export var move_component : MoveComponent

## Movement speed
var movement_speed : float


func _ready() -> void:
	if stat != null:
		movement_speed = stat.speed


func _unhandled_input(_event: InputEvent) -> void:
	var input_axis = Input.get_vector("move_left", "move_right","move_up","move_down")
	move_component.velocity = input_axis * movement_speed
