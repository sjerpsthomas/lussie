extends Sprite2D

var speed: Vector2

func _process(delta: float) -> void:
	speed.y += delta * 100
	position += speed * delta * 15
	
	modulate.a -= delta * .5
	
	if global_position.y > 800:
		queue_free()
