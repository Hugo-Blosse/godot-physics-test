extends Node2D


var RopeControl = preload("res://rope_control.tscn")
var RopePartStart = preload("res://rope_part_1.tscn")
var RopePartFinal = preload("res://rope_part_2.tscn")
var Ball = preload("res://ball.tscn")


var starting_position : Vector2
var final_position : Vector2


func _input(event):
	if Input.is_action_just_pressed("start"):
		starting_position = get_viewport().get_mouse_position()
	if Input.is_action_just_pressed("finish"):
		if starting_position != Vector2.ZERO:
			final_position = get_viewport().get_mouse_position()
			var rope = RopeControl.instantiate()
			add_child(rope)
			var rope_start_part = RopePartStart.instantiate()
			rope.add_child(rope_start_part)
			rope_start_part.get_node("PJ").node_a = rope_start_part.get_path()
			rope_start_part.global_position = starting_position
			var rope_final_part = RopePartFinal.instantiate()
			rope.add_child(rope_final_part)
			rope_final_part.global_position = final_position
			rope.create_rope(starting_position, final_position, rope_start_part, rope_final_part)
			starting_position = Vector2.ZERO
	if Input.is_action_just_pressed("clear"):
		starting_position = Vector2.ZERO
		for children in get_children():
			children.queue_free()
	if Input.is_action_just_pressed("ball"):
		var ball = Ball.instantiate()
		ball.global_position = get_viewport().get_mouse_position()
		add_child(ball)
