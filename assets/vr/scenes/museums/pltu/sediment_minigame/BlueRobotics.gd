extends Sprite2D


var sediments = []
var target
@export var speed := 200


func start():
	sediments = get_tree().get_nodes_in_group("Sediments")
	target = get_target()


func _process(delta):
	if target != null:
		global_position = global_position.move_toward(target.global_position, delta * speed)


func _on_area_2d_area_entered(area: Area2D):
	if area.is_in_group("Sediments"):
		area.hide()
		
		target = get_target()
		if target == null:
			$"../Label".show()
			$"../Label2".show()


func get_target():
	if sediments.size() > 0:
		return sediments.pop_front()
	else:
		return null
