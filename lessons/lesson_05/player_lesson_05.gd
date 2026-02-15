# Helper code to help you learn faster
extends "res://private/scripts/base_player_lesson_05.gd"

# Variable to export and tweak
const speed: float = 50.0
const jump_force: float = 300.0

func _physics_process(delta: float) -> void:
	# Check for movement input
	if Input.is_action_pressed("move_left"):
		move_left(speed)
	elif Input.is_action_pressed("move_right"):
		move_right(speed)
		
	# Check for jump input
	if Input.is_action_just_pressed("jump"):
		jump(jump_force)
	
	# Apply the physics (gravity, movement, animations)
	update_physics(delta)
