@tool
extends PanelContainer
class_name AccredicationCard

@export var refresh := false : set = set_refresh
@export var accreditation : Accreditation = null

@onready var year = $HBoxContainer/VBoxContainer/Year
@onready var majors = $HBoxContainer/VBoxContainer/MajorContainer.get_children()
@onready var buttons = $HBoxContainer/ButtonContainer.get_children()

var logos = [
	preload("res://assets/common/images/atlases/LogoElektro.png"),
	preload("res://assets/common/images/atlases/LogoKomputer.png"),
	preload("res://assets/common/images/atlases/LogoBiomed.png"),
]


var colors : Array[Color] = [
	Color.AQUAMARINE,
	Color.FUCHSIA,
	Color.GOLD,
	]


func _ready():
	set_refresh()


func set_accreditation() -> void:
	year.set_text(str(accreditation.year))
	
	for i in range(3):
		majors[i].hide()
		buttons[i].hide()
	
	for i in range(3):
		if i >= accreditation.majors.size():
			break
		
		# Empty? Elektro S1? Komputer S1? Biomedik S2?
		var current_major = accreditation.majors[i]
		
		## -1 = empty
		## 0 = elektro
		## 1 = komputer
		## 2 = biomedik
		var major_index = accreditation.get_major_index(current_major)
		if major_index == -1:
			majors[i].set_visible(false)
			buttons[i].set_visible(false)
			continue
		
		var current_grade : int = 0
		if i < accreditation.grades.size():
			current_grade = accreditation.grades[i]
		var grade_name = accreditation.get_grade_name(current_grade)
		
		
		var major_name = accreditation.get_major_name(current_major)
		majors[i].set_text(major_name)
		buttons[i].set_text(grade_name)
		
		buttons[i].set_button_icon(logos[major_index])
		
		majors[i].set_visible(true)
		buttons[i].set_visible(true)
		
		var current_color = int( major_name.right(1) ) - 1
		majors[i].set_self_modulate(colors[current_color])
		buttons[i].set_self_modulate(colors[current_color])


func set_refresh(p_refresh : bool = true) -> void:
	refresh = false
	if accreditation:
		set_accreditation()


func _on_gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			set_focus_mode(Control.FOCUS_CLICK)
