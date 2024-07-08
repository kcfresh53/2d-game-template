@icon("res://assets/textures/icons/damage_box_icon.svg")
## Interacts with hitbox component
## Collision mask should be set to Hitbox layer
## This component deals damage to via the hitbox component
class_name DamageboxComponent
extends Area2D

@export var _damage : int

func _ready() -> void:
	area_entered.connect(collision)

func collision(hitbox : HitboxComponent):
	hitbox.attack(_damage)
