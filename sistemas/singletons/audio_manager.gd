extends Node

@onready var music_player: AudioStreamPlayer = %MusicPlayer

var snd_player_array : Array[AudioStreamPlayer]

func play_sound(sound:AudioStream):
	var _sound_player : AudioStreamPlayer = AudioStreamPlayer.new()
	_sound_player.bus = &"Sonidos"
	_sound_player.stream = sound
	_sound_player.play()
	_sound_player.finished.connect(_sound_ended(_sound_player))

func play_music(music:AudioStream, time:float):
	music_player.stream = music
	music_player.play(time)

func _sound_ended(sound_player:AudioStreamPlayer):
	snd_player_array.erase(sound_player)
	sound_player.queue_free()
