class_name AudioManager
extends Node

static var current: AudioManager:
	get(): return (Engine.get_main_loop() as SceneTree).current_scene.get_node("AudioManager")


# Plays the specified sound
func play(sound_name: String) -> void:
	# Get the child with the corresponding name, check if it's there
	var child := get_node_or_null(sound_name) as AudioStreamPlayer2D
	assert(child != null, "Unknown sound " + sound_name + "!")
	
	# Play its sound
	child.play()
