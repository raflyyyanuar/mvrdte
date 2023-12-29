extends CanvasLayer
class_name InteractUI

@onready var message: Label = %Message


func set_message(what : String) -> void:
	message.set_text(what)
