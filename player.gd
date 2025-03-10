extends CharacterBody2D
class_name Player


var speed : int = 100
var dir : int
var connected_rope_part : RigidBody2D

func _physics_process(delta):
	if connected_rope_part && !is_on_floor():
		velocity = connected_rope_part.linear_velocity
	else:
		velocity.y += 9
		velocity.x = speed * dir
	move_and_slide()


func _input(event):
	dir = Input.get_axis("left", "right")

