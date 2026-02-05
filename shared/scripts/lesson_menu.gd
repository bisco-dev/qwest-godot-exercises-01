extends Control

@export var tg_label: Label
@export var lesson_button_01: Button
@export var lesson_button_02: Button
@export var lesson_button_03: Button
@export var lesson_button_04: Button
@export var lesson_button_05: Button
@export var lesson_button_06: Button
@export var lesson_button_07: Button

const translations: Dictionary = {
	"godot_exercises": {
		"en": "Godot Exercises 01",
		"fr": "Exercices Godot 01"
	},
	"lesson_01": {
		"en": "Workflow Setup",
		"fr": "Configuration de l'environnement"
	},
	"lesson_02": {
		"en": "Stand Your Ground",
		"fr": "Gardez votre position"
	},
	"lesson_03": {
		"en": "First Steps",
		"fr": "Premiers Pas"
	},
	"lesson_04": {
		"en": "Leap Of Faith",
		"fr": "Saut de la foi"
	},
	"lesson_05": {
		"en": "Beyond The Horizon",
		"fr": "Au-delà de l'horizon"
	},
	"lesson_06": {
		"en": "Defy Gravity",
		"fr": "Défier la gravité"
	},
	"lesson_07": {
		"en": "The Tuning Ritual",
		"fr": "Le rituel de réglage"
	}
}

var locale = "en"

func _ready() -> void:
	lesson_button_01.pressed.connect(_on_lesson_button_01_pressed)
	lesson_button_02.pressed.connect(_on_lesson_button_02_pressed)
	lesson_button_03.pressed.connect(_on_lesson_button_03_pressed)
	lesson_button_04.pressed.connect(_on_lesson_button_04_pressed)
	lesson_button_05.pressed.connect(_on_lesson_button_05_pressed)
	lesson_button_06.pressed.connect(_on_lesson_button_06_pressed)
	lesson_button_07.pressed.connect(_on_lesson_button_07_pressed)

func update_locale(new_locale: String) -> void:
	locale = new_locale
	tg_label.text = translations["godot_exercises"][locale]
	lesson_button_01.text = translations["lesson_01"][locale]
	lesson_button_02.text = translations["lesson_02"][locale]
	lesson_button_03.text = translations["lesson_03"][locale]
	lesson_button_04.text = translations["lesson_04"][locale]
	lesson_button_05.text = translations["lesson_05"][locale]
	lesson_button_06.text = translations["lesson_06"][locale]
	lesson_button_07.text = translations["lesson_07"][locale]


func _on_lesson_button_01_pressed() -> void:
	get_tree().change_scene_to_file("res://lessons/lesson_01/lesson_01.tscn")


func _on_lesson_button_02_pressed() -> void:
	get_tree().change_scene_to_file("res://lessons/lesson_02/lesson_02.tscn")


func _on_lesson_button_03_pressed() -> void:
	get_tree().change_scene_to_file("res://lessons/lesson_03/lesson_03.tscn")


func _on_lesson_button_04_pressed() -> void:
	get_tree().change_scene_to_file("res://lessons/lesson_04/lesson_04.tscn")


func _on_lesson_button_05_pressed() -> void:
	get_tree().change_scene_to_file("res://lessons/lesson_05/lesson_05.tscn")


func _on_lesson_button_06_pressed() -> void:
	get_tree().change_scene_to_file("res://lessons/lesson_06/lesson_06.tscn")


func _on_lesson_button_07_pressed() -> void:
	get_tree().change_scene_to_file("res://lessons/lesson_07/lesson_07.tscn")


func _on_locale_option_button_item_selected(index: int) -> void:
	match index:
		0: 
			update_locale("en")
		1: 
			update_locale("fr")
		_:
			update_locale("en")
