extends Button
class_name LevelSelect

@export var is_quit := false
@export_file("*.tscn") var level_path = ""
@export var preview_image : Texture2D
@export_multiline var level_description := "This is a type of description that a level might have. It should not be too long nor too short. It should contain all the things the visitors should know before entering the level."




func _on_pressed() -> void:
	print("LEVEL SELECTED: " + self.text)
