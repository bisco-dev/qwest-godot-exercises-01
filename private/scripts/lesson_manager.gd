extends Node

@export var end_ui: Control

var code_data = preload("uid://btyx4qqsrdi8a")
var code: String
var lesson_id: String

func start_lesson(new_lesson_id: String) -> void:
	lesson_id = new_lesson_id
	end_ui.hide()
	code = code_data.codes.get(lesson_id, "")

func complete_lesson() -> void:
	end_ui.code_label.text = str(code)
	end_ui.show()


func _on_reset_button_pressed() -> void:
	get_tree().change_scene_to_file("res://lessons/"+lesson_id+"/"+lesson_id+".tscn")


func _on_exit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://shared/scenes/lesson_menu.tscn")
