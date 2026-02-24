# Helper code to help you learn faster
extends BasePlayerLesson05

# Variable to export and tweak
@export var speed: float = 120.0
@export var jump_force: float = 300.0
@export var gravity: float = 1500.0

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
	update_physics(delta, gravity)
