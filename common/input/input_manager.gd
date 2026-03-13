class_name InputManager
extends Node


static var current: InputManager:
	get(): return (Engine.get_main_loop() as SceneTree).current_scene.get_node("InputManager")


# -
func _unhandled_input(event: InputEvent) -> void:
	# Check if the event is a key event, and not an echo
	var key_event := event as InputEventKey
	if key_event == null or event.is_echo():
		return
	
	# Get the key code of the event
	var keycode := key_event.as_text_keycode()
	
	# Get the child with the corresponding name, check if it's there
	var child := get_node_or_null(keycode) as InputInstance
	if child == null:
		return
	
	# Emit the corresponding signal
	if event.is_pressed():
		child.emit_pressed()
	else:
		child.emit_released()
	
	# Set input as handled
	get_viewport().set_input_as_handled()
