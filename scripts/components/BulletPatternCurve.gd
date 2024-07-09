@icon("res://assets/textures/icons/bullet_pattern_curve_icon.svg")

## Instances bullets along a drawn path
class_name BulletPatternCurve
extends Path2D

## Bullet scene to instanciate.
@export var bullet_node: PackedScene
## Bullet speed
@export var bullet_speed: float = 200.0
## Determins if the path is a closed shape
@export var closed: bool = true
## Bullet spawn frequency.
## Controls the number of bullets spawned
@export var spawn_frequency : float = 1: 
	set(value):
		spawn_frequency = value
		get_node("timer").wait_time = value
## Instanciate bullets on ready
@export var autostart : bool = true
## Toggle bullet spawn
@export var active : bool = true:
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
	timer.timeout.connect(_on_timeout)
	if active:
		timer.start()


func _shoot():
	var cur_point : int = 0
	
	for point in curve.get_baked_points():
		var dtp : Vector2
		
		if !closed && cur_point == 0:
			dtp = point.normalized()
			closed = true
		elif closed:
			dtp = point.direction_to(curve.get_baked_points()[cur_point - 1])
		
		var p_vec : Vector2 = Vector2(-dtp.y, dtp.x).normalized()
		
		var bullet := bullet_node.instantiate()
		
		bullet.speed = bullet_speed
		bullet.direction = p_vec
		bullet.position = to_global(point)
		
		get_tree().current_scene.call_deferred("add_child",bullet)
		cur_point += 1


func _on_timeout():
	_shoot()
