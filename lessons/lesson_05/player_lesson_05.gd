extends "res://private/scripts/base_player.gd"

# This script controls the player character.
# Most of the complex logic is hidden in the base script.
# You can use simple commands like move_left(), move_right(), and jump().

func _physics_process(delta: float) -> void:
	# Check for movement input
	if Input.is_action_pressed("move_left"):
		move_left()
	elif Input.is_action_pressed("move_right"):
		move_right()
		
	# Check for jump input
	if Input.is_action_just_pressed("jump"):
		jump()
	
	# Apply the physics (gravity, movement, animations)
	update_physics(delta)
