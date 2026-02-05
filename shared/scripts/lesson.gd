extends Node
class_name Lesson

@export var lesson_id: String

func _ready() -> void:
	if LessonManager:
		LessonManager.start_lesson(lesson_id)
