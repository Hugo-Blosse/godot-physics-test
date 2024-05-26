extends Node


var RopePart = preload("res://rope_part.tscn")


var rope_part_length : float = 4.0
var rope_parts = []
var start_angle : float = 0.0


func create_rope(rope_starting_position : Vector2, rope_final_position : Vector2, rope_part_start : RigidBody2D) -> void:
	var distance = rope_starting_position.distance_to(rope_final_position)
	var rope_length = round(distance/rope_part_length)
	start_angle = (rope_starting_position - rope_final_position).angle() - PI/2
	for rope_part in rope_length:
		create_rope_part(rope_part)
	pass	


func create_rope_part(last_part : RigidBody2D) -> void:
	var joint : PinJoint2D = last_part.get_node("PJ")
	var rope_part = RopePart.instantiate()
	rope_part.global_position = joint.global_position
	rope_part.angle = start_angle
	rope_part.last_piece = self
	add_child(rope_part)
	joint.node_a = rope_part.get_path()
	joint.node_b = last_part.get_path()

