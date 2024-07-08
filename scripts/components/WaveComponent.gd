@icon("res://assets/textures/icons/wave_icon.svg")

## Controls wave system spawning
class_name WaveComponent
extends Node

## An array of Spawner components
@export var _spawner_components : Array[SpawnerComponent]
## An array of Marker2D nodes
@export var _spawn_positions : Array[Marker2D]
## Parent node of the spawned nodes
@export var _spawn_group : Node2D
## Next wave to trigger
@export var _next_wave : WaveComponent
## Determines if the wave starts on instance
@export var _active : bool


## Emitted when a wave is complete
signal wave_complete


func _ready() -> void:
	_spawn_group.child_order_changed.connect(check_wave_state)
	if _active:
		start_wave()

## Triggers the wave to start
func start_wave() -> void:
	for pos in _spawn_positions.size():
		if _spawn_positions[pos] != null:
			_spawner_components.pick_random().spawn(_spawn_positions[pos].global_position, _spawn_group)

## Checks if a wave state is valid 
func check_wave_state() -> bool:
	if _active:
		if _spawn_group.get_child_count() == 0:
			wave_complete.emit()
			if _next_wave != null:
				_active = false
				_next_wave._active = true
				_next_wave.start_wave()
			return true
	
	return false
