extends Node3D

@onready var world_environment: WorldEnvironment = $WorldEnvironment
@onready var sky_rotation := world_environment.environment.sky_rotation.y

func _process(delta: float) -> void:
	sky_rotation += 0.006 * delta
	world_environment.environment.sky_rotation.y = sky_rotation
