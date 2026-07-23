class_name BodyPart
extends Sprite2D


@onready var start_position := position
@onready var start_rotation := rotation_degrees

func rand(v: float) -> float:
	return randf_range(-v, v)

func move() -> void:
	position = start_position + Vector2(rand(1), rand(1))
	rotation_degrees = start_rotation + rand(0.5)

func turn(amount: float) -> void:
	rotation_degrees += amount
	start_rotation += amount

func turn_absolute(amount: float) -> void:
	start_rotation = amount
	rotation_degrees = amount + rand(0.5)
