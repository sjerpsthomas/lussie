extends Node2D

var volumes = {
	"swoosh": 0,
	"break": 0,
}


# Plays the specified sound.
func play(sound_name: String) -> void:
	var sound_path := sound_name
	if not sound_path.is_absolute_path():
		sound_path = "res://common/audio/" + sound_path + ".wav"
	
	var volume: float = volumes.get(sound_name, 0.0)
	
	var player := AudioStreamPlayer2D.new()
	player.stream = load(sound_path)
	player.volume_db = volume
	
	add_child(player)
	player.play()
