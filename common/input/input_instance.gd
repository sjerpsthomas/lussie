class_name InputInstance
extends Node


signal pressed
signal released


# Emits the `pressed` signal.
func emit_pressed() -> void:
	pressed.emit()

# Emits the `released` signal.
func emit_released() -> void:
	released.emit()
