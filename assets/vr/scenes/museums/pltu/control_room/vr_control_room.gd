@tool
extends XRToolsSceneBase

@onready var robot_snap_zone : XRToolsSnapZone = $"control-room/RobotSnap/RobotSnapZone"
@onready var blue_robotics = $"control-room/Platform/ObjectCenter/BlueRobotics"

var sediment_minigame : SedimentMinigame

# Called when the node enters the scene tree for the first time.
func _ready():
	sediment_minigame = get_tree().get_first_node_in_group("SedimentMinigame")
	sediment_minigame.connect("started", on_maintenance_started)


func on_maintenance_started() -> void:
	blue_robotics.hide()


func _on_robot_snap_zone_has_dropped():
	pass # Replace with function body.
	

func _on_robot_snap_zone_has_picked_up(what):
	print("ROV DROPPED")
	$"control-room/Plane_008/OnlineSFX".play()
	robot_snap_zone.enabled = false
	robot_snap_zone.get_node("Black").visible = false
	$SystemStatusLabel.hide()
	$Maintenance.visible = true
