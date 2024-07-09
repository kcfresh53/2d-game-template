@icon("res://assets/textures/icons/bullet_pattern_icon.svg")

## Generates bullet patterns
class_name BulletPatternGenerator
extends Node2D

var _theta: float = 0.0

## Controls bullet generation pattern.
@export_range(0,2*PI) var alpha: float = 0.0
## Bullet scene to instanciate.
@export var bullet_node: PackedScene
## Minimum bullet speed.
@export var min_speed: float = 200.0
## Maximum bullet speed.
@export var max_speed: float = 400.0
## Bullet spawn frequency.
## Controls the number of bullets spawned
@export var spawn_frequency : float = 0.05: 
	set(value):
		spawn_frequency = value
		get_node("timer").wait_time = value
## Instanciate bullets on ready
@export var autostart : bool = true
## Toggle bullet spawn
@export var active : bool = false:
	set(value):
		active = value
		if !is_inside_tree():
			return
		if active:
			get_node("timer").start()
		else:
			get_node("timer").stop()


func _ready() -> void:
	var timer : Timer = Timer.new()
	timer.name = "timer"
	add_child(timer)
	timer.wait_time = spawn_frequency
	timer.autostart = autostart
	timer.timeout.connect(_on_speed_timeout)
	if active:
		timer.start()


func _get_vector(angle):
	_theta = angle + alpha
	return Vector2(cos(_theta),sin(_theta))
 

func _shoot(angle):
	var bullet := bullet_node.instantiate()
	bullet.position = global_position
	bullet.speed = randf_range(min_speed, max_speed)
	bullet.direction = _get_vector(angle)
	get_tree().current_scene.call_deferred("add_child",bullet)


func _on_speed_timeout():
	_shoot(_theta)
