@tool
extends Resource
class_name Accreditation

@export var year : int = 2004
@export_enum(
	"Teknik Elektro S1",
	"Teknik Elektro S2",
	"Teknik Elektro S3",
	"Teknik Komputer S1",
	"Teknik Biomedis S1",
	"Teknik Biomedis S2",
	) var major : String = "Teknik Elektro S1"
@export_enum(
	"A",
	"B",
	"Unggul",
	"AUN-QA",
	"Baik",
	"IAABE",
) var grade : String = "A"
@export var certificate : Texture2D = null  
