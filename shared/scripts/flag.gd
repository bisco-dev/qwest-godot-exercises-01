class_name Goal
extends Area2D

func _ready() -> void:
	if not body_entered.is_connected(_on_body_entered):
		body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body is BasePlayer or body is BasePlayerLesson05:
		if LessonManager:
			LessonManager.complete_lesson()
