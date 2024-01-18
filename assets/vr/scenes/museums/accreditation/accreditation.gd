@tool
extends Resource
class_name Accreditation

@export var year : int = 2004
enum MajorEnum {
	Empty, # 0
	Teknik_Elektro_S1, # 1
	Teknik_Elektro_S2, # 2
	Teknik_Elektro_S3, # 3
	Teknik_Komputer_S1, # 4
	Teknik_Biomedik_S1, # 5
	Teknik_Biomedik_S2, # 6
}

enum Grade {
	A,
	B,
	Unggul,
	Baik,
	IAABE,
	AUNQA,
}

@export var majors : Array[MajorEnum]
@export var grades : Array[Grade]

@export var certificates : Array[Texture2D]

func get_major_index(index : int) -> int:
	if index > 4: return 2 # Biomedik
	elif index == 4: return 1 # Komputer
	elif index > 0: return 0 # Elektro
	else: return -1 # Empty


func get_grade_name(index: int) -> String:
	match index:
		0:
			return "A"
		1:
			return "B"
		2:
			return "Unggul"
		3:
			return "Baik"
		4:
			return "IAABE"
		5:
			return "AUN-QA"
		_:
			return "-"


func get_major_name(index : int) -> String:
	match index:
		1:
			return "Teknik Elektro S1"
		2:
			return "Teknik Elektro S2"
		3:
			return "Teknik Elektro S3"
		4:
			return "Teknik Komputer S1"
		5:
			return "Teknik Biomedik S1"
		6:
			return "Teknik Biomedik S2"
		_:
			return ""

