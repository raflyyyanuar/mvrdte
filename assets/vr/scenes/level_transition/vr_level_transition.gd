extends Node3D

@onready var scene_base : XRToolsSceneBase = get_parent()
var level_selects = []


func _ready() -> void:
	level_selects = get_tree().get_nodes_in_group("level_selects") as Array[LevelSelect]
	
	for ls in level_selects:
		ls.connect("pressed", on_level_selected.bind(ls))


func on_level_selected(level_select : LevelSelect) -> void:
	if level_select.is_quit:
		get_tree().quit()
	else:
		scene_base.load_scene(level_select.level_path)
