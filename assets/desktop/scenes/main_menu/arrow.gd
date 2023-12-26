extends Sprite2D

signal level_hovered(level: LevelSelect)
@onready var levels = %HubContainer.get_children() as Array[LevelSelect]
var current_level_preview : Texture2D

func _ready() -> void:
	for l in levels:
		l.connect("mouse_entered", on_level_hovered.bind(l))
		l.connect("pressed", on_level_pressed.bind(l.level))
	
	call_deferred("on_level_hovered", levels.front())
	
	var tween := create_tween().set_loops().chain()
	tween.tween_property(self, "position:y", position.y + 10.0, 1.0)
	tween.tween_property(self, "position:y", position.y - 10.0, 1.0)
 

func set_pos(what : float) -> void:
	global_position.x = what

func on_level_hovered(level : LevelSelect) -> void:
	set_pos(level.global_position.x + level.pivot_offset.x)
	emit_signal("level_hovered", level)


func on_level_pressed(level : String) -> void:
	if not level.is_empty():
		get_tree().change_scene_to_file(level)
