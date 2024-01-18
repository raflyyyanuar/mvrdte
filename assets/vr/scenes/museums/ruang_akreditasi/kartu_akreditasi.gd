extends Control

@onready var label = $Label
@onready var original_label_pos : float = label.position.y

@export var animation_time := 0.2


func _on_color_rect_mouse_entered():
	var tween := create_tween()
	
	tween.tween_property(label, "position:y", original_label_pos - 200, animation_time)


func _on_color_rect_mouse_exited():
	var tween := create_tween()
	tween.tween_property(label, "position:y", original_label_pos, animation_time)
