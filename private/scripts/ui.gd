extends Control

@export var code_label: Label
@export var copy_button: Button

func set_code_label(new_code: int) -> void:
	code_label.text = str(new_code)

func _on_copy_button_pressed() -> void:
	DisplayServer.clipboard_set(code_label.text)
	
	# animate copy button saying "Copied!"
	copy_button.text = "Copied!"
	get_tree().create_timer(1.0).timeout.connect(
		func() -> void:
			copy_button.text = "Copy"
	)
