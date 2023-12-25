extends TextureRect

const MOVE_TIME := 15.0
const PAUSE_TIME := 5.0

@export var hub_preview : Texture2D
@export var cat_image : Texture2D
@export var dog_image : Texture2D

## Animate like minecraft main menu
## moving from left to right
## and back again
func _ready() -> void:
	var tween := create_tween().set_loops()
		
	# move left
	tween.tween_property(self, "position:x", size.x * (1 - scale.x), MOVE_TIME)
	
	# pause for a bit
	tween.tween_interval(PAUSE_TIME)
	
	# move right
	tween.tween_property(self, "position:x", 0.0, MOVE_TIME)
	
	# pause for a bit
	tween.tween_interval(PAUSE_TIME)




func _on_dog_mouse_entered() -> void:
	self.set_texture(dog_image)


func _on_cat_mouse_entered() -> void:
	self.set_texture(cat_image)
