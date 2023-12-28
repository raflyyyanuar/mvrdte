extends CanvasLayer


func _ready() -> void:
	$Control.visible = true


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_focus_next"):
		$Control.visible = !$Control.visible
		$Tab.visible = !$Tab.visible
