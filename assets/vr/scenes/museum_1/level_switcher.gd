extends Node3D


var level_preview

func _ready():
	level_preview = get_tree().get_first_node_in_group("LevelPreview")
	level_preview.connect("level_pressed", on_level_pressed)


func on_level_pressed(path):
	get_parent().load_scene(path)
