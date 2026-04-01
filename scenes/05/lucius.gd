extends "res://common/lussie/lussie.gd"

@export var moustache: BodyPart

func turn_moustache_left() -> void:
	moustache.turn_absolute(-10)
 
func turn_moustache_right() -> void:
	moustache.turn_absolute(10)

func turn_moustache_back() -> void:
	moustache.turn_absolute(0)
