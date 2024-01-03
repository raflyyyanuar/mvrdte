extends Node3D

var level_selects = []
var selected := false

func _ready() -> void:
	level_selects = get_tree().get_nodes_in_group("level_selects") as Array[LevelSelect]
	
	for ls in level_selects:
		ls = ls as LevelSelect
		ls.connect("pressed", on_level_selected.bind(ls))
	
	print(get_tree())


func on_level_selected(level_select : LevelSelect) -> void:
	if selected: return
	print(get_tree())
	if level_select.is_quit:
		get_tree().quit()
	else:
		DesktopSceneLoader.load_scene(level_select)
	selected = true
