@tool
extends Control
class_name AccreditationPoster

@export var accreditation : Accreditation = null
@export var refresh : bool = false : set = set_refresh
# @export var primary_color : Color = Color.DARK_BLUE # : set = set_primary_color
# @export var secondary_color : Color = Color.WEB_PURPLE # : set = set_secondary_color


func _ready():
	await get_tree().process_frame
	set_refresh()


#func set_primary_color(p_color : Color) -> void:
	#primary_color = p_color
	#$TopBanner.get_texture().gradient.set_color(0, primary_color)
	#$ColorRect/Ribbon.color = primary_color
#
#
#func set_secondary_color(p_color : Color) -> void:
	#secondary_color = p_color
	#$TopBanner.get_texture().gradient.set_color(1, secondary_color)
	#$BottomBanner.modulate = secondary_color


func set_refresh(_p_refresh : bool = true) -> void:
	refresh = false
	if accreditation:
		%Major.text = accreditation.major
		%Accreditation.text = "Akreditasi " + accreditation.grade
		%Year.text = str(accreditation.year)
		%Certificate.texture = accreditation.certificate
		
		#set_primary_color(primary_color)
		#set_secondary_color(secondary_color)


func _on_button_pressed():
	pass # Replace with function body.
