extends Node3D

@export_file("*.tscn") var main_menu_path


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to_file(main_menu_path)
	if Input.is_action_just_pressed("ui_focus_next"):
		$CanvasLayer/Control.visible = !$CanvasLayer/Control.visible
		$CanvasLayer/Tab.visible = !$CanvasLayer/Tab.visible