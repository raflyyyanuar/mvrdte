@tool
extends Node3D
class_name FollowXRCamera

## If true, the screen follows the camera
@export var follow_camera : bool = true: set = set_follow_camera

# Camera to track
@onready var _camera : XRCamera3D = %XRCamera3D

## Curve for following the camera
@export var follow_speed : Curve


func _ready():
	_update_follow_camera()


func _process(delta):
	# Skip if in editor
	if Engine.is_editor_hint():
		return

	# Skip if no camera to track
	if !_camera:
		print("No camera")
		return

	# Get the camera direction (horizontal only)
	var camera_dir := _camera.global_transform.basis.z
	camera_dir.y = 0.0
	camera_dir = camera_dir.normalized()

	# Get the loading screen direction
	var screen_dir := global_transform.basis.z

	# Get the angle
	var angle := screen_dir.signed_angle_to(camera_dir, Vector3.UP)
	if angle == 0:
		return

	# Do rotation based on the curve
	global_transform.basis = global_transform.basis.rotated(
			Vector3.UP * sign(angle),
			follow_speed.sample_baked(abs(angle) / PI) * delta
	).orthonormalized()
	
	# global_rotation_degrees.y = clampf(global_rotation_degrees.y, -22.6, 40.0)


## Set the follow_camera property
func set_follow_camera(p_enabled : bool) -> void:
	follow_camera = p_enabled
	_update_follow_camera()


## Set the camera to track
func set_camera(p_camera : XRCamera3D) -> void:
	_camera = p_camera
	_update_follow_camera()


func _update_follow_camera():
	if _camera and !Engine.is_editor_hint():
		set_process(follow_camera)





