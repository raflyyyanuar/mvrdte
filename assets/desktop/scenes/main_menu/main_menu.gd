extends Control

@export var hub_preview : Texture2D

@export_file("*.tscn") var hub_scene_path
@onready var level_preview: TextureRect = $LevelPreview






func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file(hub_scene_path)
