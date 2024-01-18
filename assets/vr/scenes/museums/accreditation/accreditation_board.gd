extends Control


signal certificate_issued(certificate : Texture2D)

var accreditation_cards = []

# Called when the node enters the scene tree for the first time.
func _ready():
	accreditation_cards = $AccreditationList/List.get_children() as Array[AccreditationCard]
	for ac in accreditation_cards:
		ac.connect("certificate_pressed", on_certificate_issued)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func on_certificate_issued(certificate : Texture2D) -> void:
	emit_signal("certificate_issued", certificate)
