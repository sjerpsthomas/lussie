extends Node2D

@onready var elements: Array[BodyPart]

var move_timer := 0.0

@export var eyes_narrow: BodyPart
@export var eyes_wide: BodyPart
@export var arm_l: BodyPart
@export var arm_r: BodyPart
@export var legs: BodyPart

const ARM_ANGLE := 130.0

signal eyes_toggled(wide: bool)
signal arm_l_toggled(up: bool)
signal arm_r_toggled(up: bool)
signal legs_toggled(mirror: bool)


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

# -
func _unhandled_input(event: InputEvent) -> void:
	if event.is_echo(): return
	var pressed := event.is_pressed()
	
	var handled := false
	
	if event.is_action("arm_l"):
		toggle_arm_l(pressed)
	elif event.is_action("arm_r"):
		toggle_arm_r(pressed)
	elif event.is_action("eyes"):
		toggle_eyes(pressed)
	elif event.is_action("legs"):
		toggle_legs(pressed)
	else: handled = false
	
	if handled:
		get_viewport().set_input_as_handled()

# Toggles the widening of the eyes.
func toggle_eyes(wide: bool) -> void:
	if wide:
		eyes_narrow.visible = false
		eyes_wide.visible = true
	else:
		eyes_wide.visible = false
		eyes_narrow.visible = true
	eyes_toggled.emit(wide)

# Toggles the rotation of the left arm.
func toggle_arm_l(up: bool) -> void:
	arm_l.turn(ARM_ANGLE * (1 if up else -1))
	arm_l_toggled.emit(up)

# Toggles the rotation of the right arm.
func toggle_arm_r(up: bool) -> void:
	arm_r.turn(-ARM_ANGLE * (1 if up else -1))
	arm_r_toggled.emit(up)

# Toggles the mirroring of the legs.
func toggle_legs(mirror: bool) -> void:
	legs.flip_h = mirror
	legs_toggled.emit(mirror)
