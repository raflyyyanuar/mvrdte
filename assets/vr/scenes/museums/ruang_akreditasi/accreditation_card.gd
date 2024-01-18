@tool
extends PanelContainer
class_name AccredicationCard

@export var refresh := false : set = set_refresh
@export var accreditation : Accreditation = null

@onready var year = $HBoxContainer/VBoxContainer/Year

@onready var major_1 = $HBoxContainer/VBoxContainer/VBoxContainer/Major1
@onready var major_2 = $HBoxContainer/VBoxContainer/VBoxContainer/Major2
@onready var major_3 = $HBoxContainer/VBoxContainer/VBoxContainer/Major3

@onready var logo_1 = $HBoxContainer/HBoxContainer/Logo1
@onready var logo_2 = $HBoxContainer/HBoxContainer/Logo2
@onready var logo_3 = $HBoxContainer/HBoxContainer/Logo3

var region_elektro := Rect2(0, 0, 62, 120)
var region_biomedik := Rect2(64, 0, 58, 120)
var region_komputer := Rect2(123, 0, 117, 120)

var eeee : Array[Color] = [Color.AQUAMARINE, Color.FUCHSIA, Color.GOLD]


func _ready():
	set_refresh()


func set_accreditation() -> void:
	var first_major : String = accreditation.major1
	
	var second_major : String= accreditation.major2
	var has_second_major : bool = !second_major.is_empty()
	
	var third_major : String = accreditation.major3
	var has_third_major : bool = !third_major.is_empty()
	
	year.set_text(str(accreditation.year))
	
	major_1.set_text(first_major)
	major_1.set_self_modulate(eeee[ int( first_major.right(1) ) - 1])
	logo_1.set_self_modulate(eeee[int(first_major.right(1)) - 1])
	
	
	if(first_major.contains("Elektro")):
		logo_1.get_texture().set_region(region_elektro)
	elif(first_major.contains("Komputer")):
		logo_1.get_texture().set_region(region_komputer)
	else:
		logo_1.get_texture().set_region(region_biomedik)
	
	## Second Accreditation
	if(has_second_major):
		major_2.set_text(second_major)
		major_2.set_self_modulate(eeee[int(second_major.right(1)) - 1])
		logo_2.set_self_modulate(eeee[int(second_major.right(1)) - 1])
	
		if(second_major.contains("Elektro")):
			logo_2.get_texture().set_region(region_elektro)
		elif(second_major.contains("Komputer")):
			logo_2.get_texture().set_region(region_komputer)
		else:
			logo_2.get_texture().set_region(region_biomedik)
	
	major_2.set_visible(has_second_major)
	logo_2.set_visible(has_second_major)
	
	
	## Third Accreditation
	if(has_second_major):
		major_3.set_text(third_major)
		major_3.set_self_modulate(eeee[int(third_major.right(1)) - 1])
		logo_3.set_self_modulate(eeee[int(third_major.right(1)) - 1])
	
		if(third_major.contains("Elektro")):
			logo_3.get_texture().set_region(region_elektro)
		elif(third_major.contains("Komputer")):
			logo_3.get_texture().set_region(region_komputer)
		else:
			logo_3.get_texture().set_region(region_biomedik)
	
	major_3.set_visible(has_third_major)
	logo_3.set_visible(has_third_major)


func set_refresh(p_refresh : bool = true) -> void:
	refresh = false
	if accreditation:
		print(name)
		set_accreditation()
