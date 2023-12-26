extends Node3D

var level_selects = []

func _ready() -> void:
	level_selects = get_tree().get_nodes_in_group("level_selects") as Array[LevelSelect]
	
	for ls in level_selects:
		ls.connect("pressed", on_level_selected.bind(ls))
	
	print(get_tree())


func on_level_selected(level_select : LevelSelect) -> void:
	print(get_tree())
	if level_select.is_quit:
		get_tree().quit()
	else:
		get_tree().change_scene_to_file(level_select.level_path)
