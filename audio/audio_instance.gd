class_name AudioInstance
extends AudioStreamPlayer2D

# -
func _ready() -> void:
	finished.connect(_on_finished)

# Finishes playback by removing itself.
func _on_finished() -> void:
	queue_free()
