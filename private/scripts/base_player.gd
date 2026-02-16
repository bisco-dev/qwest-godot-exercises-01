class_name BasePlayer
extends CharacterBody2D

# ===========WARNING=============
# You shouldn't be here, don't cheat! go back to Player.gd
# ===============================

signal on_jumped
signal on_landed
signal on_jump_apex_reached

@export_group("References")
@export var sprite: Sprite2D
@export var anim_tree: AnimationTree

@export_group("Movement")
@export var speed: float = 50.0
@export var gravity: float = 50.0
@export var jump_force: float = 300.0

var input_velocity: Vector2
var last_velocity: Vector2
var was_on_floor: bool

# State variables for the current frame
var _current_input_x: float = 0.0
var _jump_requested: bool = false

func move_left() -> void:
	_current_input_x = -speed
	if sprite:
		sprite.flip_h = true

func move_right() -> void:
	_current_input_x = speed
	if sprite:
		sprite.flip_h = false

func jump() -> void:
	if is_on_floor():
		_jump_requested = true

func update_physics(delta: float) -> void:
	input_velocity = velocity
	
	_apply_gravity(delta)
	
	# Apply Movement
	input_velocity.x = _current_input_x
	
	if _jump_requested:
		input_velocity.y = -jump_force
		on_jumped.emit()
		_jump_requested = false
		
	velocity = input_velocity
	
	# Capture state before move for landing logic?
	# Original code: was_on_floor = is_on_floor() then move_and_slide().
	# This means was_on_floor tracks the state *before* the move.
	was_on_floor = is_on_floor()
	
	move_and_slide()
	
	_handle_animation_logic()
	
	# Reset input for next frame
	_current_input_x = 0.0
	# Jump request is reset immediately after application

func _apply_gravity(delta: float) -> void:
	if not is_on_floor():
		if input_velocity.y < 0 and (input_velocity.y + gravity * delta) >= 0:
			on_jump_apex_reached.emit()
			
		input_velocity.y += gravity * delta
	else:
		input_velocity.y = 0.0

func _handle_animation_logic() -> void:
	if not anim_tree:
		return
		
	if abs(input_velocity.x) > 0:
		anim_tree.set("parameters/LocomotionStateMachine/conditions/is_idling", false)
		anim_tree.set("parameters/LocomotionStateMachine/conditions/is_running", true)
	else:
		anim_tree.set("parameters/LocomotionStateMachine/conditions/is_running", false)
		anim_tree.set("parameters/LocomotionStateMachine/conditions/is_idling", true)

	if is_on_floor() and not was_on_floor: # Landing
		anim_tree.set("parameters/LocomotionStateMachine/conditions/is_idling", true)
		anim_tree.set("parameters/LocomotionStateMachine/conditions/is_jumping", false)
		anim_tree.set("parameters/LocomotionStateMachine/conditions/is_falling", false)
		on_landed.emit()
		
	if not is_on_floor():
		if velocity.y < -0.1: # Jumping Up
			anim_tree.set("parameters/LocomotionStateMachine/conditions/is_jumping", true)
			anim_tree.set("parameters/LocomotionStateMachine/conditions/is_falling", false)
		elif velocity.y > 0.1: # Falling Down
			anim_tree.set("parameters/LocomotionStateMachine/conditions/is_jumping", false)
			anim_tree.set("parameters/LocomotionStateMachine/conditions/is_falling", true)
