extends Node3D
class_name DesktopBaseScene

var main_menu := preload("res://assets/desktop/scenes/main_menu/desktop_main_menu.tscn")


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to_packed(main_menu)
