extends Node2D


var RopeControl = preload("res://rope_control.tscn")
var RopeStartPart = preload("res://rope_part_2.tscn")


var starting_position : Vector2
var final_position : Vector2


func _input(event):
	if Input.is_action_just_pressed("start"):
		starting_position = get_viewport().get_mouse_position()
	if Input.is_action_just_pressed("finish"):
		if starting_position != Vector2.ZERO:
			final_position = get_viewport().get_mouse_position()
			var rope = RopeControl.instantiate()
			var rope_start_part = RopeStartPart.instantiate()
			rope_start_part.global_position = starting_position
			rope.create_rope(starting_position, final_position, rope_start_part)
			starting_position = Vector2.ZERO
