extends Node3D

@onready var player : PlayerDesktop = get_parent()
var sensitivity := 0.001


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		event.relative.x
		
		self.rotate_x(-event.relative.y * sensitivity)
		player.rotate_y(-event.relative.x * sensitivity)
	
	if Input.is_key_pressed(KEY_ESCAPE):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)






