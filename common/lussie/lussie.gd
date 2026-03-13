extends Node2D

@onready var elements: Array[BodyPart]

var move_timer := 0.0

@export var eyes_narrow: BodyPart
@export var eyes_wide: BodyPart
@export var arm_l: BodyPart
@export var arm_r: BodyPart
@export var legs: BodyPart

const ARM_ANGLE := 130.0


# -
func _ready() -> void:
	elements.assign(get_children())

# -
func _process(delta: float) -> void:
	move_timer += delta
	if move_timer >= 0.05:
		move_timer = 0
		
		# Move elements
		for element in elements:
			element.move()


# Toggles the rotation of the left arm.
func toggle_arm_l_up() -> void:
	arm_l.turn(ARM_ANGLE)
func toggle_arm_l_down() -> void:
	arm_l.turn(-ARM_ANGLE)

# Toggles the rotation of the right arm.
func toggle_arm_r_up() -> void:
	print("up")
	arm_r.turn(-ARM_ANGLE)
func toggle_arm_r_down() -> void:
	arm_r.turn(ARM_ANGLE)

# Toggles the widening of the eyes.
func toggle_eyes_wide() -> void:
	eyes_narrow.visible = false
	eyes_wide.visible = true
func toggle_eyes_back() -> void:
	eyes_wide.visible = false
	eyes_narrow.visible = true

# Toggles the mirroring of the legs.
func toggle_legs_mirror() -> void:
	legs.flip_h = true
func toggle_legs_back() -> void:
	legs.flip_h = false
