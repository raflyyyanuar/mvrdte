extends Control

@onready var load_request_time: Timer = $LoadRequestTime
@onready var black_animation: AnimationPlayer = $BlackAnimation
@onready var label_animation: AnimationPlayer = $LabelAnimation
@onready var texture_rect: TextureRect = $ColorRect/TextureRect
var scene := ""


func load_scene(level : LevelSelect) -> void:
	scene = level.level_path
	texture_rect.set_texture(level.icon)
	black_animation.play("load_scene")
	await black_animation.animation_finished
	ResourceLoader.load_threaded_request(scene)
	load_request_time.start()


func _on_load_request_time_timeout() -> void:
	var status := ResourceLoader.load_threaded_get_status(scene)
	if status == ResourceLoader.THREAD_LOAD_LOADED:
		var loaded_scene = ResourceLoader.load_threaded_get(scene)
		get_tree().change_scene_to_packed(loaded_scene)
		black_animation.play_backwards("load_scene")
