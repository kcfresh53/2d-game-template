@icon("res://assets/textures/icons/move_input_icon.svg")
## Gives the move component access to user input
class_name MoveInputComponent
extends Node


## Entity stats
@export var stat : PlayerStats
## Move component
@export var move_component : MoveComponent
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


func _ready() -> void:
	if stat != null:
		_movement_speed = stat.movement_speed


func _unhandled_input(_event: InputEvent) -> void:
	var input_axis = Input.get_vector(left_input, right_input, up_input, down_input)
	move_component.velocity = input_axis * _movement_speed
