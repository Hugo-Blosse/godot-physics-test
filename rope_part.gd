extends RigidBody2D


@onready var pj = $PJ


var connected_part
var id : int
var broken : bool


func _physics_process(delta):
	print(global_position.distance_to(connected_part.global_position))
	if global_position.distance_to(connected_part.global_position) >= 20 && !broken:
		pj.set_node_b("")
		get_parent().rope_breaks(id)
