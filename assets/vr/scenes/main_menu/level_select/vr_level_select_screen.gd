extends MeshInstance3D

@export var move_distance := 0.5

func _on_vr_level_select_screen_pointer_event(event: XRToolsPointerEvent) -> void:
	if event.event_type == 0:
		var tween := create_tween().set_trans(Tween.TRANS_QUAD)
		tween.tween_property(self, "position:z", move_distance, 0.2)
	elif event.event_type == 1:
		var tween := create_tween().set_trans(Tween.TRANS_QUAD)
		tween.tween_property(self, "position:z", 0.0, 0.2)
