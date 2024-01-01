extends Node3D

@onready var player : DPlayer = get_parent()
@onready var camera: Camera3D = $Camera3D

var is_zoomed_in := false
var is_zooming := false
var sensitivity := 0.001


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		event.relative.x
		
		self.rotate_x(-event.relative.y * sensitivity)
		player.rotate_y(-event.relative.x * sensitivity)
	
	if Input.is_action_just_pressed("zoom") and not is_zooming:
		is_zooming = true
		var tween := create_tween().set_trans(Tween.TRANS_QUAD)
		if is_zoomed_in:
			tween.tween_property(camera, "fov", 70.0, 1.0)
		else:
			tween.tween_property(camera, "fov", 35.0, 1.0)
		await tween.finished
		is_zoomed_in = !is_zoomed_in
		is_zooming = false
	
	if Input.is_action_pressed("increase_height"):
		increase_height()
	elif Input.is_action_pressed("decrease_height"):
		decrease_height()
	elif Input.is_action_just_pressed("reset_height"):
		reset_height()


func reset_height() -> void:
	position.y = 0.5


func increase_height() -> void:
	position.y += 0.3
	position.y = clampf(position.y, 0.0, 5.0)


func decrease_height() -> void:
	position.y -= 0.3
	position.y = clampf(position.y, 0.0, 5.0)

