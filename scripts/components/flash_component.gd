@icon("res://assets/textures/icons/flash_icon.svg")

## Flash effect controller
class_name FlashComponent
extends Node

## Effect material
const FLASH_MATERIAL = preload("res://assets/effects/white_flash_material.tres")

## Sprite to flash
@export var sprite: CanvasItem

## Flash duration
@export var flash_duration: = 0.2

var _original_sprite_material: Material
var _timer: Timer = Timer.new()


func _ready() -> void:
	add_child(_timer)
	
	# Store the original sprite material
	_original_sprite_material = sprite.material

## Triggers sprite flash
func flash():
	# Set the sprite's material to the flash material
	sprite.material = FLASH_MATERIAL
	
	# Start the timer (passing in the flash duration)
	_timer.start(flash_duration)
	
	# Wait until the timer times out
	await _timer.timeout
	
	# Set the sprite's material back to the original material stored
	sprite.material = _original_sprite_material
