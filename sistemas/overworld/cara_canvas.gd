extends CanvasLayer

@export var tiempo_maximo : float = 10
@export var tiempo_ans : float = 7.5
@export var tiempo_apurado : float = 2.5
@export var cara_sprite : AnimatedSprite2D

var tiempo_ahora : float = 0.

func _ready() -> void:
	tiempo_ahora = tiempo_maximo
	AudioManager.play_music(AudioManager.canciones[AudioManager.Canciones.NORMAL])
	pass
	
func _process(delta: float) -> void:	
	tiempo_ahora -= delta
	if tiempo_ahora <= tiempo_ans:
		cara_sprite.play(&"ansioso")
		AudioManager.play_music(AudioManager.canciones[AudioManager.Canciones.ANSIOSO], AudioManager.music_player.get_playback_position())
	if tiempo_ahora <= tiempo_apurado:
		#cara_sprite.play(&"apurado")
		#AudioManager.play_music(AudioManager.canciones[AudioManager.Canciones.APURADO], AudioManager.music_player.get_playback_position())
		pass
