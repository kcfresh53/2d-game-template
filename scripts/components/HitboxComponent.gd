@icon("res://assets/textures/icons/hitbox_icon.svg")

## The hitbox component communicates with the health component to deal damage.
class_name HitboxComponent
extends Area2D

## Health box component
@export var healthComponent : HealthComponent


func _ready() -> void:
	if healthComponent == null:
		printerr(name + ": Health component is not assigned.")
	area_entered.connect(attack.unbind(1))


## Is called when a damage component enters the hitbox. [br]
## [param amount] determines how much damage is done to the health component.
func attack(amount : float) -> void:
	healthComponent.damage(amount)
