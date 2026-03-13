extends Camera2D


@onready var start_pos := position
@onready var next_pos := position
@onready var interp_pos := position


#func _process(delta: float) -> void:
	#interp_pos = position.move_toward(next_pos, delta * 100)
	#
	#if interp_pos.is_equal_approx(next_pos):
		#next_pos = start_pos + 40 * Vector2(randf_range(-1, 1), randf_range(-1, 1))
	#
	#position = lerp(position, interp_pos, 1)
