@icon("res://assets/textures/icons/heart_icon.svg")

## Handles health
class_name HealthComponent
extends Node2D

## Entity stats
@export var stat : Stats

# Entity health property
var _health : float
# Entity maximum health property
var _max_health : float


## Is emited when damage occurs
signal damage_taken(value : float)
## Is emited when health is changed
signal health_changed(health : float)
## Is emited when health is depleted
signal health_depleted


func _ready() -> void:
	if stat != null:
		_health = stat.health
		_max_health = stat.health


## Reduces the health by the provided value
func damage(value : float) -> void:
	if _health >= 1:
		_health = clamp(_health - value, 0, _max_health)
		health_changed.emit(_health)
	
	damage_taken.emit(value)
	
	if _health == 0:
		health_depleted.emit()


## Adds value to health property
func increase_max_health(value : float) -> void:
	_max_health = clamp(_max_health + value, 0, _max_health)
	health_changed.emit(_health)
