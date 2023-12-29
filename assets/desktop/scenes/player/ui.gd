extends CanvasLayer

@onready var welcome: Control = $Welcome
@onready var tab: Label = $Tab

func _ready() -> void:
	welcome.visible = true


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_focus_next"):
		welcome.visible = !welcome.visible
		tab.visible = !tab.visible
