# 2D game template documentation

---

## Introduction

This document is a comprensive guide to using the [2D game template/ framework](https://github.com/kcfresh53/2d-game-template). 

The 2D game template maximizes Godot's potential by implementing a component-based programming paradigm (COP). This approach allows for the construction of intricate systems through the use of distinct *components* as fundamental building blocks.

Each *component* serves a primary function, which can be connected to other components. Employing this development technique offers significant benefits, including swift prototyping and scalability.

___

## Components List

### Gameplay components:

* [Bullet pattern curve](#bullet-pattern-curve)
* [Bullet pattern generator](#bullet-pattern-generator)
* [Camera limiter component](#camera-limiter)
* [Damage box component](#damage-box)
* [Health component](#health)
* [Hitbox component](#hitbox)
* [Move component](#move)
* [Move input component](#move-input)
* [Spawner component](#spawner)
* [Wave component](#wave)

### FX components:

* [Flash component](#flash)
* [Onetime animated effect component](#onetime-animated-effect)
* [Scale component](#scale)

### Utility components:

* State
* State machine
* Stats

___

## Addons list

### Gameplay addons:

* [Camera2D plus](https://godotengine.org/asset-library/asset/2205)

### Development tool addons:

* [AddonSave (4.1)](https://godotengine.org/asset-library/asset/2326)
* [Godot Debug Camera](https://godotengine.org/asset-library/asset/2869)
* [Little camera preview](https://godotengine.org/asset-library/asset/2500)


___

## Bullet Pattern Curve

This component instantiates a specified scene following a pre-drawn path.

### Properties:

* `bullet_node : PackedScene`: Scene to instantiate.
* `bullet_speed : float`: Speed of the instanced node.
* `closed : bool`:  Ascertain whether a traced path constitutes a closed shape.
* `spawn_frequency : float`: Controls the frequency of scene instantiation.
* `autostart : bool`: Detemines if scenes are spawned when `on_ready()` is called.
* `active : bool`: Toggles instance activity.

___

## Bullet Pattern Generator

The role of this component involves instantiating a designated scene in multiple spiral configurations.

### Properties:

* `alpha : float`: Controls spiral configuration.
* `bullet_node : PackedScene`: Scene to instantiate.
* `min_speed : float`: Minimum speed of the instanced scene.
* `max_speed : float`: Maximum speed of the instanced scene.
* `spawn_frequency : float`: Controls the frequency of scene instantiation.
* `autostart : bool`: Detemines if scenes are spawned when `on_ready()` is called.
* `active : bool`: Toggles instance activity.

___

## Camera Limiter
The camera limiter component restricts the mobility of the `Camera2D` node within confined boundaries.

### Properties:

* `camera : Camera2D`: Designates which camera to limit.
* `smoothed : bool`: Enables a smoothing effect to camera limits.
* `camera_on_ready: bool`: targets a camera having a *unique name* that will be manageable upon the `on_ready()` event invocation.

___

## Damage Box
The damage box component interacts with the [hitbox component](#hitbox) to reduce entity health.

### Properties:

* `damage : int`:  Signifies the damage inflicted on an entity.

___

## Health
The health component orchestrates health management tasks, utilizing figures from the [Stats component](stats).

### Properties:

* `stat : Stats`: Entity stats.

### Methods:

* `damage(value : float) -> void`: Reduces health by the provided value.
* `increase_max_health(value : float) -> void`: Increases an entitie's maximum health.

### Signals:

* `damage_taken(value: float)`: Emitted when damage occurs.
* `health_changed(health: float)`: Emitted when health is changed.
* `health_depleted()`: Emitted when health is depleted.

___

## Hitbox

The hitbox component communicates with the health component to deal damage.

### Properties:

* `health_component : HealthComponent`: Health component to control.

### Methods:

* `attack(amount : float) -> void`: Called when a colliding with a [damage box](#damage-box). `amount` determines how much damage is done to the health component.

___

## Move

This component allows nodes to move in a scene.

### Properties:

* `actor : Node2D`: Node to control.
* `velocity : Vector2`: Movement velocity.

___

## Move Input

`MoveInputComponent` gives the move component access to user input.

### Properties:

* `stat : Stats`: Entity stats.
* `move_component`: Move component

___

## Spawner

This component spawns scenes at specified positions.

### Properties:

* `scene : PackedScene`: Scene to instance.

### Methods:

* `spawn(global_spawn_position : Vector2 = global_position, parent : Node) -> Node`: Initiates a new instance of the scene at a specified global position within its designated parent. By default, the parent is set to the current "main" scene; however, you have the flexibility to specify an alternative parent if needed.

___

## Wave

The wave component controls wave system spawning.

### Properties:

* `active : bool`: Determines if the wave starts on instance.
* `next_wave : WaveComponent`: Next wave to trigger.
* `spawn_group : Node`: Parent node of spawned nodes.
* `spawn_positions : Array[Marker2D]`: A list of Marker2D nodes that detemine potential spawn positions.
* `spawner_components : Array[SpawnerComponent]` : A list of spawner components that contain scenes to instance.

### Methods:

* `start_wave() -> void`: Starts the wave.

___

## Flash

Adds a flash effect to a sprite.

### Constants:

* `FLASH_MATERIAL : Resource`: Effect shader material.

### Properties:

* `sprite : CanvasItem`: Sprite to flash.
* `flash_duration : float`: Flash duration.

### Methods:

* `flash() -> void`: Triggers flash.

___

## Onetime Animated effect

This component manages the animation and subsequent deletion of instanced, animated sprites once their effect has been executed.

inherits methods and properties from `AnimatedSprite2D`.

___

## Scale

This component facilitates the scaling effect on sprites during gameplay.

### Properties:

* `scale_amount : Vector2`:  Scale factor.
* `scale_duration : float`: Scale duration.
* `sprite : Node2D`: Node to scale.

### Methods:

* `tween_scale() -> void`: Triggers sprite scaling.