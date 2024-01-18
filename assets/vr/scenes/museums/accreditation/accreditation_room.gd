extends XRToolsSceneBase

@export var accreditations = []
var viewport_3d_scene = preload("res://addons/godot-xr-tools/objects/viewport_2d_in_3d.tscn")


func _ready():
	var size = accreditations.size()
	
	for i in range(size):
		var viewport_3d_instance = viewport_3d_scene.instantiate() as Viewport2Din3D
		add_child(viewport_3d_instance)
		viewport_3d_instance
		
		viewport_3d_instance


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
