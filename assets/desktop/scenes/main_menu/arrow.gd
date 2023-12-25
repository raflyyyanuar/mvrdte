extends Sprite2D

@onready var levels = $"../HBoxContainer".get_children() as Array[LevelSelect]


func _ready() -> void:
	for l in levels:
		l.connect("mouse_entered", on_level_hovered.bind(l))
		l.connect("pressed", on_level_pressed.bind(l.level))
	
	var tween := create_tween().set_loops().chain()
	tween.tween_property(self, "position:y", position.y + 10.0, 1.0)
	tween.tween_property(self, "position:y", position.y - 10.0, 1.0)


func on_level_hovered(button : LevelSelect) -> void:
	global_position.x = button.global_position.x + button.pivot_offset.x
	print(button.global_position)


func on_level_pressed(level : String) -> void:
	if not level.is_empty():
		get_tree().change_scene_to_file(level)
