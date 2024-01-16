extends Node2D
class_name SedimentMinigame

signal started

func start_game():
	$BlueRobotics.start()


func _on_button_pressed():
	emit_signal("started")
	start_game()
	$Start.visible = false

