extends Sprite3D

@onready var accreditation_list = $"../../../FollowXRCamera/AccreditationList"

var accreditation_board


# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().process_frame
	accreditation_board = accreditation_list.get_node("Viewport").get_node("AccreditationBoard") 
	accreditation_board.connect("certificate_issued", on_certificate_issued)

func on_certificate_issued(certificate : Texture2D) -> void:
	set_texture(certificate)

