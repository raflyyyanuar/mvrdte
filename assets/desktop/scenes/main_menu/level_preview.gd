extends TextureRect

const MOVE_TIME := 15.0
const PAUSE_TIME := 5.0


func _ready() -> void:
	var tween := create_tween().set_loops()
	tween.tween_property(self, "position:x", size.x * (1 - scale.x), MOVE_TIME)
	tween.tween_interval(PAUSE_TIME)
	tween.tween_property(self, "position:x", 0.0, MOVE_TIME)
	tween.tween_interval(PAUSE_TIME)


func _on_arrow_level_hovered(level: LevelSelect) -> void:
	self.set_texture(level.preview_image)
	%LevelName.set_text(level.text)
	%LevelDescription.set_text(level.level_description)
