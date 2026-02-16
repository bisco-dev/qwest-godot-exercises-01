# Helper code to help you learn faster
extends BasePlayer

# This script controls the player character.
# Most of the complex logic is hidden in the base script.
# You can use simple commands like move_left(), move_right(), and jump().

func _physics_process(delta: float) -> void:
	# Apply the physics (gravity, movement, animations)
	update_physics(delta)
