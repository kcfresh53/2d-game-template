## Camera Limiter Node
class_name CameraLimiter
extends Area2D


@export var camera : Camera2D
@export var smoothed : bool = false
@export var camera_on_ready : bool = false

var _cam_limit_left : int
var _cam_limit_right : int
var _cam_limit_top : int
var _cam_limit_bottom : int


func _ready() -> void:
	if camera_on_ready:
		camera = get_tree().current_scene.get_node("%Camera2DPlus")
		
		area_exited.connect(_on_area_exited)
		
		_cam_limit_left = camera.limit_left
		_cam_limit_right = camera.limit_right
		_cam_limit_top = camera.limit_top
		_cam_limit_bottom = camera.limit_bottom
		
	area_entered.connect(_on_area_entered)


func _on_area_entered(_area: Area2D) -> void:
	if not camera_on_ready:
		camera = get_tree().current_scene.get_node("%Camera2DPlus")
	
	var collision : CollisionShape2D = get_child(0)
	var shape : Shape2D = collision.get_shape()
	var bounds : Rect2 = shape.get_rect()
	
	camera.limit_smoothed = smoothed
	camera.limit_left = int(collision.global_position.x - bounds.size.x)
	camera.limit_right = int(collision.global_position.x + bounds.end.x)
	camera.limit_top = int(collision.global_position.y - bounds.size.y)
	camera.limit_bottom = int(collision.global_position.y + bounds.end.y)


func _on_area_exited(_area: Area2D):
	camera.limit_left = _cam_limit_left
	camera.limit_right = _cam_limit_right
	camera.limit_top = _cam_limit_top
	camera.limit_bottom = _cam_limit_bottom
