# Helper code to help you learn faster
extends "res://private/scripts/base_player.gd"

# This script controls the player character.

func _physics_process(delta: float) -> void:
	# Check for movement input
	#if Input.is_action_pressed("move_right"):
	#	move_right()

	# TODO: Add left movement logic
	
	# Apply the physics (gravity, movement, animations)
	update_physics(delta)
