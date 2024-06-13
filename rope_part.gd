extends RigidBody2D
class_name RopeBase


@onready var pj = $PJ


var connected_part
var id : int
var broken : bool


func _physics_process(delta):
	if (connected_part is RopeBase || connected_part is RopeEndPart) && global_position.distance_to(connected_part.global_position) >= 20 && !broken:
		pj.set_node_b("")
		get_parent().rope_breaks(id)
