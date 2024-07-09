@icon("res://assets/textures/icons/wave_icon.svg")

## Controls wave system spawning
class_name WaveComponent
extends Node

## An array of Spawner components
@export var spawner_components : Array[SpawnerComponent]
## An array of Marker2D nodes
@export var spawn_positions : Array[Marker2D]
## Parent node of the spawned nodes
@export var spawn_group : Node2D
## Next wave to trigger
@export var next_wave : WaveComponent
## Determines if the wave starts on instance
@export var active : bool

## Emitted when a wave is complete
signal wave_complete


func _ready() -> void:
	spawn_group.child_order_changed.connect(_check_wave_state)
	if active:
		start_wave()

## Triggers the wave to start
func start_wave() -> void:
	for pos in spawn_positions.size():
		if spawn_positions[pos] != null:
			spawner_components.pick_random().spawn(spawn_positions[pos].global_position, spawn_group)

# Checks if a wave state is valid 
func _check_wave_state() -> bool:
	if active:
		if spawn_group.get_child_count() == 0:
			wave_complete.emit()
			if next_wave != null:
				active = false
				next_wave.active = true
				next_wave.start_wave()
			return true
	
	return false
