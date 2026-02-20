extends Control

@export var tg_label: Label
@export var lesson_button_01: Button
@export var lesson_button_02: Button
@export var lesson_button_03: Button
@export var lesson_button_04: Button
@export var lesson_button_05: Button

const translations: Dictionary = {
	"godot_exercises": {
		"en": "Godot Platformer",
		"fr": "Platformer Godot"
	},
	"lesson_01": {
		"en": "Lesson 1: Stand Your Ground",
		"fr": "1. Gardez votre position"
	},
	"lesson_02": {
		"en": "Lesson 2: First Steps",
		"fr": "2. Premiers Pas"
	},
	"lesson_03": {
		"en": "Lesson 3: Leap Of Faith",
		"fr": "3. Saut de la foi"
	},
	"lesson_04": {
		"en": "Lesson 4: Beyond The Horizon",
		"fr": "4. Au-delà de l'horizon"
	},
	"lesson_05": {
		"en": "Lesson 5: The Tuning Ritual",
		"fr": "5. Le rituel de réglage"
	}
}

var locale = "en"

func _ready() -> void:
	lesson_button_01.pressed.connect(_on_lesson_button_01_pressed)
	lesson_button_02.pressed.connect(_on_lesson_button_02_pressed)
	lesson_button_03.pressed.connect(_on_lesson_button_03_pressed)
	lesson_button_04.pressed.connect(_on_lesson_button_04_pressed)
	lesson_button_05.pressed.connect(_on_lesson_button_05_pressed)

func update_locale(new_locale: String) -> void:
	locale = new_locale
	tg_label.text = translations["godot_exercises"][locale]
	lesson_button_01.text = translations["lesson_01"][locale]
	lesson_button_02.text = translations["lesson_02"][locale]
	lesson_button_03.text = translations["lesson_03"][locale]
	lesson_button_04.text = translations["lesson_04"][locale]
	lesson_button_05.text = translations["lesson_05"][locale]


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


func _on_locale_option_button_item_selected(index: int) -> void:
	match index:
		0: 
			update_locale("en")
		1: 
			update_locale("fr")
		_:
			update_locale("en")
