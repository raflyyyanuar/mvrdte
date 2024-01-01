extends Node3D

var level_selects = []

func _ready() -> void:
	level_selects = get_tree().get_nodes_in_group("level_selects") as Array[LevelSelect]
	
	for ls in level_selects:
		ls = ls as LevelSelect
		ls.connect("pressed", on_level_selected.bind(ls))
		if not ls.is_quit:
			ResourceLoader.load_threaded_request(ls.level_path)
	
	print(get_tree())


func on_level_selected(level_select : LevelSelect) -> void:
	print(get_tree())
	if level_select.is_quit:
		get_tree().quit()
	else:
		print(ResourceLoader.load_threaded_get_status(level_select.level_path))
		var scene = ResourceLoader.load_threaded_get(level_select.level_path)
		get_tree().change_scene_to_packed(scene)
