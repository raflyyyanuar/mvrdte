extends Control

@export var menu_button_action : String = "menu_button"

var _controller = null
var _menu = null
var _xr_origin : Node3D = null
var camera : Node3D = null
var is_open := false

func _ready():
	close_menu()


func _process(delta):
	if _controller == null:
		_controller = XRTools.find_xr_child(get_tree().root, "LeftHand", "XRController3D")
		
		if _controller:
			close_menu()
			
			_controller.button_pressed.connect(_on_button_pressed)
			_controller.button_released.connect(_on_button_released)
		else:
			print("Couldn't find controller!")
	if _menu == null:
		print("Menu is null")
		_menu = get_parent()
		if _menu != null:
			_menu = _menu.get_parent()
	if _xr_origin == null:
		print("xr origin is null")
		_xr_origin = XRTools.find_xr_child(get_node("/root/Staging/Scene/"), "XROrigin3D", "XROrigin3D")
	
	#print(own_camera)


func _on_button_pressed(p_button : String):
	if p_button == menu_button_action:
		print("Menu button pressed")


func _on_button_released(p_button : String):
	if p_button == menu_button_action:
		print("Menu button released")
		
		if is_open:
			close_menu()
		else:
			open_menu()


func open_menu():
	print("Opening menu")
	self.show()
	
	# Get camera
	camera = _xr_origin.get_node("XRCamera3D")
	
	# Get the current camera transform
	var camera_transform = camera.global_transform
	
	
	# Set the forward vector to represent only forward movement
	var forward_vector = camera_transform.basis.z
	forward_vector.y = 0  # Remove the vertical component
	forward_vector = forward_vector.normalized()  # Normalize to maintain direction
	var menu_position = camera_transform.origin + forward_vector * -1.5
	
	_menu.global_transform.origin = menu_position
	
	# Calculate the rotation around the upward axis (up vector)
	var up_vector = Vector3(0, 1, 0)
	var rotation_angle = atan2(forward_vector.x, forward_vector.z)
	var rot = Basis(up_vector, rotation_angle)

	# Set the rotation of the pause menu to rotate only around the upward axis
	_menu.global_transform.basis = rot
	
	
	#_menu.global_position = _xr_origin.get_node("XRCamera3D").global_position
	_menu.get_node("StaticBody3D/CollisionShape3D").disabled = false
	#_menu.rotation.y = _xr_origin.get_node("XRCamera3D").rotation.y
	is_open = true


func close_menu():
	if _menu == null: return
	
	_menu.get_node("StaticBody3D/CollisionShape3D").disabled = true
	
	print("Closing menu")
	self.hide()
	is_open = false


func _on_morning_pressed():
	%Greeting.set_text("Good Morning!")


func _on_evening_pressed():
	%Greeting.set_text("Good Evening!")


func _on_night_pressed():
	%Greeting.set_text("Good Night!")
