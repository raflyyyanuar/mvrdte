extends RayCast3D

var collider = null
@onready var interact_ui: InteractUI = %InteractUI


func _process(delta: float) -> void:
	if is_colliding():
		collider = get_collider()
	else:
		collider = null
	
	if collider:
		var viewport = collider.get_parent() as Viewport2Din3D
		if viewport:
			var interactable = viewport.get_scene_instance()
			if interactable and interactable.has_method("interact"):
				if interactable.can_interact:
					interact_ui.set_message("[E] Interact")
				else:
					interact_ui.set_message("")
			else:
				interact_ui.set_message("")
		else:
			interact_ui.set_message("")
	else:
		interact_ui.set_message("")


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		if collider == null:
			print("Collider is null")
			return
		
		var viewport = collider.get_parent() as Viewport2Din3D
		if viewport == null:
			print("viewport is null")
			return
		
		var interactable = viewport.get_scene_instance()
		if interactable == null:
			print("interactable is null")
			return
		
		if interactable.has_method("interact"):
			interactable.interact()


