extends Node

enum Canciones{
	NORMAL,
	ANSIOSO,
	DERROTA,
	VICTORIA,
	MENU
}

enum Sonidos{
	PAUSA,
	DESPAUSA,
}

@onready var music_player: AudioStreamPlayer = %MusicPlayer

@export var canciones : Dictionary[Canciones, AudioStream]
@export var sonidos : Dictionary[Sonidos, AudioStream]

var snd_player_array : Array[AudioStreamPlayer]

func play_sound(sound:AudioStream):
	var _sound_player : AudioStreamPlayer = AudioStreamPlayer.new()
	_sound_player.bus = &"Sonidos"
	_sound_player.stream = sound
	_sound_player.play()
	_sound_player.finished.connect(_sound_ended.bind(_sound_player))

func play_music(music:AudioStream, time:float = 0):
	music_player.stream = music
	music_player.play(time)

func _sound_ended(sound_player:AudioStreamPlayer):
	snd_player_array.erase(sound_player)
	sound_player.queue_free()
