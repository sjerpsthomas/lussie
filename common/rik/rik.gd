extends Lussie

@export var arms_folded: BodyPart


# Toggles the folding of the arms.
func toggle_arms_folded() -> void:
	arm_l.visible = false
	arm_r.visible = false
	arms_folded.visible = true
func toggle_arms_back() -> void:
	arm_l.visible = true
	arm_r.visible = true
	arms_folded.visible = false
