extends Sprite2D

@export var arms_folded: BodyPart
@export var arm_l: BodyPart
@export var arm_r: BodyPart


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	global_position = get_viewport().get_mouse_position()

func flip() -> void:
	scale.x *= -1
	rotation *= -1
	
	arms_folded.visible = true
	arm_l.visible = false
	arm_r.visible = false
