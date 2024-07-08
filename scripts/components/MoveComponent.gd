@icon("res://assets/textures/icons/move_icon.svg")

## Gives entities the ability to move
class_name MoveComponent
extends Node

## This is the node you want to control
@export var actor: Node2D
## Velocity of the entity
@export var velocity: Vector2


func _process(delta: float) -> void:
	actor.translate(velocity * delta)
