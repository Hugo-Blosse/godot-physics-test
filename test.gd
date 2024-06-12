extends Node2D


var RopeControl = preload("res://rope_control.tscn")
var RopePartStart = preload("res://rope_part_1.tscn")
var RopePartFinal = preload("res://rope_part_2.tscn")
var Ball = preload("res://ball.tscn")


var starting_position : Vector2
var final_position : Vector2
var rope_preview


func _input(event):
	if Input.is_action_just_pressed("start"):
		if rope_preview:
			rope_preview.queue_free()
		starting_position = get_viewport().get_mouse_position()
		rope_preview = RopePartStart.instantiate()
		rope_preview.global_position = starting_position
		add_child(rope_preview)
	if Input.is_action_just_pressed("finish"):
		if starting_position != Vector2.ZERO:
			final_position = get_viewport().get_mouse_position()
			var rope = RopeControl.instantiate()
			add_child(rope)
			remove_child(rope_preview)
			var rope_start_part = RopePartStart.instantiate()
			rope.add_child(rope_start_part)
			rope_start_part.global_position = starting_position
			var rope_final_part = RopePartFinal.instantiate()
			rope.add_child(rope_final_part)
			rope_final_part.global_position = final_position
			rope.create_rope(starting_position, final_position, rope_start_part, rope_final_part)
			starting_position = Vector2.ZERO
	if Input.is_action_just_pressed("add_rope"):
		if starting_position != Vector2.ZERO:
			final_position = get_viewport().get_mouse_position()
			var closest_object = rope_preview
			for child in get_children():
				if (child.get_class() != "Node2D" && child.get_class() != "Control") && final_position.distance_to(child.global_position) < final_position.distance_to(closest_object.global_position):
					closest_object = child
			var rope = RopeControl.instantiate()
			add_child(rope)
			remove_child(rope_preview)
			var rope_start_part = RopePartStart.instantiate()
			rope.add_child(rope_start_part)
			rope_start_part.global_position = starting_position
			var rot = Node2D.new()
			rot.name = "Rotation"
			rot.global_position = closest_object.global_position
			var pj = PinJoint2D.new()
			pj.name = "PJ"
			rot.add_child(pj)
			pj.global_position = rot.global_position
			closest_object.add_child(rot)
			remove_child(closest_object)
			rope.add_child(closest_object)
			rope.create_rope(starting_position, closest_object.global_position, rope_start_part, closest_object)
			starting_position = Vector2.ZERO
	if Input.is_action_just_pressed("clear"):
		starting_position = Vector2.ZERO
		for children in get_children():
			children.queue_free()
	if Input.is_action_just_pressed("ball"):
		var ball = Ball.instantiate()
		ball.global_position = get_viewport().get_mouse_position()
		add_child(ball)
