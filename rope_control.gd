extends Node


var RopePart = preload("res://rope_part.tscn")


var rope_part_length : float = 10.0
var rope_parts = []
var start_angle : float = 0.0


func create_rope(rope_starting_position : Vector2, rope_final_position : Vector2, rope_start_part : StaticBody2D, rope_final_part : StaticBody2D) -> void:
	var distance = rope_starting_position.distance_to(rope_final_position)
	var rope_length = round(distance/rope_part_length)
	if rope_length < 1:
		return
	rope_start_part.global_position = rope_starting_position
	rope_start_part.get_node("Rotation/PJ").node_a = rope_start_part.get_path()
	rope_final_part.global_position = rope_final_position
	start_angle = (rope_final_position - rope_starting_position).angle()
	rope_start_part.get_node("Rotation").rotation = start_angle
	rope_final_part.get_node("Rotation").rotation = start_angle
	var rope_part = rope_start_part
	for part in rope_length:
		rope_part = create_rope_part(rope_part)
		rope_part.name = str("RopePart", part)
		rope_part.id = part
		rope_parts.append(rope_part)
		if rope_part.get_node("PJ").global_position.distance_to(rope_final_part.global_position) < rope_part_length:
			break
	rope_parts[-1].get_node("PJ").node_b = rope_final_part.get_path()
	rope_final_part.get_node("Rotation/PJ").node_a = rope_parts[-1].get_path()
	rope_parts[-1].get_node("PJ").node_a = rope_parts[-1].get_path()
	rope_parts[-1].connected_part = rope_final_part


func create_rope_part(last_part) -> RigidBody2D:
	var rope_part = RopePart.instantiate()
	var joint
	if last_part is StaticBody2D:
		joint = last_part.get_node("Rotation/PJ")
		rope_part.global_position = last_part.get_node("Rotation/PJ").global_position
	else:
		joint = last_part.get_node("PJ")
		rope_part.global_position = last_part.get_node("PJ").global_position
	rope_part.rotation = start_angle
	rope_part.connected_part = last_part
	add_child(rope_part)
	joint.node_a = rope_part.get_path()
	joint.node_b = last_part.get_path()
	return rope_part

func rope_breaks(id : int) -> void:
	if id != rope_parts[-1].id:
		rope_parts[id+1].broken = true
