extends Node3D
class_name DesktopBaseScene

var main_menu := preload("res://assets/desktop/scenes/main_menu/desktop_main_menu.tscn")
var loading_screen := preload("res://assets/desktop/scenes/loading_screen/desktop_loading_screen.tscn")


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("exit"):
		get_tree().change_scene_to_packed(main_menu)
