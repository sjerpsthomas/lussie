extends Node2D


@export var drop_scene: PackedScene


# -
func _on_right_pressed() -> void: _on_right_toggled.call_deferred(true)
func _on_right_released() -> void: _on_right_toggled.call_deferred(false)
func _on_right_toggled(up: bool) -> void:
	print("up: " + str(up))
	var count := 15 if up else 3
	
	AudioManager.play("swoosh")
	
	for i in count:
		var new_drop: Sprite2D = drop_scene.instantiate()
		if up:
			new_drop.speed = Vector2(randf_range(-40, 10), randf_range(-30, -40))
		else:
			new_drop.speed = Vector2(randf_range(-10, 10), randf_range(-10, 20))
		$Drops.add_child(new_drop)
		if up:
			new_drop.global_position = $Lussie/ArmR/Marker2D/Whisky.global_position + Vector2(-100, -60)
		else:
			new_drop.global_position = $Lussie/ArmR/Marker2D/Whisky.global_position + Vector2(100, -60)

# -
func _on_space_pressed() -> void:
	AudioManager.play("break")
	$Lussie/ArmR/Marker2D/Whisky.visible = false
	$Whisky2.visible = true
