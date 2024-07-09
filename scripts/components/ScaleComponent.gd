@icon("res://assets/textures/icons/scale_icon.svg")
## Scale sprite effect
# Credit to HeartBeast - MIT License code
class_name ScaleComponent
extends Node

## Export the sprite that this component will be scaling
@export var sprite : Node2D

## Export the scale amount (as a vector)
@export var scale_amount : Vector2 = Vector2(1.5, 1.5)

## Export the scale duration
@export var scale_duration : float = 0.4

# Sprite start size
var _original_size : Vector2
var _size_stored : bool


## This is the function that will activate this component
func tween_scale() -> void:
	# We store the sprites original size
	if !_size_stored:
		_original_size = sprite.scale
		_size_stored = true
	
	# We are going to scale the sprite using a tween (so we can make is smooth)
	# First we create the tween and set it's transition type and easing type
	var tween = create_tween().set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
	
	# Next we scale the sprite from its current scale to the scale amount (in 1/10th of the scale duration)
	tween.tween_property(sprite, "scale", scale_amount, scale_duration * 0.1).from_current()
	# Finally we scale back to a value of 1 for the other 9/10ths of the scale duration
	# Consider that we always scale back to a value of 1, you could store the starting scale amount for the sprite
	# as well for games where your character doesn't start with a scale of 1
	tween.tween_property(sprite, "scale", _original_size, scale_duration * 0.9).from(scale_amount)
